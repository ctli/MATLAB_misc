clear all
close all
clc

capacity = [
    107 % northeast, [GW]
     56 % inner mongolia
    118 % northwest
    195 % north
    233 % east
    236 % central
    202];%south

peak_demand = [
     42 % [GW]
    nan
     44
    158
    171
    122
    113];

generation_adaquacy.value = peak_demand./capacity;
generation_adaquacy.region = {'northeast', 'inner mongolia', 'northwest', 'north', 'east', 'central', 'south'};

figure(1); clf;
