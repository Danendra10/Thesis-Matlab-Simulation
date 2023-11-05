function [globalMin, rowIndex, colIndex] = FindGlobalMinima(matrix)
    % Find the global minimum in the matrix
    [minVals, rowIndices] = min(matrix);  % Get the minima for each column
    [globalMin, colIndex] = min(minVals); % Get the minimum of these minima
    rowIndex = rowIndices(colIndex);      % Get the corresponding row index
end
