% featureExtraction.m

function features = featureExtraction(processedImage)

    % Call functions to extract color, shape, and GLCM features
    colorFeatures = extractColorFeatures(processedImage);
    shapeFeatures = extractShapeFeatures(processedImage);
    glcmFeatures = extractGLCMFeatures(processedImage);

    % Combine all features into a single array
    features = [colorFeatures, shapeFeatures, glcmFeatures];
end

function colorFeatures = extractColorFeatures(processedImage)
    % Convert the image to double precision
    processedImage = im2double(processedImage);

    % Calculate the histogram of the green channel
    greenChannel = processedImage(:,:,2); % Green channel is the second channel
    greenHistogram = imhist(greenChannel);

    % Normalize the histogram
    greenHistogram = greenHistogram / max(greenHistogram);

    % Display the green histogram
    figure;
    bar(greenHistogram, 'g');
    title('Green Histogram');

    % Output an empty array
    colorFeatures = [];
end


function shapeFeatures = extractShapeFeatures(processedImage)
    % Convert the image to grayscale
    grayImg = rgb2gray(processedImage);

    edges = edge(grayImg, 'sobel');

    % Display the edges
    figure;
    imshow(edges);
    title('Edges');

    shapeFeatures = [edges];
end

function glcmFeatures = extractGLCMFeatures(processedImage)
    % Convert the image to grayscale
    grayImg = rgb2gray(processedImage);

    % Parameters for GLCM
    levels = max(grayImg(:)) + 1;   % Levels of gray in the image
    distances = 1;                  % Pixel distance for co-occurrence
    angles = 0;                     % Horizontal direction

    % Compute the Gray-Level Co-occurrence Matrix
    glcm = graycomatrix(grayImg, levels, distances, angles);

    % Initialize texture feature variables
    contrast = 0;
    homogeneity = 0;
    energy = 0;

    % Calculate texture features manually
    for i = 1:levels
        for j = 1:levels
            % Contrast: Measure of the intensity contrast between a pixel and its neighbor
            contrast += (i - j)^2 * glcm(i, j);

            % Homogeneity: Measures the closeness of the distribution of elements in GLCM to GLCM diagonal
            homogeneity += glcm(i, j) / (1 + abs(i - j));

            % Energy: Sum of squared elements in the GLCM
            energy += glcm(i, j)^2;
        end
    end

    disp("Texture Properties:");
    fprintf('Contrast: %f\n', contrast);
    fprintf('Homogeneity: %f\n', homogeneity);
    fprintf('Energy: %f\n', energy);

    % Return features as an array
    glcmFeatures = [contrast, homogeneity, energy];
end

