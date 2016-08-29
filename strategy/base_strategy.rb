class BaseStrategy
  attr_accessor :id, :entrees
 
  def initialize(id)
    @id = id
    @entrees = {}
    @entrees['pizza'] = Entree.new('Pizza', '12.23')
    @entrees['chicken'] = Entree.new('Fried Chicken', '8.23')
    @entrees['coney'] = Entree.new('Footlong Coney', '5.34')
  end
   
  def get
    
  end
  
  def post
    
  end
   
  def put
   
  end
  
  def delete
    
  end
  
  def patch
    
  end
end
