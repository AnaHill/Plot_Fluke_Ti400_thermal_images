# Plot Fluke Ti400 thermal images as contour plot using MATLAB
Method to plot Thermal images from Fluke Ti400 using MATLAB.
If used, please cite:
Skogberg, A., Siljander, S., Mäki, A. J., Honkanen, M., Efimov, A., Hannula, M., ... & Kallio, P. (2022). Self-assembled cellulose nanofiber–carbon nanotube nanocomposite films with anisotropic conductivity. _Nanoscale_.

Basic workflow is following:
- export thermal images (.IS2) as .csv files using Fluke Smart View
- encode, if needed, exported .csv files to UTF8 using `convert_csv_to_utf8.ps1` using Powershell
- plot images using MATLAB and file `create_contour_plot.m`

Example figure  
![Example heatmap image](Heatmap_of__sample1_and_sample2.png)
