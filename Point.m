classdef Point
    %POINT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        X
        Y
        Coord
    end
    
    methods
        function obj = Point(x, y)
            obj.X = x;
            obj.Y = y;
            obj.Coord = [x, y];
        end
    end
end

