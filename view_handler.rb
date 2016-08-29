class ViewHandler
  attr_accessor :response, :template, :logger
 
  def initialize(response, template)
    @response = response
    @template = template
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::DEBUG
  end
   
  def render()
     renderer = ERB.new(template)
     result = renderer.result(response.body.get_binding)
          
    <<HERE
HTTP/1.1 #{response.status}
Content-Type: text/html
Content-Length: #{result.bytesize}
Connection: close

#{result}
HERE
  end
end
