require 'pry'

class CashRegister
    
    attr_accessor :total, :discount, :items, :last_item

    def initialize (emp_dis = 0)
        @total = 0
        @discount = emp_dis.to_f
        @items = []
        @last_transaction 
        # @lats_items = nil
    end

    def total 
        @total
    end


    def add_item (item, price, qty = 1)
        @last_items = @items
        qty.times {@items << item}
        @total += price * qty
        @last_transaction = price * qty
    end

    def apply_discount
        #float and integer funny business
        @total *= 1 - (@discount / 100)
        if @discount == 0
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{total.to_i}."
        end
    end
    
    def items 
        @items
    end

    def void_last_transaction
        # COME BACK this doesnt change the items array
        @total = @total - @last_transaction
        # @items = @last_items
    end

end





# binding.pry 
# 0