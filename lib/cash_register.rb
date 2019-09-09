require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction  
  
  def initialize(discount = 0)
    @total = 0 
    @items = []
    @discount = discount 
  end 

  def add_item(title, price, quantity = 1)
    @total += (price * quantity) 
    @last_transaction = price * quantity 
    if quantity > 1
      i = 0 
      while i < quantity
        @items << title 
        i += 1 
      end 
    else 
      @items << title
    end 
    
    
  end 
  
  def apply_discount
    if discount > 0 
      @total = @total - (@total.to_f * (discount.to_f/100))  
      @total 
      "After the discount, the total comes to $#{@total.to_i}."
    else 
      "There is no discount to apply."
    end 
  end 
  
  def items
    @items
  end 
  
  def void_last_transaction
    #binding.pry 
     @total -= @last_transaction
  end 

end 
