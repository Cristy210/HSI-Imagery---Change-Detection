folder = 'Onera Satellite Change Detection dataset - Images/abudhabi/imgs_1_rect';

% Get a list of all .tif files in the folder
filePattern = fullfile(folder, '*.tif');
tifFiles = dir(filePattern);

numFiles = length(tifFiles);
imageData = []

firstImage = imread(fullfile(folder, tifFiles(1).name));
[rows, cols] = size(firstImage);

imageData = zeros(rows, cols, numFiles, 'like', firstImage);

for k = 1:numFiles
    baseFileName = tifFiles(k).name;
    fullFileName = fullfile(folder, baseFileName);
    fprintf('Now reading %s\n', fullFileName);
    
    % Read the image
    currentImage = imread(fullFileName);
    
    % Store the image in the 3D array
    imageData(:, :, k) = currentImage;
end

disp(size(imageData));