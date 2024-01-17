a = {"one","two","three"}
-- essentially enumerate from python
-- takes in a list, not a table
for i, v in ipairs(a) do
  print(i, v)
end

-- we can manually implement it via a helper funcion
function iter(a, i)
  i = i+1
  local v = a[i] -- v can be nil if no value exists at key
  if v then
    return i,v
  end
end
-- then use the helper function
function my_ipairs(a)
  return iter, a, 0
end

for i, v in my_ipairs(a) do
  print(i, v)
end
-- When lua calls my_ipairs in the for loop
-- iter, a, 0 are returned
-- since for i,v in iter,a,0 is called
-- iter(a,0) is ran, and i,v are stored and used
-- then since i=i+1
-- iter(a,1) is ran on the next iteration of the for loop
-- this continues until iter returns nothing. Hence the for loop ends
