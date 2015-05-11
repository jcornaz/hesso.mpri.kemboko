function [] = plot_all_xsens_dispersions( occurrences, xsensid )

    titles = {'XAcc', 'YAcc', 'ZAcc', 'YawSpeed', 'PitchSpeed', 'RollSpeed', 'Yaw', 'Pitch', 'Roll', 'XMag', 'YMag', 'ZMag', 'QuatX', 'QuatY', 'QuatZ', 'QuatW'};
    
    for i = 1:16

        if i >= 13
            j = i + 1;
        else
            j = i;
        end

        subplot( 4, 4, i );
        plot_dispersions( occurrences, 1, (xsensid - 1) * 17 + j );
        title( titles{i} );
    end
end