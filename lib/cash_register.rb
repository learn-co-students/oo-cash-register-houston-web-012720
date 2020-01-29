require 'pry'

class CashRegister
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @itemlist = []
    end
    
    attr_accessor :total, :discount, :itemlist, :items

    def add_item(title, price, quantity = 1)
        @itemlist.push(item_name: title, item_price: price, item_qty: quantity)
        @total += price*quantity
    end

    def items
        @itemlist.each do |i|
            i[:item_qty].times{@items << i[:item_name]}
        end
        @items
    end

    def void_last_transaction
        @total -= (@itemlist[-1][:item_price])*(@itemlist[-1][:item_qty])
        @itemlist.delete(-1)
    end

    def apply_discount
        if discount > 0 
            self.total *= ((100 - self.discount) / 100.0)
            "After the discount, the total comes to $#{self.total.to_int}."
        else
            "There is no discount to apply."
        end
    end
end

