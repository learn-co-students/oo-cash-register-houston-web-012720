require 'pry'

class CashRegister
    
    attr_reader 
    attr_accessor :total, :discount, :list

    def initialize(discount=0)
        @total = 0
        @discount = discount.to_f
        @list = []
        @last_item = 0 
    end

    def apply_discount
        if discount > 0
        @total = @total - (@total * (@discount/100))
        return "After the discount, the total comes to $#{@total.to_i}."    
        else
            return "There is no discount to apply."
            
        end
    end
    
    def add_item(title, price, quantity=1)
        @last_item = (price * quantity)
        @total += (price * quantity)
        puts "Updated total"
        quantity.times do @list << title 
        end
    end

    def items
        @list 
    end

    def void_last_transaction
        # subtracts the last item from the total 
        @total -= @last_item
    end
end




