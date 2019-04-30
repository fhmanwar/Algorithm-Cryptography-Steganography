function P=DeCaesar(C,k)
 C=abs(C);
% plain= mod (C-3-'a',26) + 'a'; 

key=double(k);
 extendedKey = '';
 if length(k) < length(C)
     keyReps = floor(length(C)/length(k));
     extendedKey = [repmat(k,1,keyReps) k(1:rem(length(C),length(k)))];
 else
     extendedKey = k(1:length(C));
 end
% Vigenere ciphere Decryption 
ciphered_num=C-97;
k1=extendedKey-97;
deciphered_num=rem(ciphered_num-k1,26);
deciphered_text=char(deciphered_num+97);

plain= mod (deciphered_text-3-'a',26) + 'a'; 
P=char(plain)