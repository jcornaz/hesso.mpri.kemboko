function [] = plot_all_skeleton_dispersions( occurences )
% Plot all the skeletons dispersions

    axis = {'PosX', 'PosY', 'PosZ'};
    titles = {'ShoulderRight', 'ElbowRight', 'WristRight', 'HandRight'};
    
    for i = 1:length(titles)
        for j = 1:length(axis)
            subplot( 3, 4, (j - 1) * 4 + i );
            plot_dispersions( occurences, 2, (i - 1) * 4 + 17 + j );
            title( strcat( titles{i}, ' ', axis{j} ) );
        end
    end
end

