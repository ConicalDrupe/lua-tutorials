-- the pairs function will iterate over all elements of the table
--
my_table = {}
my_table.x = 1
my_table.y = 2
my_table.z = 3

--NOTE: pair returns key-value pairs in arbitrary order
function my_pairs(t)
  return next, t, nil
end

for i,v in my_pairs(my_table) do
  print(i,v)
end

-- the above is equivalent to
for k,v in next, my_table do
  print(k,v)
end
