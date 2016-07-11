% interpolate between two color code
function color_code = color_code_interp(color_a, color_b, interval)

if ~isnumeric(color_a)
    switch color_a
        case 'y'
            color_code_a = [1 1 0];
        case 'm'
            color_code_a = [1 0 1];
        case 'c'
            color_code_a = [0 1 1];
        case 'r'
            color_code_a = [1 0 0];
        case 'g'
            color_code_a = [0 1 0];
        case 'b'
            color_code_a = [0 0 1];
        case 'w'
            color_code_a = [1 1 1];
        case 'k'
            color_code_a = [0 0 0];
    end
else
    color_code_a = color_a;
end

if ~isnumeric(color_b)
    switch color_b
        case 'y'
            color_code_b = [1 1 0];
        case 'm'
            color_code_b = [1 0 1];
        case 'c'
            color_code_b = [0 1 1];
        case 'r'
            color_code_b = [1 0 0];
        case 'g'
            color_code_b = [0 1 0];
        case 'b'
            color_code_b = [0 0 1];
        case 'w'
            color_code_b = [1 1 1];
        case 'k'
            color_code_b = [0 0 0];
    end
else
    color_code_b = color_b;
end

color_code_1 = linspace(color_code_a(1), color_code_b(1), interval);
color_code_2 = linspace(color_code_a(2), color_code_b(2), interval);
color_code_3 = linspace(color_code_a(3), color_code_b(3), interval);

color_code = [color_code_1', color_code_2', color_code_3'];


