require 'pry'
class CashRegister
  attr_accessor :total, :last_transaction_cost, :discount, :items
def initialize(discount= 0)
  @total = 0
  @discount = discount 
  @@items = []
end
def add_item(item, price, quantity = 1)
@total = self.total + price*quantity
quantity.times do
@@items << item 
end
 @last_transaction_cost = price*quantity
end
def apply_discount
   return "There is no discount to apply." if self.discount == 0
self.total-=(self.total/100)*self.discount 
"After the discount, the total comes to $#{self.total}."
end
def items
@@items 
end
def void_last_transaction
  self.total -= @last_transaction_cost
end

end