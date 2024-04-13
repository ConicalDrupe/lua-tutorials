Animal = {} -- store methods here
MetaTable = {} -- metatable, when unknown key is accessesed, and setmetatable(Animal,mt). 
        -- Then MetaTable points back to Animal Table
MetaTable.__index = Animal

-- static function?
function Animal.new(name) -- constructor, but also a static function
  local instance = setmetatable({}, MetaTable)
  instance.name = name -- instance.name is the same as instance['name']
  return instance
end

function Animal:displayName()
  print(self.name)
end

animal1 = Animal.new('Dog')
animal2 = Animal.new("Henry")
animal3 = Animal.new("Bianca")

-- animal1 = animal1:displayName()
-- animal2 = animal2:displayName()
-- animal3 = animal3:displayName()


-- A BETTER WAY: Cut out the middle man
-- Set metatable to reference itself (be it's own metatable)
Animal = {}
Animal.__index = Animal

function Animal.new(name)
  local instance = setmetatable({},Animal)
  instance.name = name
  return instance
end

function Animal:displayName()
  print(self.name)
end

a = Animal.new("Sarah")
b = Animal.new("julie")

a:displayName()
b:displayName()

