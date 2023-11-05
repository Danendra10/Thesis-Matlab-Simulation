function localMaximaPoints = FindLocalMaxima(U)
    % Initialize the array to hold the maxima points, with preallocation
    maxPointsEstimate = 100; % This is an arbitrary estimate
    localMaximaPoints = zeros(maxPointsEstimate, 2);
    numMaxima = 0;
    
    % Get the number of rows and columns in the matrix
    [rows, cols] = size(U);
    
    % Iterate through the matrix, avoiding the borders
    for i = 2:(rows-1)
        for j = 2:(cols-1)
            % Extract the neighborhood of the current element
            neighborhood = U((i-1):(i+1), (j-1):(j+1));
            
            % Check if the current element is a local maximum
            if U(i,j) > max(neighborhood(:)) && U(i,j) > neighborhood(2,2)
                numMaxima = numMaxima + 1;
                if numMaxima > maxPointsEstimate
                    % Increase the size of preallocated space as needed
                    localMaximaPoints = [localMaximaPoints; zeros(maxPointsEstimate, 2)];
                    maxPointsEstimate = maxPointsEstimate * 2;
                end
                % Add to the list if the element is greater than all its neighbors
                localMaximaPoints(numMaxima, :) = [i, j];
            end
        end
    end
    
    % Trim the unused preallocated space
    localMaximaPoints = localMaximaPoints(1:numMaxima, :);
end
