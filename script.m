

file="/Users/ali/Desktop/apr/atlss3d/IIT_GM_Desikan_prob_256.nii";
savepath="/Users/ali/Desktop/apr/atlss3d/coordinates.mat"
a=niftiread(file);
whos a
mat=[1 0 0 -128; 0 1 0 -145; 0 0 1 -109; 0 0 0 1] 
info=niftiinfo(file)
info.PixelDimensions
info.raw
info.raw.intent_code

coordinates = zeros(size(a,4),4);

for j=1:size(a,4)
    %j=50
b=a(:,:,:,j);
ind = find(b);
[i1, i2, i3] = ind2sub(size(b), ind);
temp=mat*transpose([median(i1) median(i2) median(i3) 1]);
coordinates(j,:)=[j transpose(temp(1:3))];
end
save(savepath, 'coordinates')






%{

file="/Users/ali/Desktop/apr/atlss3d/IIT_GM_Desikan_prob.nii";
savepath="/Users/ali/Desktop/apr/atlss3d/coordinates.mat"
a=niftiread(file);
whos a
mat=[-1 0 0 90; 0 1 0 -126; 0 0 1 -72; 0 0 0 1];
info=niftiinfo(file)
info.PixelDimensions
info.raw
info.raw.intent_code

coordinates = zeros(size(a,4),4);

for j=1:size(a,4)
    %j=50
b=a(:,:,:,j);
ind = find(b);
[i1, i2, i3] = ind2sub(size(b), ind);
temp=mat*transpose([mean(i1) mean(i2) mean(i3) 1]);
coordinates(j,:)=[j transpose(temp(1:3))];
end
save(savepath, 'coordinates')

%}




%{

file="/Users/ali/Desktop/apr/atlss3d/IIT_GM_Desikan_prob_256.nii";
savepath="/Users/ali/Desktop/apr/atlss3d/coordinates.mat"
a=niftiread(file);
whos a
mat=[1 0 0 -128; 0 1 0 -145; 0 0 1 -109; 0 0 0 1] 
info=niftiinfo(file)
info.PixelDimensions
info.raw
info.raw.intent_code

coordinates = zeros(size(a,4),4);

for j=1:size(a,4)
    %j=50
b=a(:,:,:,j);
ind = find(b);
[i1, i2, i3] = ind2sub(size(b), ind);
temp=mat*transpose([(max(i1)+min(i1))/2 (max(i2)+min(i2))/2 (max(i3)+min(i3))/2 1]);
coordinates(j,:)=[j transpose(temp(1:3))];
end
save(savepath, 'coordinates')
%}