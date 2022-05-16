function [] = water_plant_moisture(dobot)       %reference for arduino hardware application: https://lastminuteengineers.com/soil-moisture-sensor-arduino-tutorial/
    %plant_moisture_levels = [600, 600, 600, 600, 600]; % setup default moisture levels
    range = 600:900; %create range for random number generator, in real application we would use data from Arduino moisture sensors
    plant_moisture_levels = randsample(range,5);    %develops random number for moisture values between range
    linearIndexes = find(plant_moisture_levels > 750); %soil is too dry
    display_moisture_levels = ['The current moisture levels of the plants are ', num2str(plant_moisture_levels)];
    disp(display_moisture_levels);
    disp('If the moisture levels are greater than 750, the soil is too dry :(');
    size_LI = size(linearIndexes);
    if size_LI(2) > 0
        for x = 1:1:size_LI(2)
            which_plant = linearIndexes(x);
            y = ['Plant ',num2str(which_plant) ,' is too dry, I will water it :)'];
            disp(y)
            water_plant_2(dobot, which_plant);
        end
    else
        disp('No plants need to be watered right now :)')
    end
end