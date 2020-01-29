
class CashRegister 
    attr_accessor :total
    attr_reader :items , :discount , :void_last_transaction , :apply_discount
    @@shopingCar = []
    @@itemArr = []
    def initialize(discount = 0)
        @@shopingCar = []
        @@itemArr = []
        @discount = discount
        @total = 0
    end 
    def add_item(item,price,value = 1)
        @total += price * value
        @@shopingCar << {item => price * value,:amount => value}
    end
    def items
        for i in 0...@@shopingCar.length
            for j in 0...@@shopingCar[i][:amount]
                @@itemArr << @@shopingCar[i].keys.find{|k| k.class == String}
            end
        end

        @items = @@itemArr
    end

    def apply_discount 
        @total = @total * (1 - @discount.to_f / 100)
        @discount > 0 ? "After the discount, the total comes to $#{@total.floor()}." : "There is no discount to apply."
    end
    def void_last_transaction
        @total -= @@shopingCar[-1][@@shopingCar[-1].keys.find{|k| k.class == String}]
        @@shopingCar.pop()
    end
end



