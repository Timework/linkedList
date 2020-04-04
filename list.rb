class LinkedList

    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        node = Node.new(value)
        
        if !@head
            @head = node
            @tail = node
        else
            @tail.next_node = node
            @tail = node
        end
    end

    def prepend(value)
        node = Node.new(value)

        if !@head
            @head = node
            @tail = node
        else
            node.next_node = @head
            @head = node
        end
    end

    def size
        counter = 0
        head = @head
        while head
            counter += 1
            head = head.next_node
        end
        return counter
    end

    def head
        return @head.value
    end

    def tail
        return @tail.value
    end

    def at(index)
        if index < self.size
            current_node = @head
            current_index = 0
            while current_index != index
                current_node = current_node.next_node
                current_index += 1
            end
            return current_node.value
        end
    end

    def pop
        if @head == @tail
            @head = nil
            @tail = nil
        else
        current_node = @head
        while current_node.next_node != @tail
            current_node = current_node.next_node
        end
        @tail = current_node
        @tail.next_node = nil
    end
    end

    def contains?(value)
        current_node = @head
        counter = 0
        while counter < self.size
            if current_node.value == value
                return true
            end
            current_node = current_node.next_node
            counter += 1
        end
        return false
    end

    def find(value)
        current_node = @head
        counter = 0
        while counter < self.size
            if current_node.value == value
                return counter
            end
            current_node = current_node.next_node
            counter += 1
        end
        return "Not in List"
    end

    def to_s
        current_node = @head
        counter = 0
        while counter < self.size
            print "(#{current_node.value}) -> "
            current_node = current_node.next_node
            counter += 1
        end
        print "nil"
    end

    def insert_at(value, index)
        if index == 0
            self.prepend(value)
        elsif index == self.size
            self.append(value)
        elsif index < self.size + 1
        node = Node.new(value)
        current_node = @head
        current_index = 0
            while current_index < index - 1
                current_node = current_node.next_node
                current_index += 1
            end
        node.next_node = current_node.next_node
        current_node.next_node = node
        end
    end

    def remove_at(index)
        if index == 0
            @head = @head.next_node
        elsif index < self.size
        current_node = @head
        current_index = 0
            while current_index < index - 1
                current_node = current_node.next_node
                current_index += 1
            end
        current_node.next_node = current_node.next_node.next_node
        if current_node.next_node == nil
            @tail = current_node
        end
        end
    end

end

class Node
    attr_accessor :value
    attr_accessor :next_node

    def initialize(value)
        @value = value
        @next_node = nil
    end

end

list = LinkedList.new
list.append("43")
list.pop
puts list.to_s