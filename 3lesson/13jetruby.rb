FILE = "file.txt"


def index
  File.foreach(FILE) {|line| puts line.chomp}
end


def find(id)
  File.foreach(FILE).with_index do |line, index|
    puts line if index == id
  end
end


def where(pattern)
  line_id = []
  idx = 0
  File.foreach(FILE).with_index do |line, index|
    line_id[idx] = index + 1 if line.downcase.include?(pattern.downcase)
    idx += 1 unless line_id[idx].nil?
  end
  pp line_id
end


def update(id, text)
  buffer = File.new("buf.txt", "w")
  File.foreach(FILE).with_index do |line, index|
    buffer.puts(id == index ? text : line)
  end
  buffer.close
  File.write(FILE, File.read("buf.txt"))
  File.delete("buf.txt")
  index
end


# two options to do this task (by default the second option is):
# 1 - if the cond is true then we think that the line should be empty;
# 2 - if the cond is false then we think that the line should be replaced.
def delete(id, condition = false)
  if condition
    buffer = File.new("buf.txt", "w")
    File.foreach(FILE).with_index do |line, index|
      buffer.puts(id == index ? "" : line)
    end
    buffer.close
    File.write(FILE, File.read("buf.txt"))
    File.delete("buf.txt")
  else
    buffer = File.new("buf.txt", "w")
    File.foreach(FILE).with_index do |line, index|
      buffer.puts(line) unless id == index
    end
    buffer.close
    File.write(FILE, File.read("buf.txt"))
    File.delete("buf.txt")
  end
  index
end


def create(name)
  File.write(FILE, "\n#{name}", mode: "a")
end
