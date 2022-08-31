function [ret_mat] = xor_gje(inp_mat)
	size_mat = size(inp_mat);
	% init iterator
	for j = 1:size_mat(1)
		markup = 0;
		if inp_mat(j, j) ~= 1
			markup = 1;
		end
		% iterate over column elements below diagonal
		for i = j+1:size_mat(1)
			if inp_mat(i, j) == 1
				% cater for mark up
				if markup == 1
					inp_mat(j, :) = bitxor(inp_mat(i, :), inp_mat(j, :));
					markup = 0;
				end
				% perform bitxor elimination
				inp_mat(i, :) = bitxor(inp_mat(i, :), inp_mat(j, :));
			end	
		end
		% iterate over column elements above diagonal
		for i = j-1:-1:1
			if inp_mat(i, j) == 1
				% cater for mark up
				if markup == 1
					inp_mat(j, :) = bitxor(inp_mat(i, :), inp_mat(j, :));
					markup = 0;
				end
				% perform bitxor elimination
				inp_mat(i, :) = bitxor(inp_mat(i, :), inp_mat(j, :));
			end	
		end
	end
	% return
	ret_mat = inp_mat;
end