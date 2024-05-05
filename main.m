% main.m

% Ensure the image processing package is loaded

% Load an image | These are just some diverse example images
imagePath = './Dataset/healthy/healthy (1).png';
%imagePath = './Dataset/curl_stage1/CS1 (37).png';
%imagePath = './Dataset/curl_stage1+curl_stage2+sooty/CS1_2_sooty (13).png';
%imagePath = './Dataset/curl_stage1+curl_stage2+sooty/CS1_2_sooty (1).jpg';
%imagePath = './Dataset/curl_stage2+sooty/CS2_sooty (2).jpeg';

image = imread(imagePath);


% Display the original image
figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');

% Call preprocessing
processedImage = preprocessing(image);

% Display processed image | Might commet out in future, for now allows you to see changes
subplot(1, 2, 2);
imshow(processedImage);
title('Processed Image');

% Call featureExtraction
features = featureExtraction(processedImage);

% Call classification
[accuracy, precision, recall, f1Score] = classification(features);

% Display the results
disp(['Accuracy: ', num2str(accuracy)]);
disp(['Precision: ', num2str(precision)]);
disp(['Recall: ', num2str(recall)]);
disp(['F1 Score: ', num2str(f1Score)]);

