require 'pry'

class CashRegister
    def initialize(employee_discount = nil)
        @total = 0
        @discount = employee_discount
        @items = []
    end

    attr_accessor :total, :discount, :last_transaction

    def add_item(title, price, quantity = 1)
        @last_transaction = price * quantity
        @total += @last_transaction
        quantity.times { @items << title }
    end

    def apply_discount
        if @discount
            # @total *= ((100 - @discount) * 0.01)
            # @total = @total.to_i
            @total = @total * (100 - discount) / 100
            p "After the discount, the total comes to $#{total}."
        else
            p "There is no discount to apply."
        end

    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last_transaction
    end

end

# binding.pry
0