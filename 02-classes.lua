Account = {
  balance=0
}

function Account.new(self,o)
  o = o or {}
  setmetatable(o,self)
  self.__index = self
  return o
end

test = Account.new(Account)
print(test.balance)

Bonus = Account:new({balance=1000})
print(Bonus.balance)
