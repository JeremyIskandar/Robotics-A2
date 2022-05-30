# Stop_Button_GUI
All functionality for the GUI included in this folder, including e-stop and collision detection

## Notes
* First set of `properties` essentially define various aspects of the GUI itself (auto-generated)
* `properties (Access = private)` has been setup based on our needs
* To access a property, type `app.` (e.g. `app.dobot = myDobotRail;`
* For sliders, `ikcon` is used to move the end-effector based on the user adjusting the slider's `changingValue`
* Stop button requests an `input` before breaking (and continuing previous movement
* `methods (Access = private)` is all auto-generated
* Basically, grey area is auto-generated, and white space has been edited by us
