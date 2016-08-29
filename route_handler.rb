require_relative 'route'

class RouteHandler
   attr_accessor :config
   
  def initialize(config)
    @config = config
  end
   
  def find(resource_type, resource_id)
      @config['strategies'].each do |item|
        if item[0][resource_type].to_s != ''
          strategy =load_strategy(item[1]['name'], resource_id)
          template = load_template(item[1]['view'])

          return Route.new(strategy, template)
        end
      end  
  end

  def load_strategy(strategy_name, resource_id)
    Object.const_get('strategies/' + strategy_name).new(resource_id)
  end
   
  def load_template(view)
    template = ''
    File.foreach(__dir__  + '/' + view) {|x| template += x }
    template
  end
end
