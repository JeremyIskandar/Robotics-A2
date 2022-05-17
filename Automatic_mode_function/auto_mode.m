function [] = auto_mode(dobot)       %automatic watering mode function
    for plant_switch = 1:1:5        % Water plants 1 -> 5 in order
        water_plant_2(dobot, plant_switch);
    end
end