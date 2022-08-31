load parity_matrix;
load generator_matrix;
load EncodedDataLdpc;

if randi([0, 1])
	P = G(769:end, :);
else
	P = H(:, 1:768);
end

Pt = P.';

idx = 3;
encMat_1 = encDataMatrix(idx:768+idx-1, :);

G_bar = xor_jge(encMat_1);
Pt_bar = G_bar(:, 769:end);

encMat_2 = mod(msgVec(idx:768+idx-1, :) * G_bar, 2);

clc;
mean(mean(G_bar(:, 1:768) == eye(768)))
mean(mean(Pt_bar == Pt))
mean(mean(encMat_1 == encMat_2))
