clear all; clc
% Mengimpor data dari file Excel
Dataset = 'Awal, Akhir, Heuristik, Bobot.xlsx';
Coordinate = 'Coordinate.xlsx'

% Menggunakan fungsi xlsread
dataset = xlsread(Dataset);
Crdt = xlsread(Coordinate);

% Generating data
s = dataset(:,1);
t = dataset(:,2);
h = dataset(:,3);
w = dataset(:,4);
crdt = Crdt;
position = crdt(:,2:3)';
