function [output_mat,output_table,dates_nb] =  call_dbnomics(varargin)
	% query dbnomics.world
	% gauthier@vermandel.fr
	
	% initialization
	slugs		= [];				% list of tokens to query
	nargs		= size(varargin,2);	% number of inputs by user
	
	%%% DECOMPOSING VARARGIN
	% parse each used supplied inputs
	for i0 = 1:nargs
		
		% read the slug
		slug = varargin{i0};	
		% split the slug to get the provider/database/varname
		split_slug	= strsplit(slug,'/');
		
		%%% Check whether there are multiple countries
		idx		= strfind(slug,'+');
		if ~isempty(idx) 	% multiple countries
							% convert them into a char array
			
			% a slug looks like: provider/database/varname
			% here we split varname
			% and try to find the start and end of varname
			
			% find the first part of the current slug
			for i1 = 2:idx(1)
				% go backward to find the start of the slug
				% and first country
				slug_start = [];
				if sum(strcmp(slug(:,idx(1)-i1),{'/','.','-'})) > 0
					slug_start	= slug(1,1:(idx(1)-i1));
					countries   = slug(1,(1+idx(1)-i1):(idx(1)-1));
					break;
				end
			end
			
			% collect countries in between
			for i1 = 1:(length(idx)-1)
				country   = slug(1,(idx(i1)+1):(idx(i1+1)-1));
				countries = char(countries, country );
			end
			
			% find the last country
			for i1 = 1:(size(slug,2)-idx(end))
				% go forward to find the end of the slug
				% and last country
				if sum(strcmp(slug(:,i1+idx(end)),{'/','.','-'})) > 0
					slug_end	= slug(1,(idx(end)+i1):end);
					countries   = char( countries, slug(1,(1+idx(end)):(idx(end)+i1-1)) );
					break;
				end
				% if we reach the end, then slug_end is empty
				if i1 == (size(slug,2)-idx(end))
					slug_end = [];
					countries   = char( countries, slug(1,(1+idx(end)):end) );
				end
			end
			
			% construct the slug list
			for i1 = 1:size(countries)
				if i1 == 1 && i0 == 1
					slugs = [slug_start countries(i1,:) slug_end];
				else
					slugs = char( slugs, [slug_start countries(i1,:) slug_end] );
				end
			end
			
		else
			% no multiple countries
			% one slug
			if i0 == 1
				slugs = slug;
			else
				slugs = char(slugs,slug);
			end
			countries  = split_slug{2};
		end
	
	end
			
	%% Reading dates
	% default value for both format an names
	% the names appearing in dbnomics
	freq_names	= char('daily',			'monthly',	'quarterly',	'annual');
	% the names
	freq_format	= char('yyyy-mm-dd',	'yyyy-mm',	'yyyy-mm',		'yyyy');

	
	
	
	%%% REQUESTING MY DATA
	%%% Let's spam dbnomics!
	for i1 = 1:size(slugs,1)	% parsing each slug in slugs list
	
		% query the website
		try
			% call dbnomics using an url
			% get and unpack the json code
			%structdata = webread(['https://api.db.nomics.world/series?series_ids=' urlencode(deblank(slugs(i1,:))) ' ']);
            options = weboptions('Timeout', 30);
            structdata = webread(['https://api.db.nomics.world/v22/series/' deblank(slugs(i1,:)) '?observations=1'],options);
        catch
			error(['Connection to dbnomics failed, or slug : ' slugs(i1,:) ' not found.'])
		end
		
		% check whether dbnomics is sending a warning
		% and show it
		if isfield(structdata,'warnings')
			disp('Error: there is a problem with dbnomics:')
			warning(char(structdata.warnings))
			disp('Their server is probably down. Wait for a reboot please.')
        end
		% check if empty response from dbnomics
		if isfield(structdata.series,'data') == 0 || isfield(structdata.series.data,'period')
            if isfield(structdata,'series') && isfield(structdata.series.docs,'period')
                structdata.series.data = structdata.series.docs;
            else
                error(['Empty dataset. DBnomics is either down, either your key ' slugs(i1,:) ' is wrong.'])
            end
		end
		
		% I want my data:
		% time vector
		my_T	= structdata.series.data.period;
		% frequency name
		my_Q	= lower(structdata.series.data.x_frequency);
		% vector data
		my_D	= structdata.series.data.value; 
		
		% detecting any anomalies in vector of data:
		if strcmp(class(my_D),'cell')	% check if its a Cell array
										% if so there may be a mix of strings & real numbers
			% Find some 'NA' data which are strings
			% replace them with MATLAB's nan
			idx = find(strcmp('NA', my_D));
			if ~isempty(idx)
				my_D(idx) = num2cell(nan(length(idx),1));
			end
			% convert into a vector type
			my_D = cell2mat(my_D);
		end
		
		% Search for the frequency only once
		if i1 == 1 
		
			% 1 = 'daily' 2 = 'monthly' 3 = 'quarterly' 4 = 'annual'
			for i2 = 1:size(freq_names,1) % parse frequencies
			
				% check if we have found the frequency:
				if strcmp(my_Q,deblank(freq_names(i2,:)))
					theQ = i2;
					break; % if foud, stop loop
				end
			end
			
			% if quarterly basis, is it yyyy-mm or yyyy-qq?
			if theQ == 3 && ~isempty(strfind(my_T{1},'Q'))
				% if format is 'yyyy-qq', handle it
				freq_format(3,:) = 'yyyy-qq   ';
			end
				
		end
		% convert dates into MATLAB synthax
		theT =  datenum(my_T,freq_format(theQ,:));
	
		% stacking data into a matrix
		% maybe a dangerous business if not vectors are uneven
		if i1 == 1
			% First case: no problem
			output = [theT my_D];
			% order it by date, sometime (e.g. INSEE) providers give in inversed order
			output = sortrows(output);
		elseif isequal(output(:,1),theT) 
			% if same time vector // divine coincidence
			% than we can add them to the sample
			output = [output my_D];
		else
			% No divine coincidence
			% then we have to carefully compare data to stack them
			
			% current number of columns (excluding time)
			noutput=(size(output,2)-1);
			
			% first, merges the time reference between previous and new data
			% merge if dates are similar
			% and sort it in same order
			theTT = sort(unique([output(:,1);theT]));
			% for each period
			for i2 = 1:length(theTT)
				
				therow = theTT(i2);
				% check whether this date exists in output
				idx = find(output(:,1)==theTT(i2));
				if isempty(idx) 
					% if it does not exist, create an empty one
					therow = [therow nan(1,noutput)];
				else
					% if it already exists, take it
					therow = [therow output(idx,2:end)];
				end
				% check whether this date exists in new variable
				idx = find(theT==theTT(i2));
				if isempty(idx) 
					% if does not exist, create an empty one
					therow = [therow nan];
				else
					% if already exists, take it
					therow = [therow my_D(idx)];
				end
				
				% add this new line
				if i2 == 1
					newoutput = therow;
				else
					newoutput = [newoutput;therow];
				end				
			end
			% when we are done with building new output matrix
			% replace the old one
			output = newoutput;
		end
	end
	
	
	%%%% EXPORTING THE DATA
	%% Case 1: matrix
	% export the standard matrix
	output_mat = output;
	
	%% Case 2: table
	% replace / check the name
	for i1 = 1:size(slugs,1)
		
		if nargs == 1 	% only one arguments
						% use only country names
			rownames{i1} = countries(i1,:);
		
		else	% more than one, then add a prename
		
			% split again
			split_slug	= strsplit(deblank(slugs(i1,:)),'/');
			rownames{i1} = split_slug{3};
			
		end
		
		% check the name compatibility : no "." and "-" allowed, or starting with a nb
		rownames{i1} = regexprep(rownames{i1},'[-.]','_');
		if ~isnan(str2double(rownames{i1})) % if name starts with a number, add letters
			rownames{i1} = [ 'var_' rownames{i1}];
		end
	end

	% dates output format:
	freq_format	= char('yyyy-mm-dd',	'yyyy-mm',	'yyyy-qq',		'yyyy'); 
	therows = cellstr(datestr(output(:,1),freq_format(theQ,:)));
	
	output_table = 	array2table( output(:,2:end),...
								'VariableNames',cellstr(rownames),...
								'RowNames', therows);

	%% Case 3: vector of numbers							
	% converting the date array into a readable numeric vector
	for i1 = 1:size(therows,1)
		
		switch theQ
			case 1	% daily
			the_date = str2num(therows{i1}(1:4)) + (str2num(therows{i1}(6:7))-1)/12 + (str2num(therows{i1}(9:10))-1)/eomday(str2num(therows{i1}(1:4)),str2num(therows{i1}(6:7)))/12;
			
			case 2	% monthly
			the_date = str2num(therows{i1}(1:4)) + (str2num(therows{i1}(6:7))-1)/12;
			
			case 3	% quarterly
			the_date = str2num(therows{i1}(1:4)) + (str2num(therows{i1}(end))-1)/4;
			
			case 4	% annual
			the_date = str2num(therows{i1}(1:4));
			
		end
		 
		if i1 == 1
			dates_nb = the_date;
		else
			dates_nb = [dates_nb;the_date];
		end
	end
end



