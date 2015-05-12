function [] = plot_all_xsens_dispersions( occurences, xsensid )
% Plot all the features disperions for a given xsensor (except the
% barometer feature)

    titles = {'XAcc', 'YAcc', 'ZAcc', 'YawSpeed', 'PitchSpeed', 'RollSpeed', 'Yaw', 'Pitch', 'Roll', 'XMag', 'YMag', 'ZMag', 'QuatX', 'QuatY', 'QuatZ', 'QuatW'};
    
    for i = 1:16

        % Avoid the barometer feature (obviously useless)
        if i >= 13
            j = i + 1;
        else
            j = i;
        end

        subplot( 4, 4, i );
        plot_dispersions( occurences, 1, (xsensid - 1) * 17 + j );
        title( titles{i} );
    end
end