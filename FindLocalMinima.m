function localMinima = FindLocalMinima(Utotal)
    % Dapatkan ukuran matriks potensial
    [rows, cols] = size(Utotal);
    disp('rows')
    disp(rows)
    
    % Preallocate for speed, assuming a maximum of rows*cols/2 local minima for simplicity
    localMinima = zeros(rows*cols/2, 3);
    minimaCount = 0;

    % Periksa setiap titik kecuali pinggiran
    for i = 2:(rows-1)
        for j = 2:(cols-1)
            % Dapatkan nilai potensial untuk titik saat ini
            currentVal = Utotal(i, j);
            
            % Dapatkan nilai tetangga
            neighbors = Utotal((i-1):(i+1), (j-1):(j+1));
            
            % Jika nilai saat ini lebih kecil dari semua tetangganya, ini adalah local minimum
            if currentVal < min(neighbors(:))
                % Tambahkan ke daftar local minima, increase minimaCount
                minimaCount = minimaCount + 1;
                localMinima(minimaCount,:) = [i, j, currentVal];
            end
        end
    end
    
    % Trim the localMinima array to the number of minima found
    localMinima = localMinima(1:minimaCount,:);
end
