require_relative 'base_Strategy'

class ErrorStrategy < BaseStrategy
  def get
    message = 'There was some kind of error.'
    Response.new('500 Internal Server Error', Error.new(message))
  end
end

class Error
  attr_accessor :message
   
  def initialize(message)
     @message = message
  end
   
  def get_binding
    binding
  end
end