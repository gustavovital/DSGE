function [residual, g1, y, var_index] = static(nblock, y, x, params)
  residual = [];
  g1 = [];
  var_index = [];

  switch nblock
    case 1
      [residual, y, g1] = dsge.block.static_1(y, x, params);
    case 2
      [residual, y, g1] = dsge.block.static_2(y, x, params);
    case 3
      [residual, y, g1] = dsge.block.static_3(y, x, params);
    case 4
      [residual, y, g1] = dsge.block.static_4(y, x, params);
    case 5
      [residual, y, g1] = dsge.block.static_5(y, x, params);
    case 6
      [residual, y, g1] = dsge.block.static_6(y, x, params);
  end
end
