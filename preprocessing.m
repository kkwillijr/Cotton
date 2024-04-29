% preprocessing.m

function processedImage = preprocessing(image)
  % Convert the image to the HSV
  hsvImage = rgb2hsv(image);

  % Resize image 256 x 256 | Distorts image, will come back to this later
  %hsvImage = imresize(hsvImage, [256 256]);

  % Apply histogram equalization to intensity
  hsvImage(:,:,3) = histeq(hsvImage(:,:,3));

  % Apply contrast stretching to intensity
  V = hsvImage(:,:,3);
  V = imadjust(V, stretchlim(V, 0.05), []);
  hsvImage(:,:,3) = V;

  % Convert the image to RGB
  rgbImage = hsv2rgb(hsvImage);

  %Remove noise with gaussian filter
  h = fspecial('gaussian', [2 2], 2);  % Create a Gaussian filter
  gaussianFiltered = imfilter(rgbImage, h, 'replicate');  % Apply the Gaussian filter

  processedImage = gaussianFiltered;
end

