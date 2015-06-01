function [] = plot_all_skeleton_dispersions( occurences, ftrans )
% Plot all the skeletons dispersions

    if nargin < 2 % by default use the entity transformation
        ftrans = @(x)(x);
    end
    
    axis = {'PosX', 'PosY', 'PosZ'};
    titles = {'ShoulderRight', 'ElbowRight', 'WristRight', 'HandRight'};
    
    for i = 1:length(titles)
        for j = 1:length(axis)
            subplot( 3, 4, (j - 1) * 4 + i );
            disp((i - 1) * 4 + 32 + j)
            plot_dispersions( occurences, 2, (i - 1) * 4 + 32 + j, ftrans );
            title( strcat( titles{i}, ' ', axis{j} ) );
        end
    end
end

