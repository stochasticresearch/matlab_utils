% [X] = load_from_infra(instance_filename,max_examples)
% load the matrix X from file named instance_filename written in infra format
% The second input is optional. If it's there, at most max_examples are
% read
function [X] = load_from_infra(instance_filename,max_examples)



% read the instances file
fid = fopen(instance_filename,'rb');
% read the number of examples
fread(fid,1,'char');
fread(fid,1,'ulong');
m = fread(fid,1,'ulong');
if (nargin == 2)
    m = min(m,max_examples);
end
% read the dimension
fread(fid,1,'char');
fread(fid,1,'ulong');
n = fread(fid,1,'ulong');
% read the examples
X = zeros(m,n);
for (i=1:size(X,1)),
    fread(fid,1,'char');
    fread(fid,1,'ulong');
    fread(fid,1,'ulong');
    tmp = fread(fid,n,'double');
    X(i,:) = tmp(:)';
end
fclose(fid);
