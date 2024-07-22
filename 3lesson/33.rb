BALANCE = "balance.txt"
START_BALANCE = 100.0


def check_balance
  if File.empty?(BALANCE)
    File.write(BALANCE, START_BALANCE)
    puts File.read(BALANCE)
  else
    puts File.read(BALANCE)
  end
end


def deposit
  print "Enter the sum for deposit "
  deposit = gets.chomp.to_f
  balance = File.read(BALANCE).to_f
  deposit > 0 ? File.write(BALANCE, balance+deposit) && check_balance
    : print("ERROR! Deposit must be greater then zero!\n")
end


def withdraw
  print "Enter the sum for withdraw "
  withdraw = gets.chomp.to_f
  balance = File.read(BALANCE).to_f
  withdraw > 0 && withdraw<=balance ? File.write(BALANCE, balance-withdraw) && check_balance
    : print("ERROR! Withdraw must be greater then zero and less/equal then balance!\n")
end


check_balance
loop do
  print "Enter D(deposit), W(withdraw), B(balance) or Q(quit) "
  option = gets.chomp.upcase
  case option
  when "D"
    deposit
  when "W"
    withdraw
  when "B"
    check_balance
  when "Q"
    break
  else
    puts "ERROR! Wrong option, please try again!"
  end
end
