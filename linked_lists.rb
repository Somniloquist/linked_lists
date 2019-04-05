#!/usr/bin/env ruby
class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head
  def initialize(head = nil)
    @head = head
  end

  def append(value)
    if @head
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(value)
    else
      @head = Node.new(value) unless @head
    end
  end

  def prepend(value)
    @head ? @head = Node.new(value, @head) : append(value)
  end

  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  def to_s
    str = ""
    node = @head
    until node.nil?
      str += "(#{node.value.inspect}) -> "
      node = node.next_node
    end
    str += "nil"
  end
end

list = LinkedList.new
list.append(1)
list.append("hello")
list.append(2)
list.append("3")
list.append([1,2,3])
puts list
list.prepend("prepend")
puts list
puts("List size: #{list.size}")
puts list.head
