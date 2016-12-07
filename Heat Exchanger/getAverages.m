function [ averages ] = getAverages( path, timestep )
%getAverages input of data path yields the average values where timesteps
%are similar
%   By inputting the path to the data file, the function will determine
%   where there are major differences in the change in first column, split
%   the data based on those peaks in the first column, and average the
%   remaining columns
data = readtable(path);
data(2:end,1:end)
table = table2array(data);
T = table2array(data(:,1));
A = diff(T);
index = find(A > timestep);
averages = zeros(1,length(table(1:index(1),:)));
averages(1,:) = mean(table(1:index(1),:));
for i = 2:length(index)
    averages(end+1,:) = mean(table(index(i-1)+1:index(i),:));
end
averages(end+1,:) = mean(table(index(end)+1:end,:));


end

