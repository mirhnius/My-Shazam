function song_name = match_clip(SONGID_DB,hash)
array=[];
clip_address=input('Enter complete song address (exp:  C:\aa.mp3)','s');
[clip,fs] = audioread(clip_address);

 peaks = voiceprint(clip,fs);
 pairpeaks = peak_to_pair(peaks);
 
    test=zeros(size(pairpeaks));
    test(:,3) = pairpeaks(:,1);
    test(:,1) = pairpeaks(:,3);
    test(:,2) = pairpeaks(:,4);
    
    test(:,4) = pairpeaks(:,2)-pairpeaks(:,1);
    pairpeaks = test;
    
    sizepp=size(pairpeaks);
    for i=1:sizepp(1)
        indx = h_func(pairpeaks(i,1),pairpeaks(i,2),pairpeaks(i,4));
        array=[hash{indx,1},array];
               
    end
 
    song_ID=mode(array);
        song_name = SONGID_DB{song_ID};
    
end