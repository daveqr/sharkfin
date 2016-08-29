class Route
  attr_accessor :strategy, :template
   
  def initialize(strategy, template)
    @strategy = strategy
    @template = template
  end

  def call(method)
    @strategy.public_send(method.downcase) if @strategy.respond_to? method.downcase
  end
end