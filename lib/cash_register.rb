require "pry"
class CashRegister
    attr_accessor :total, :discount, :list, :last_item
def initialize(discount = 0)
    @total = 0
    @discount = discount
    @list =[]
    @last_item = 0
end
def total
    @total
end
def add_item(title, price, quantity = 1)
    @last_item = price *quantity
    @total += (price * quantity)
    quantity.times do @list << title
    end
end
def apply_discount
    if discount > 0 
    @total -= (@total * @discount) /100
    return "After the discount, the total comes to $#{@total}."
    else
        return "There is no discount to apply." 
    end
    end
    def items
        @list
    end
    def void_last_transaction
            @total -= @last_item 
    end
end
