function dirac = finddirac(edges, e1, e2, e3)
    [h, w] = size(e1);
    dirac = zeros(h, w);
    
    for i = 1:h
        for j = 1:w
            if edges(i,j) == 1 && e1(i,j)>e2(i,j) && e2(i,j)>e3(i,j)
                dirac(i,j) = 1;
            end
        end
    end
                
end