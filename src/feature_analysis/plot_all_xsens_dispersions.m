function [] = plot_all_xsens_dispersions( occurrences, xsensid )
% Plot all the features disperions for a given xsensor (except the
% barometer feature)

    titles = {'XAcc', 'YAcc', 'ZAcc', 'YawSpeed', 'PitchSpeed', 'RollSpeed', 'Yaw', 'Pitch', 'Roll', 'XMag', 'YMag', 'ZMag', 'QuatX', 'QuatY', 'QuatZ', 'QuatW'};
    
    for i = 1:16

        % avoid the barometer feature (Obviously completely useless)
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