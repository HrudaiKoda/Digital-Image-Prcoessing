clear;
[file,path]=uigetfile("*.tif*"); %for extracting filepath %
dir_path=path; %path of the input file excluding the input file name%
path=fullfile(path,file);
a=imread(path);
arr_dim=size(a);  
w=arr_dim(1);
h=arr_dim(2);
    
k_1=zeros(w+2,h+2);
        for x=1:w
            for y=1:h
                k_1(x+1,y+1)=a(x,y);
            end
        end
k_1=uint8(k_1);
    for i=2:w-1
        for j=2:h-1
            temp_0=a(i-1:i+1,j-1:j+1);
            temp_0=sort(temp_0(:));
            new_1(i-1,j-1)=temp_0(5);
        end
    end
    subplot(1,3,1),imshow(a),title("Input noise image");
subplot(1,3,2),imshow(new_1),title("noise reducation with median filter without padding");
    for i=2:w+1
        for j=2:h+1
            temp=k_1(i-1:i+1,j-1:j+1);
            temp=sort(temp(:));
            new(i-1,j-1)=temp(5);
        end
    end
subplot(1,3,3),imshow(new),title("noise reducation with median filter with padding");
imwrite(new_1,dir_path+"filtered_image_nopad.tif")
