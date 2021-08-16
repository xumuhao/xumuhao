function [ A,B] = ChanCreateImg( fold_path )
%UNTITLED 此处显示有关此函数的摘要
% create OCT imange and reference image for challenge
dir_folder_list=dir(fold_path);
folder_list=dir_folder_list(3:end);
num=length(folder_list);
for i=1:num
	newFolder_name=folder_list(i).name;
    disp(newFolder_name);
    path=strcat(fold_path,'\',newFolder_name);
	sgc_exist=exist(path,'file');
    newFolder_name = ['OCTimgs\',fold_path,'\',newFolder_name];
    disp(newFolder_name);
	if(sgc_exist==7)
		oct=strcat(newFolder_name,'\oct');
		refer=strcat(newFolder_name,'\refer');
        disp(oct);
        disp(path);
		mkdir(oct);
		mkdir(refer);
        if(isempty(strfind(fold_path,'Cirrus')))
            A=Open3Dimg_v(strcat(path,'\'),'oct.img');
            %B=Open3Dimg_v2(strcat(path,'\'),'reference.raw');
        else
		A=Open3Dimg_v2(strcat(path,'\'),'oct.img');
		%B=Open3Dimg_v2(strcat(path,'\'),'reference.raw');
        end
        [m,n,z]=size(A);
		for j=1:z
          if(isempty(strfind(fold_path,'Cirrus')))
         img=A(:,:,j); 
         minN=double(min(img(:)));
         maxN=double(max(img(:)));
          img=((double(img))-minN)/(maxN-minN);
         else
        img=A(:,:,j);
         end
		%ref=B(:,:,j)*64;
		imwrite(img,strcat(oct,'\',num2str(j),'.bmp'));
		%imwrite(ref,strcat(refer,'\',num2str(j),'.bmp'));
        end
   end

end
end
