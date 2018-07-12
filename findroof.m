function [roof, blurred] = findroof(edges, e1, e2, e3, threshold)
    [h, w] = size(e1);
    roof = zeros(h, w);
    blurred = roof;
    
    for i = 1:h
        for j = 1:w
            if edges(i,j) == 1 && e1(i,j)<e2(i,j) && e2(i,j)<e3(i,j)
                roof(i,j) = 1;
                if e1(i,j) < threshold
                    blurred(i,j) = 1;
                end
            end
        end
    end
end