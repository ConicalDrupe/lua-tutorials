my_table = {}
my_table.x = 1
my_table.y = 2
my_table.z = 3

Set = {}
Set.mt = {} -- metatable for set

-- take in a table and turn it into a set
function Set.new(t)
  local set = {}
  setmetatable(set, Set.mt) -- sets mt as the metatable for set
  for _, l in ipairs(t) do set[l] = true end
  return set
end

function Set.union(a, b)
  local res = Set.new{}
  for k in pairs(a) do res[k] = true end
  for k in pairs(b) do res[k] = true end
  return res
end

function Set.intersection(a, b)
  local res = Set.new{}
  for k in pairs(a) do
    a[k] = b[k]
  end
  return res
end

function Set.tostring(set)
  local s = "{"
  local sep = ""
  for e in pairs(set) do
    s = s .. sep .. e
    sep = ", "
  end
  return s .. "}"
end

function Set.print(set)
  print(Set.tostring(set))
end

Set.mt.__add = Set.union -- describes how to add to tables with Set metatable
Set.mt.__mul = Set.intersection

local s1 = Set.new({10, 20, 30, 50})
local s2 = Set.new({30, 1})
print(getmetatable(s1)) -- both sets have the same metatable
print(getmetatable(s2))

print('set 1')
Set.print(s1)
print('set 2')
Set.print(s2)

-- turned arithmetic operation into union via metatable
print('+ turned into union ')
Set.print(s1 + s2)

-- turned mul arithetic op into intersection
print('* turned into intersection')
Set.print(s1*s2)

-- Relational Metamethods
-- __le (less or equal)
-- __lt (less than)
-- __eq (equal)
-- there are no others.
-- lua translates a ~= b to not (a == b)
--                a > b to b < a
--                a >= b to b <= a

-- BIG NOTE: According to IEEE 754 standard
--          Nan represents undefined value (like 0/0)
--          The standard specifies that comparison with
--          NaN should evaluate to false
-- Hence: NaN <= x is false
--        so is, x < NaN
--        Which implies ( a <= b ) does not negate to ( b > a ) in this case.
-- Conclusion: Partial Orders (Posets) do not hold for undefined values


-- set containment -> requires two implementations b.c partial order issue
Set.mt.__le = function(a,b)
  for k in pairs(a) do -- gets key values of sets (elements, value is true/false)
    if not b[k] then return false end -- if any element is not in other set, return false
  end
  return true
end

-- Another definition for set containment, since its possible
-- that a <= b and b < a are false
Set.mt.__lt = function(a,b)
  return a <= b and not (b <= a )
end
