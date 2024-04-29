# Cotton Leaf Disease Classification

This MATLAB *(Octave)* code is designed to classify cotton leaves as either healthy or diseased based on images. It follows a basic pipeline:

1. **Preprocessing**: Converts the image to HSV, applies histogram equalization and contrast stretching, and removes noise with a Gaussian filter.

2. **Feature Extraction**: Extracts color, shape, and GLCM (Gray-Level Co-occurrence Matrix) features from the preprocessed image.

3. **Classification**: Currently, classification is a placeholder and returns 0 for all metrics.

## Usage

1. Ensure the image processing package is loaded: `pkg load image;`

2. Set the `imagePath` variable to the path of the image you want to process.

3. Run `main.m`.

## Example Images

The `Dataset` folder contains example images of cotton leaves for both healthy and diseased plants.
