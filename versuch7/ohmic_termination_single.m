function [Rmat] = ohmic_termination_single(np, R)
% Return R matrix for ohmic termination at one single edge

Rmat = zeros(3*np);
Rmat(2405,2405) = R;

end
