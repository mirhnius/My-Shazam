clc
clear

songsFile = uigetdir('C:\Users\AS\Desktop\ss P2 phase2\Songs','choose songs folder');
SONGID_DB = get_mp3_list(songsFile);
save('SONGID_DB.mat','SONGID_DB');
max_h=h_func(255,255,31);
hash = cell(max_h,2);
for m=1:length(SONGID_DB)
    [clip,fs] = audioread([songsFile,'/' , SONGID_DB{m}]);
    peaks = voiceprint(clip,fs);
    pairpeaks = peak_to_pair(peaks);
    
    test=zeros(size(pairpeaks));
    test(:,3) = pairpeaks(:,1);
    test(:,1) = pairpeaks(:,3);
    test(:,2) = pairpeaks(:,4);
    
    test(:,4) = pairpeaks(:,2)-pairpeaks(:,1);
    pairpeaks = test;
    
    
    
    sizepp=size(pairpeaks);
    for n=1:sizepp(1)
        
        indx = h_func(pairpeaks(n,1),pairpeaks(n,2),pairpeaks(n,4));
        hash{indx,1} = [m,hash{indx,1}];
        hash{indx,2} = [pairpeaks(n,3),hash{indx,2}];
        
    end
    
      


    
    
    
end
save('HASHTABLE.mat','hash');