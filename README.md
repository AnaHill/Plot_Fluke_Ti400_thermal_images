# Plot Fluke Ti400 thermal images as contour plot using MATLAB
Method to plot Thermal images from Fluke Ti400 using MATLAB

Basic workflow is following:
- export thermal images (.IS2) as .csv files using Fluke Smart View
- encode, if needed, exported .csv files to UTF8 using `convert_csv_to_utf8.ps1` using Powershell
- plot images using MATLAB and file `create_contour_plot.m`