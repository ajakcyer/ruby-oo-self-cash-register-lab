require 'pry'
class CashRegister
    attr_accessor :discount, :total, :cart_array, :total_array
    attr_reader :title, :price, :quantity

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @cart_array = []
        @total_array = []
    end

    def add_item(title, price, quantity=1)
        @title = title
        @price = price.to_f
        @quantity = quantity

        
        counter = 0
        while counter < @quantity do
            if @cart_array == nil
            @cart_array = []
            self.cart_array << @title
            else
            self.cart_array << @title
            end
            counter += 1
        end
        # # @item_hash ={:item => @title, :cost => @price, :qty => @quantity}
        # # if @cart_array == nil
        # #     @cart_array = []
        # #     @cart_array << @item_hash
        # # else
        # #     @cart_array << @item_hash
        # # end

        @total_array << @price * quantity
        self.total += @price * @quantity
        
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total = @total - @total * (@discount / 100.00)
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        # @cart_array.collect do |item_hash|
        #     #binding.pry
        #     counter = 0
        #     while counter < item_hash[:quantity] do
        #         item_hash[:item]
        #         binding.pry
        #         counter += 1
        #     end
        #     # quantity.times do
        #     #     item_hash[:item]
        #     #     binding.pry
            
        # end
        @cart_array
        
    end

    def void_last_transaction
        @total = @total - @total_array.last
        # binding.pry
    end

end

# new_register = CashRegister.new
#       new_register.add_item("eggs", 1.99)
#       new_register.add_item("tomato", 1.76, 3)

#       binding.pry