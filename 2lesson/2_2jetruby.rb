def pokemon
    print'How much pokemon do you want to add '
    numb_pok = gets.to_i
    pok_arr = [[], []]
    numb_pok.times do |i|
        print"Enter name and color of #{i + 1} pokemon\n"
        name = gets.chomp
        color = gets.chomp
        pok_arr[0][i] = name
        pok_arr[1][i] = color
    end
    numb_pok.times do |i|
        if i == 0
            print"[{ name: #{pok_arr[0][i]}, color: #{pok_arr[1][i]} }, "
        elsif i == numb_pok-1
            print"{ name: #{pok_arr[0][i]}, color: #{pok_arr[1][i]} }, #{numb_pok} times]"
        else
            print"{ name: #{pok_arr[0][i]}, color: #{pok_arr[1][i]} }, "
        end
    end
end

pokemon