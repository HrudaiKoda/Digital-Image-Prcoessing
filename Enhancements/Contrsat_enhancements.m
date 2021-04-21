clear;
[file,path]=uigetfile("*.tif*"); % for extracting filepath %
dir_path=path; % path of the input file excluding the input file name %
path_1=fullfile(path,file);
a=imread(path_1);
mi=min(a(:));
ma=max(a(:));
dif=ma-mi;
arr_dim=size(a);  
w=arr_dim(1);
h=arr_dim(2);
maximum_pixel_value=imfinfo(path_1).MaxSampleValue;
for i=1:w
    for j=1:h
        new(i,j)=(maximum_pixel_value/(ma-mi))*(a(i,j)-mi);
    end
end
subplot(2,3,1),imshow(a),title("Input image");
subplot(2,3,2),imshow(new),title("Contrast stretched image");
b=zeros(1,256);
n=0:255;
for j=1:w
    for k=1:h
        val=a(j,k);
        b(val+1)=b(val+1)+1;
    end
end
format long;
te=b/(w*h);
te_1=zeros(1,256);
for u=1:256
    te_1(u)=sum(te(1:u));
end
format;
te_1=255*(te_1(:));
fi=uint8(te_1(:));
for j=1:w
    for k=1:h
        new_2(j,k)=fi(a(j,k));
    end
end
uio=uint8(new_2);
subplot(2,3,3),imshow(uio),title("Histogram equalisied image");
bp=zeros(1,256);
pw=0:255;
for j=1:w
    for k=1:h
        vl=uio(j,k);
        bp(vl+1)=bp(vl+1)+1;
    end
end
bp_1=zeros(1,256);
pw_1=0:255;
for j=1:w
    for k=1:h
        vl=a(j,k);
        bp_1(vl+1)=bp_1(vl+1)+1;
    end
end
bp_2=zeros(1,256);
pw_2=0:255;
for j=1:w
    for k=1:h
        vl=new(j,k);
        bp_2(vl+1)=bp_2(vl+1)+1;
    end
end
subplot(2,3,4),bar(pw_1,bp_1),title("histogram of input image");
subplot(2,3,5),bar(pw_2,bp_2),title("histogram of constrast stretched input ");
subplot(2,3,6),bar(pw,bp),title("Modified histogram using histogram equalization image");
imwrite(new,dir_path+"contrast_stretch_out.tif");
imwrite(uio,dir_path+"histogram_equalised_out.tif")
%/////////////////////////%
clear;
[file,path]=uigetfile("*.tif*"); % for extracting filepath %
dir_path=path; % path of the input file excluding the input file name %
path_2=fullfile(path,file);
a_new=imread(path_2);
mi_2=min(a_new(:));
ma_2=max(a_new(:));
arr_dim=size(a_new);  
w_1=arr_dim(1);
h_1=arr_dim(2);
maximum_pixel_value_1=imfinfo(path_2).MaxSampleValue;
for i=1:w_1
    for j=1:h_1
        new(i,j)=(maximum_pixel_value_1/(ma_2-mi_2))*(a_new(i,j)-mi_2);
    end
end
figure(2);
subplot(2,3,1),imshow(a_new),title("Input_image_2");
subplot(2,3,2),imshow(new),title("Contrast stretched image_2");
b=zeros(1,256);
n=0:255;
for j=1:w_1
    for k=1:h_1
        val=a_new(j,k);
        b(val+1)=b(val+1)+1;
    end
end
format long;
te=b/(w_1*h_1);
te_1=zeros(1,256);
for u=1:256
    te_1(u)=sum(te(1:u));
end
format;
te_1=maximum_pixel_value_1*(te_1(:));
fi=uint8(te_1(:));
for j=1:w_1
    for k=1:h_1
        new_2(j,k)=fi(a_new(j,k));
    end
end
uio_1=uint8(new_2);
subplot(2,3,3),imshow(uio_1),title("Histogram equalisied image_2");
bp=zeros(1,maximum_pixel_value_1+1);
pw=0:maximum_pixel_value_1;
for j=1:w_1
    for k=1:h_1
        vl=uio_1(j,k);
        bp(vl+1)=bp(vl+1)+1;
    end
end
bp_1=zeros(1,256);
pw_1=0:255;
for j=1:w_1
    for k=1:h_1
        vl=a_new(j,k);
        bp_1(vl+1)=bp_1(vl+1)+1;
    end
end
bp_2=zeros(1,256);
pw_2=0:255;
for j=1:w_1
    for k=1:h_1
        vl=new(j,k);
        bp_2(vl+1)=bp_2(vl+1)+1;
    end
end
subplot(2,3,4),bar(pw_1,bp_1),title("histogram of input image_2");
subplot(2,3,5),bar(pw_2,bp_2),title("histogram of constrast stretched input_2");
subplot(2,3,6),bar(pw,bp),title("Modified histogram using histogram equalization image_2");
imwrite(new,dir_path+"contrast_stretch_out_2.tif");
imwrite(uio_1,dir_path+"histogram_equalised_out_2.tif")

