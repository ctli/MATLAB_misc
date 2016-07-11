% test drawSankey.m

clear all
close all
clc

inputs = [75 32]; losses = [10 5 2.8]; unit = 'MW'; sep = [1,3];
labels = {'Main Input','Aux Input','Losses I','Losses II','Losses III','Output'};

drawSankey(inputs, losses, unit, labels, sep);
