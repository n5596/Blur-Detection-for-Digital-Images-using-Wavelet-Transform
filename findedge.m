function edge = findedge(e1, e2, e3, threshold)
    [h, w] = size(e1);
    edge = zeros(h, w);
    
    for i = 1:h
        for j = 1:w
            if e1(i,j) > threshold || e2(i,j) > threshold || e3(i,j) > threshold
                edge(i,j) = 1;
            end
        end
    end
end