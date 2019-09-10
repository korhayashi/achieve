require 'webrick'

module WEBrick
  module HTTPServlet
    FileHandler.add_handler('rb', CGIHandler)
  end
end

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'index.html.erb')

server.mount('/goya_for.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya_for.rb')

server.mount('/goya_false.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya_false.rb')

server.start
