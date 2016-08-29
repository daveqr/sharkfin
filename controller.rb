require 'logger'
require 'yaml'
require_relative 'strategies/entree_strategy'
require_relative 'strategies/error_strategy'
require_relative 'response'
require_relative 'route'
require_relative 'route_handler'
require_relative 'view_handler'


class Controller  
  attr_accessor :request, :socket, :logger, :config
 
  def initialize(socket, request)

        
    
    @socket = socket
    @request = request
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::DEBUG
    @config = YAML::load_file(File.join(__dir__, 'config.yml'))
  end

  def dispatch
    path = @request.path
    path.slice!(0)
     
    logger.debug(path)
   
    begin
      parts = path.match(/(.*)\/(.*)/)
      resource_type = parts[1]
      resource_id = parts[2]

      route = RouteHandler.new(@config).find(resource_type, resource_id)
      response = route.call(request.request_method)
    rescue => ex
       route = RouteHandler.new(@config).find('error', resource_id)
       response = route.call(request.request_method)
    end

    view_handler = ViewHandler.new(response, route.template)
    view_handler.render
  end
end
