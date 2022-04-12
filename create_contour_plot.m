%% Plotting thermal images
% choosing proper .csv file
filenames={'sample1','sample2'}; 
% filenames={'sample1'}; % if choosing only one
% set minimum Temperature
minT=20; 
% minT=25;

data = [];
for pp = 1:length(filenames)
    data{end+1,1} = importfile([filenames{pp},'.csv'], 4, 243);
end

[fig_parameters] = cal_subfig_parameters(data);
sub_fig_rows = fig_parameters(1); sub_fig_cols = fig_parameters(2);
subtitles=[];
for pp = 1:length(filenames)
    subtitles{end+1}=filenames{pp};
end
% subtitles={'a','b'};
% subtitles={'',''};

% set data2 so that all data values below minT are set to minT
data2 = []; 
for pp = 1:length(filenames)
    data2{end+1,1} = importfile([filenames{pp},'.csv'], 4, 243);
    data2{end}(data2{end} < minT) = minT;
end

temperature_range = [min(min(min(data2{:})))-3 max(max(max(data2{:})))+3];
temperature_range = [min(min(min(data2{:}))) max(max(max(data2{:})))];
% temperature_range = [25 40]
% temperature_range = [20 50];
% temperature_range = [20 60];

figure, 
for pp=1:length(data)
    subplot(sub_fig_rows, sub_fig_cols, pp)
    contourf(data{pp,1}), 
    contourf(data{pp,1},'linecolor','none'), 
    t = title(subtitles{pp});
    t.HorizontalAlignment = 'left';
    t.Interpreter = 'none';
    set(t, 'units', 'normalized');
    h1 = get(t, 'position');
    set(t, 'position', [0 h1(2) h1(3)])
    set(gca,'XColor', 'none','YColor','none')
    axis equal,     
    colormap(hot)
    caxis([temperature_range])

end
%colorbar
fig = gcf; 
if length(data) == 2
    outpos_cm = [5 5 8.5+1.4+2 10];
    set(fig,  'units','centimeters','position',outpos_cm)
    hp5 = get(subplot(sub_fig_rows, sub_fig_cols, pp),'Position');
    colorbar('Position',   [hp5(1)+hp5(3)-0.18  hp5(2)  0.05  hp5(2)+hp5(3)*0.9])
elseif length(data) == 1
    outpos_cm = [5 5 8.5+1.4+2 10];
    set(fig,  'units','centimeters','position',outpos_cm)
    colorbar
end


NewFontSize = 12;
NewFont = 'Arial';
set(findall(fig, '-property', 'fontsize'), 'fontsize', NewFontSize)
set(findall(fig, '-property', 'font'), 'font', NewFont)
% cpfig
%% saving as .png, export_fig.m required
fig_name = 'Heatmap_of__';
% fold = 'set_some_folder_address\';
fold = [pwd,'\']; % current folder
for pp=1:length(data)
    if pp < length(data)
        fig_name=[fig_name,filenames{pp},'_']; 
    else
        fig_name=[fig_name,'and_',filenames{pp}]; 
    end
end

set(gcf, 'Color', 'w');
export_fig([fold,fig_name], '-r300','-png') 
disp('exported png')
