def fibs(position)
    array = []
    first_num = 0
    second_num = 1

    position.times do
        array << first_num
        first_num, second_num = second_num, first_num + second_num 
    end
    array.to_s
end

puts fibs(8)

def fibs_rec(position, array = [0, 1])
    array.length >= position ? array.to_s : fibs_rec(position, array << array[-1] + array[-2])
end

puts fibs_rec(8)