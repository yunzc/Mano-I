%launcharduino
a = arduino();
s1 = servo(a,'D9');
s2 = servo(a,'D6');
s3 = servo(a,'D3');
writePosition(s3,0);
writePosition(s2,0.2);
disttoangfunction(14);