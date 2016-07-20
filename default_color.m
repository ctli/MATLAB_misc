function out = default_color(in)

color_code = [0 114 189 % blue
217 83 25 % red
237 177 32 % yellow
126 47 142 % purple
119 172 48 % green
77 190 238 % light blue
162 20 47 % dark red
]/255;

out = color_code(1:in, :);
end