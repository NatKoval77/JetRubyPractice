require "rack"
require "./cashM"

class App
  def call(env)
    req = Rack::Request.new(env)

    params = req.query_string.split("&").map{ |pair| pair.split("=")}.to_h

    router(req.path, params)
  end

  def router(path, params)
    case path
    when  "/"
      [ 200, { "Content-Type" => "text/html" }, ["Hello World"] ]
    when  "/user"
      [ 404, { "Content-Type" => "text/html" }, ["Hello User"] ]
    when "/atm"
      result = cash_control(params)

      [ 404, { "Content-Type" => "text/html" }, [result] ]
    when "/about"
      [ 404, { "Content-Type" => "text/html" }, File.readlines('./index.html') ]
    else
      [ 404, { "Content-Type" => "text/html" }, ["404"] ]
    end
  end
  
  def cash_control(params)
    puts params
    atm = CashMachine.new
      if params.nil? || params["method"].nil?
        atm.balance
      else
        case params["method"]
        when "withdraw"
          params["withdraw"].nil? ? "Enter the sum (add to address \"&withdraw=100\" for example)" 
          : atm.withdraw(params["withdraw"].to_f)
        when "deposit"
          params["deposit"].nil? ? "Enter the sum (add to address \"&deposit=100\" for example)" 
          : atm.deposit(params["deposit"].to_f)
        when "balance"
          atm.balance
        else
          "Do not exist operation - ERROR!"
        end
      end
  end
end
