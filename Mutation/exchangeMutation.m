function child = exchangeMutation(child)

r=randsample(length(child),2);
temp=child(r(1));
child(r(1))=child(r(2));
child(r(2)) = temp;
end