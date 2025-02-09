require "socket"
require "./app"


app = App.new

server = TCPServer.open('0.0.0.0', 3000)

while connection = server.accept
  request = connection.gets 

  method, full_path = request.split(" ")

  path, params = full_path.split("?")

  status, headers, body = app.call({
    'REQUEST_METHOD' => method,
    'PATH_INFO' => path,
    'QUERY_STRING' => params,
  })

  status == "404" ? "404" : "200"

  connection.print "HTTP/1.1 #{status}\r\n"

  headers.each do |key, value|
    connection.print "#{key}: #{value}\r\n"  
  end
  
  connection.print "\r\n"

  body.each do |part|
    connection.print part
  end

  connection.close
end