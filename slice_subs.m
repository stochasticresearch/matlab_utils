function out = slice_subs(A, ix, dim)

subses = repmat({':'}, [1 ndims(A)]);
subses{dim} = ix;
out = subses;