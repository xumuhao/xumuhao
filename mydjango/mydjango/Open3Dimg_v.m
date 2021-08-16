
 function A = Open3Dimg_v(PathName, FileName)
%open 3D .img oct retinal images
%for challenge, add res4 cancel fliplr 
%deal with the type of uint16(ushort)
fid = fopen(strcat(PathName,FileName),'r');
%disp(fid);
A=fread(fid,inf,'*uint8');%

res1=1024*512*128;
res2=1024*200*200;
res3=315*4581*217;
res4=496*512*49;
resHD=1024*1024;
res5=650*512*128;
res6=885*512*128;
res7=885*512*64;
res8=496*1024*49;
res9=480*512*128;

%length(A)
disp(length(A))

switch length(A)
  case res1,
    pixeldim = [1024 512 128];
  case res2,
    pixeldim = [1024 200 200];
  case res3,
    pixeldim = [315 4581 217];
   case res4,
    pixeldim = [496 512 49];
   case res5,
    pixeldim = [650 512 128];
    case res6,
        pixeldim = [885 512 128];
    case res7,
        pixeldim = [885 512 64];
    case res8,
        pixeldim = [496 1024 49];
    case res9,
        pixeldim = [480 512 128];
  case resHD,
    pixeldim = [1024 1024 1];
  otherwise,
    disp(['Unknown resolution. Please check the resolution of the original image: ' FileName])
    disp(fid)
    if (length(A)/resHD)==round(length(A)/resHD)
        pixeldim = [1024 1024 length(A)/resHD];
    end
end

if length(pixeldim)>0
    AScRes=pixeldim(1);
    BScH=pixeldim(2);
    BScV=pixeldim(3);
end


A=reshape(A,BScH,AScRes,BScV);
A=permute(A,[2,1,3]);
for i=1:BScV
    A(:,:,i)=fliplr(flipud(squeeze(A(:,:,i))));
end;

A=int16(A);
fclose(fid);

return