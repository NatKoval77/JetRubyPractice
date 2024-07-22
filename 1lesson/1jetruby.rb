require 'rspec'

def greeting
    puts('Enter name: ')
    name = gets.chomp
    puts('Enter second name: ')
    sec_name = gets.chomp
    puts('Enter age: ')
    age = gets.to_i
    greeting = "Hi, #{name} #{sec_name}. "
    if age<18
        print greeting
        puts('Your age is less 18 years, 
but it\'s never too early to start learning programming.')
    else
        print greeting
        puts('It is right time to work!')
    end
end

def foobar(left, right)
    if left == 20 || right == 20
        puts(right)
    else
        puts(left+right)
    end
end

greeting

puts('Enter number a: ')
a = gets.to_i
puts('Enter number b: ')
b = gets.to_i

foobar(a, b)

RSpec.describe "Main" do
    it "#greeting" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Alex', 'Reyes', '17')
        expect(greeting).to eq("Hi, Alex Reyes. Your age is less 18 years, 
        but it\'s never too early to start learning programming.")
    end
    it "#greeting" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Rey', 'Brown', '19')
        expect(greeting).to eq("Hi, Rey Brown. It is right time to work!")
    end
    it "#greeting" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('John', 'Doe', '18')
        expect(greeting).to eq("Hi, John Doe. It is right time to work!")
    end
    $left = 18
    $right = 17
    let(:left) {$left += 1}
    let(:right) {$right += 1}
    it "#foobar" do
      expect(foobar(left, right)).to  eq()
    end
end

