function C=Caesar(P,k)
tic
P=abs(P);
ciper= mod(P+3-'a',26) + 'a';
length(ciper)
 extendedKey = '';
 if length(k) < length(ciper)
     keyReps = floor(length(ciper)/length(k));
     extendedKey = [repmat(k,1,keyReps) k(1:rem(length(ciper),length(k)))];
 else
     extendedKey = k(1:length(ciper));
 end
% Vigenere ciphere Encryption
plain_num=ciper-97;
k1=extendedKey-97;
ciphered_num=rem(plain_num+k1,26);
ciphered_text=char(ciphered_num+97);
C=char(ciphered_text);
toc