function localMaximaPoints = FindLocalMaxima(U)
    [rows, cols] = size(U);
    localMaximaPoints = []; % Initialize an empty array to hold the maxima points
    
    % Iterate over the interior points of the matrix, skipping the border
    for i = 2:(rows-1)
        for j = 2:(cols-1)
            % Extract the neighborhood of the current point
            neighborhood = U(i-1:i+1, j-1:j+1);
            
            % Check if the current point is a local maxima
            if U(i,j) == max(neighborhood(:)) && sum(U(i,j) == neighborhood(:)) == 1
                % If it is a local maxima, add it to the list
                localMaximaPoints = [localMaximaPoints; [i, j]];
            end
        end
    end
end
