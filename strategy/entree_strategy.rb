require 'json'
require_relative 'base_strategy'
require_relative '../model/entree'

class EntreeStrategy < BaseStrategy  
  def get
     Response.new('200 OK', find_entree)
  end
   
  def post
     get
  end
   
  def find_entree  
    entree = @entrees[@id]
    if entree.nil?
      raise 'entree doesn''t exist'
    end
     
    entree
  end
end
