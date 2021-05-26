I = imread("image.jpg");
[l,w,d]=size(I);
I2 = I;
r=1;c=1;depth=1;
all_bits = '';

% customizing message
msg = fileread("message.txt");
msg_binary = dec2bin(msg, 8);
for row=1:size(msg_binary,1)
    all_bits = strcat(all_bits,msg_binary(row,:));
end
%disp(all_bits)

% Check if message can be inserted in given image or not
message_bits = length(all_bits);
available = l*w*d;
if (message_bits > available)
    disp("Message size is too big to insert in given Image.");
end

% Insert message in image
for bit=all_bits
    if depth > 3
        depth=1;
        c=c+1;
    end
    if c > w
        c=1;
        r=r+1;
    end
    if bit=='0' && rem(I(r,c,depth),2) ~= 0
        I2(r,c,depth) = I(r,c,depth) - 1;
    end
    if bit=='1' && rem(I(r,c,depth),2) == 0
        I2(r,c,depth) = I(r,c,depth) + 1;
    end
    depth = depth + 1;
end

% output
imwrite(I2,"stego.png");
imshowpair(I,I2, 'montage');
