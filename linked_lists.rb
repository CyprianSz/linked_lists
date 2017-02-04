class Node
	attr_accessor :value, :next_node
	def initialize(value = nil, next_node = nil)
		@value = value
		@next_node = next_node
	end
end

class LinkedList
	def initialize
		@head = nil
		@tail = nil
	end

	def append(value)
		new_node = Node.new(value)
		unless @head.nil?
			@tail.next_node = new_node
			@tail = new_node
		else
			@head = new_node
			@tail = new_node
		end
	end

	def prepend(value)
		unless @head.nil?
			new_node = Node.new(value, @head)
			@head = new_node
		else
			new_node = Node.new(value)
			@head = new_node
			@tail = new_node
		end
	end

	def size
		unless @head.nil?
			temporary_head = @head
			counting = 0
			until temporary_head == nil
				temporary_head = temporary_head.next_node
				counting += 1
			end
			counting
		else
			reutrn 0
		end
	end

	def head
		unless @head.nil?
			return @head.value, (@head.next_node.value.nil? ? nil : @head.next_node.value)
		else
			nil
		end
	end

	def tail
		@head.nil? ? nil : @tail
	end

	def at(index)
		unless @head.nil? || index > size
			temporary_head = @head
			counting = 1
			until counting == index
				temporary_head = temporary_head.next_node
				counting += 1
			end
			temporary_head.value
		else
			return nil
		end
	end

	def pop
		@size = size
		unless @head.nil?
			temporary_head = @head
			counting = 1
			until counting == @size - 1
				temporary_head = temporary_head.next_node
				counting += 1
			end
			temporary_head.next_node = nil
			@tail.value = temporary_head.value
		else
			reutrn nil
		end
	end

	def contains?(value)
		counting = 1
		temporary_head = @head
		@size = size
		while counting <= @size
			if temporary_head.value == value
				return true
				break
			elsif counting == @size && temporary_head.value != value
				return false
				break
			else
				temporary_head = temporary_head.next_node
				counting += 1
			end
		end
	end

	def find(data)
		temporary_head = @head
		index = 1
		@size = size
		while index <= @size#temporary_head.value == data || temporary_head.next_node == nil
			if temporary_head.value == data
				return index
				break
			end
			temporary_head = temporary_head.next_node
			index += 1
		end
	end

	def to_s
		temporary_head = @head
		@size = size
		counting = 1
		output_array = []
		while counting <= @size
			output_array << temporary_head.value
			temporary_head = temporary_head.next_node
			counting += 1
		end
		return output_array.collect {|x| "(#{x}) -> "}.join + "nil\n"
	end
end


=begin

list = LinkedList.new

list.append("one")
list.append("two")
list.append("three")
list.append("four")

list.prepend("five")
list.prepend("six")



puts list.inspect
puts list.size
puts list.head.inspect
puts list.tail.inspect

puts list.at(4).inspect
puts list.at(8).inspect

list.pop
puts list.inspect

puts list.size

puts list.contains?("two")
puts list.contains?("three")
puts list.contains?("four")

puts list.find("six")
puts list.find("five")
puts list.find("one")
puts list.find("two")
puts list.find("three")
puts list.find("four")
puts list.find("elomelo")

print list.to_s

=end