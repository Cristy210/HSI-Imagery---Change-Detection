folder = 'Onera Satellite Change Detection dataset - Images/abudhabi/imgs_1_rect';

% Get a list of all .tif files in the folder
filePattern = fullfile(folder, '*.tif');
tifFiles = dir(filePattern);

numFiles = length(tifFiles);

tifFiles = tifFiles(arrayfun(@(x) endsWith(x.name, '.tif'), tifFiles));

multiPageTiffFile = fullfile(folder, 'multipage.tif');

for k = 1:length(tifFiles)
    % Read the image
    fileName = fullfile(folder, tifFiles(k).name);
    img = imread(fileName);

    % Write the image to a multi-page TIFF file
    if k == 1
        imwrite(img, multiPageTiffFile, 'WriteMode', 'overwrite', 'Compression', 'none');
    else
        imwrite(img, multiPageTiffFile, 'WriteMode', 'append', 'Compression', 'none');
    end
end

wavelengths = [443, 490, 560, 665, 705, 740, 783, 842, 865, 940, 1375, 1610, 2190];

wavelengthsFile = fullfile(folder, 'wavelengths.txt');
writematrix(wavelengths', wavelengthsFile);

