class Entree
  attr_accessor :name, :price
  def initialize(name, price)
     @name = name
     @price = price
  end
  
  def get_binding
    binding
  end
   
end