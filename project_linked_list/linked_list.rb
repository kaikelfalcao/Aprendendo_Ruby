require_relative 'node'

class LinkedList
    attr_reader :head

    def initialize(array = [])
        @head = nil
    end

    def append(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
        else
            current = @head
            while current.next_node
                current = current.next_node
            end
            current.next_node = new_node
        end
    end


    def prepend(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
        else
            temp = @head
            @head = new_node
            @head.next_node = temp
        end
    end

    def pop
        return if @head.nil?

        if @head.next_node.nil?
            @head = nil
        else
            current = @head
            while current.next_node.next_node
                current = current.next_node
            end
            current.next_node = nil
        end
    end

    def size
        size = 0
        current = @head
        while current
            size += 1
            current = current.next_node
        end
        size
    end

    def tail
        tail = nil
        current = @head
        while current
            if current.next_node.nil?
                return tail = current
            end
            current = current.next_node
        end
    end

    def at(index)
        i = 0
        current = @head
        while current
            if i == index
                return current
            end
            i += 1
            current = current.next_node
        end

    end

    def find?(value)
        i = 0
        current = @head
        while current
            if current.value == value
                return i
            end
            i += 1
            current = current.next_node
        end
        nil
    end

    def contains?(value)
        current = @head
        while current
            if current.value == value
                return true
            end
            current = current.next_node
        end
        false
    end

    def insert_at(value,index)
        if index == 0
            prepend(value)
        end
        new_node = Node.new(value)
        current = @head
        (index-1).times do
            return unless current.next_node
            current = current.next_node
        end

        new_node.next_node = current.next_node
        current.next_node = new_node
    end

    def remove_at(index)
        return if @head.nil? || index < 0

        if index == 0
            @head = @head.next_node
        else
            current = @head
            (index - 1).times do
                return unless current.next_node
                current = current.next_node
            end

            return unless  current.next_node
            current.next_node = current.next_node.next_node
        end
    end

    def to_s
        elements = []
        current = @head
        while current
            elements << current.value
            current = current.next_node
        end
        elements.join(" -> ")
    end
end

list = LinkedList.new

list.append(20)
list.prepend(10)
list.append(30)
list.append(40)
list.prepend(5)
list.append(50)
list.append(60)
list.prepend(1)
list.append(70)
list.append(80)
list.prepend(0)
list.append(90)

puts "Head: #{list.head.value} and Tail: #{list.tail.value} | Size: #{list.size} | List: #{list}"
puts "Index(2): #{list.at(2).value}"

puts "Remove last added #{list.pop}"

puts "Head: #{list.head.value} and Tail: #{list.tail.value} | Size: #{list.size} | List: #{list}"
puts "Contains 20 ? : #{list.contains?(20)}"
puts "finds 10 index ? : #{list.find?(10)}"
puts "Insert in the middle: #{list.insert_at(40,list.size/2).value}"

puts "Head: #{list.head.value} and Tail: #{list.tail.value} | Size: #{list.size} | List: #{list}"

puts "Remove in the middle: #{list.remove_at((list.size / 2))}"
puts "Head: #{list.head.value} and Tail: #{list.tail.value} | Size: #{list.size} | List: #{list}"


