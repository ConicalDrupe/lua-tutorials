-- the pairs function will iterate over all elements of the table
--
local my_table = {}
my_table.x = 1
my_table.y = 2
my_table.z = 3

--NOTE: pair returns key-value pairs in arbitrary order
function my_pairs(t)
  --  next is an iterator object with length t
  --  i.e. this function iterates over a table
    --  what about other table tree layouts? Tables are unordered...
  return next, t, nil --return has a datastructure - 3-tuple
end

local function run1(t)
  for i,v in my_pairs(t) do
    print(i,v)
  end
end
--  NOTE: function breaks t down. next as iterator
--  next is an iterator object with length t


-- what is the time complexity? Prove O(n)
  -- what about memory complexity?
-- the above is equivalent to
local function run2(t)
  for k,v in next, t do
    print(k,v)
  end
end

-- print(type(run2()))

local function doubling(t, runs)
  for l=1,3  do print('+---' .. l .. '---+')
    print('---------')
    runs(t)
    print('---------\n')
  end
end

doubling(my_table,run2)
doubling(my_table,run2)
