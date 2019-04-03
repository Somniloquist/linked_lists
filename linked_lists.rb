#!/usr/bin/env ruby
class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head
  def initialize(head = nil)
    @head = head
  end

  def append(value)
    @head = Node.new(value) unless @head
  end
end

list = LinkedList.new
puts("Head: #{list.head}")
list.append(5)
puts("Head: #{list.head.value} Next: #{list.head.next_node}")
list.append(3)
puts("Head: #{list.head.value} Next: #{list.head.next_node}")
list.append(1)
puts("Head: #{list.head.value} Next: #{list.head.next_node}")