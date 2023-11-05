function [globalMax, rowIndex, colIndex] = FindGlobalMaxima(matrix)
    % Find the global maximum in the matrix
    [maxVals, rowIndices] = max(matrix);  % Get the maxima for each column
    [globalMax, colIndex] = max(maxVals); % Get the maximum of these maxima
    rowIndex = rowIndices(colIndex);      % Get the corresponding row index
end
