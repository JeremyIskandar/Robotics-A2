# Visual_Servoing_Function
This function initialises visual servoing feature for the dobot

## Notes
* `pStar` defines the pixel points for the image (pentagon) in 2D
* `P` defines the 3D points in the camera's frame that is the target
* `lambda` defines the gain of the controller - lower values takes more time (but is smoother)
* `epsilon` defines the measure of manipulability (for DLS)
