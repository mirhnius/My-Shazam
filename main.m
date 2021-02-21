clc
clear all
close all

load SONGID_DB.mat
load HASHTABLE.mat

song_name=match_clip(SONGID_DB,hash);
disp('your song is : ')
disp(song_name)