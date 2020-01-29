
class CashRegister
  attr_accessor :discount, :total, :cart, :last_item
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
    @last_item = 0 
  end 

  def total
    @total
  end  

  def add_item(title, price, quantity = 1)
    @last_item = price * quantity
    @total += (price * quantity)
    quantity.times { @cart << title }
  end 

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else 
      @total -= (@discount * @total) / 100
      "After the discount, the total comes to $#{@total}." 
    end  
  end 

  def items
    @cart
  end 

  def void_last_transaction
    @cart.pop
    @total -= @last_item
    @total = 0.0 if @cart.empty?
  end  

end  

test = CashRegister.new(20)
puts test.total
test.add_item("apple", 6.42)
puts test.total
test.apply_discount
puts test.total
