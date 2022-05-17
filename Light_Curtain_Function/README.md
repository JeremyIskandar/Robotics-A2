# Light_Curtain_Function
An example of how to implement light curtain from main (when envinronment and robot has been initalised already):

```
%% Light Curtain

myLightCurtain;

%-->Person model has over 17k vertices so takes long time to process!
%person = PlaceObject('person.ply',[0,-1.5,-0.7]);
%person_vertices = get(person,'Vertices');

sphere_points = mySphere(0,-1.7,0.55);

collision_point = LightCurtainCollision(light_curtain_points,sphere_points);    %you can substitute "sphere_points" with "person_vertices"

```

Returns:
* "--> Flag not tripped - no collision"

or

* "--> Flag tripped - collision detected at:"
* [x,y,z] %collision point
