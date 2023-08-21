def merge_sort(array)
    # Genial
    return array if array.length < 2

    middle = array.length / 2
    left_half = merge_sort(array[...middle])

    right_half = merge_sort(array[middle...])

    sorted = []
    until left_half.empty? || right_half.empty?
        left_half.first <= right_half.first ? sorted << left_half.shift : sorted << right_half.shift
    end

    sorted + left_half + right_half
end
puts merge_sort([38, 27, 43, 3, 9, 82, 10]).to_s
