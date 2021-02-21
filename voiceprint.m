function peaks=voiceprint(clip,fs)
size_clip=size(clip);
if(size_clip(2)==2)
clip=mean(clip,2);
end

clip=clip-mean(clip);
clip=resample(clip,8000,fs);
window=8000*64*0.001;
noverlap=8000*32*0.001;
nfft=window;
[S, F, T]=spectrogram( clip , window, noverlap , nfft , 8000 ) ;



cs01=circshift(S,[0 1]);
cs10=circshift(S,[1 0]);
cs11=circshift(S,[1 1]);
cs_10=circshift(S,[-1 0]);
cs_1_1=circshift(S,[-1 -1]);
cs0_1=circshift(S,[0 -1]);
cs1_1=circshift(S,[1 -1]);
cs_11=circshift(S,[-1 1]);

P = double( ((S- cs01) > 0)&((S- cs10) > 0)&((S- cs11) > 0)&((S- cs_10) > 0)&((S- cs_1_1) > 0)&((S-cs0_1) > 0)&((S-cs1_1) > 0)&((S-cs_11) > 0) ) ; 
  S_max=P.*S;
 


S_max_size=size(S_max);
S_max_reshape=reshape(S_max,1,S_max_size(1)*S_max_size(2));
S_max_sort=sort(S_max_reshape,'descend');
index=ceil(T(end)*30);
S_max_lim=S_max_sort(index);

peaks=(double(S_max>=S_max_lim).*S_max);
 


%%a=peak_to_pair(peaks);






end