% Rentang nilai x untuk diplot
x = linspace(-100, 100, 1000);

% Menghitung nilai tanh dari x
y = tanh(x);

% Membuat plot
figure;
plot(x, y);
title('Visualisasi Fungsi tanh');
xlabel('x');
ylabel('tanh(x)');

% Memperlihatkan grid
grid on;
