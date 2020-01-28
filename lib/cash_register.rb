
require 'pry'

class CashRegister

    attr_reader :total, :discount, :items, :lastitem
    attr_writer :total, :discount

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end



    def add_item(title, price, quantity = 1)
        quantity.times do
            @items << title
        end
        @total = @total + price * quantity
        @lastitem = {
            :title => title,
            :price => price,
            :quantity => quantity
        }
    end

    def apply_discount
        
        if @discount > 0 
            @total = @total - @total*@discount/100
            "After the discount, the total comes to $#{@total}."
        else 
            "There is no discount to apply."
        end
        
    end

    def void_last_transaction
        @lastitem[:quantity].times do
            @total = @total - @lastitem[:price]
            @items = @items - [@lastitem[:title]]
        end
    end
end