BALANCE = "balance.txt"
START_BALANCE = 100.0

class CashMachine
  attr_reader :balance

  def initialize
    if File.empty?(BALANCE)
      File.write(BALANCE, START_BALANCE)
      @balance = File.read(BALANCE).to_f
    else
      @balance = File.read(BALANCE).to_f
    end
  end

  def init
    puts @balance
    loop do
      print "Enter D(deposit), W(withdraw), B(balance) or Q(quit)"
      option = gets.chomp.upcase
      case option
        when "D"
          print "Enter the sum for deposit "
          deposit = gets.chomp.to_f
          self.deposit(deposit)
        when "W"
          print "Enter the sum for withdraw "
          withdraw = gets.chomp.to_f
          self.withdraw(withdraw)
        when "B"
          puts self.balance
        when "Q"
          break
        else
          puts "ERROR! Wrong option, please try again!"
      end
    end
  end

  def deposit(deposit)
    deposit > 0 ? File.write(BALANCE, @balance + deposit) && @balance = File.read(BALANCE).to_f
    : print("ERROR! Deposit must be greater than zero!\n")
    
  end

  def withdraw(withdraw)
    withdraw > 0 && withdraw <= @balance ? File.write(BALANCE, @balance - withdraw) && @balance = File.read(BALANCE).to_f
    : print("ERROR! Withdraw must be greater than zero and less/equal than balance!\n")
  end

end

atm = CashMachine.new
atm.init
