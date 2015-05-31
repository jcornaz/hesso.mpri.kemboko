function [ res ] = fourierTransform( vector )
% Return the standard deviation of a fourier transform applyed on the
% argument

    tmp = abs(fft(vector));
    res = [mean(tmp),std(tmp)];
end

