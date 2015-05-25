function [ res ] = fourierTransform( vector )
    tmp = abs(fft(vector));
    res = std(tmp);
end

