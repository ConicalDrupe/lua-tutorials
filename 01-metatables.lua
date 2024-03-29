my_table = {}
my_table.x = 1
my_table.y = 2
my_table.z = 3

Set = {}

-- take in a table and turn it into a set
function Set.new(t)
  local set = {}
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
