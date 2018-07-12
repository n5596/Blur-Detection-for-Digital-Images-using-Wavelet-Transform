clc;
close all;

[h, w, s] = size(img);
img = imresize(img,[420 640]);
gray = rgb2gray(img);

[ll, lh, hl, hh] = haart2(gray, 3);
hl{1,3} = hl{1,3}(1:52,:);

Emap1 = sqrt(hh{1,1}.*hh{1,1} + hl{1,1}.*hl{1,1} + lh{1,1}.*lh{1,1});
Emap2 = sqrt(hh{1,2}.*hh{1,2} + hl{1,2}.*hl{1,2} + lh{1,2}.*lh{1,2});
Emap3 = sqrt(hh{1,3}.*hh{1,3} + hl{1,3}.*hl{1,3} + lh{1,3}.*lh{1,3});

Emax1 = localmaxima(Emap1, 8);
Emax2 = localmaxima(Emap2, 4);
Emax3 = localmaxima(Emap3, 2);

threshold = 35;

E1 = imresize(Emax1, size(gray));
E2 = imresize(Emax2, size(gray));
E3 = imresize(Emax3, size(gray));
edges = findedge(E1, E2, E3, threshold);
dirac = finddirac(edges, E1, E2, E3);
[roof, blurred] = findroof(edges, E1, E2, E3, threshold);

img = double(img);
blurry(:,:,1) = img(:,:,1) .* blurred;
blurry(:,:,2) = img(:,:,2) .* blurred;
blurry(:,:,3) = img(:,:,3) .* blurred;

non_blurred = img - blurry;
figure, imshow(uint8(blurry)); title('blurry');
figure, imshow(uint8(non_blurred)); title('non blurry');
