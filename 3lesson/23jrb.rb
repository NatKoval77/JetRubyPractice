NAME_AGE = "name_age.txt"
RESULT = "res.txt"

def process
  File.foreach(NAME_AGE) {|line| puts line.chomp}
  File.new(RESULT, "w")
  loop do
    if File.readlines(NAME_AGE).length.to_i == File.readlines(RESULT).length.to_i
      File.foreach(RESULT) {|line| puts line.chomp}
      break
    end

    print "\nEnter the age: "
    age = gets.to_i

    if age >= 0
      res = File.open(RESULT, "a")
      File.foreach(NAME_AGE) do |line|
        res.puts(line) if line.include?(" #{age.to_s}\n")
      end
      res.close

    else
      File.foreach(RESULT) {|line| puts line.chomp}
      break
    end

  end
  File.delete(RESULT)
end

process
