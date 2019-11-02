
class CashRegister

  attr_accessor :items, :discount, :total, :last_transaction

  def initialize(discount=0) #optionally takes an employee discount which is why we have set to 0
    @total = 0 #sets an instance variable @total on initialization to zero
    @discount = discount
    @items = []
  end

  def add_item(title, amount, quantity=1) #accepts a title and a price , an optional quantity and increases the total
    self.total += amount * quantity #doesn't forget about the previous total 
    quantity.times do
      items << title
    end
    self.last_transaction = amount * quantity
  end

  def apply_discount
    if discount != 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply." #returns a string error message that there is no discount to apply
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction # subtracts the last item from the total
  end
end