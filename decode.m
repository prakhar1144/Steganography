I = imread("stego.png");
msg = '';
msg_stream = '';
[l,w,d]=size(I);
r=1;c=1;depth=1;

while true
    if depth > 3
        depth=1;
        c=c+1;
    end
    if c > w
        c=1;
        r=r+1;
    end
    val = dec2bin(I(r, c, depth),8);
    msg_stream = strcat(msg_stream, val(8));
    if length(msg_stream) == 8
        word = char(bin2dec(msg_stream));
        %disp(word);
        if word == '%'
            break
        end
        msg = [msg word];
        msg_stream = '';
    end
    depth = depth + 1;
end

disp(msg);