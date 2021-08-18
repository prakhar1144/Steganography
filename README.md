# Steganography
<p>Steganography is the technique of hiding secret data within an ordinary, non-secret, file or message in order to avoid detection; the secret data is then extracted at its destination</p>
<p>I have prepared a simple MATLAB implementation of Steganography with images </p>

### Steps Involved

* Put your secret message (text here) in [mesaage.txt](https://github.com/prakhar1144/Steganography/blob/main/message.txt)
* Select the image under which you want to hide your message.
* Run the [encode.m]() script to encode the secret message in image provided.
* Previous step will generate a [stego]() image, which looks exactly same as the [image]() provided, but contains the secret message encoded
* Run the [decode.m]() script to get the secret message encoded in [stego] image.

### How it happens
> <h4> Here we use the Least Significant Bit Method of Steganography</h4>
* In this method we store the secret message in the least significant bit of pixels of image
* For a 24 bit color image, each pixel is composed of RGB(8 bit each)
* We convert the message in binary, then take each bit and put them in LSB of R-G-B of each pixel. So each pixel stores 3 bit of secret message
* Since we are storing the info in LSB, so image is negligibly distorted.
* We store all the bits of secret message in image's LSB of R-G-B of each pixel and in the end store a delimiter ,which helps during decoding.
* Now while decoding, we retrieve LSB of R-G-B of each pixel of image in sequence and keep appending those bits.
* Finally convert those bits into char, hence we get the secret message.
