def bubble_sort(array)
    tam = array.length
    for i in 0..tam
        for j in 0..tam-i-2
            if array[j] > array[j+1]
                array[j] , array[j+1] = array[j+1] , array[j]
            end
        end
    end
    array.to_s
end

puts bubble_sort([4,3,78,2,0,2])




