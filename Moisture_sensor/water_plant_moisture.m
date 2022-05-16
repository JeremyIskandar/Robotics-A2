function [] = water_plant_moisture(dobot)
    plant_moisture_levels = [600, 600, 600, 600, 600]; % setup default moisture levels
    linearIndexes = find(plant_moisture_levels > 750); %soil is too dry
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