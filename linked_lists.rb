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

  def head
    @head
  end

  def tail
    current = @head
    loop do
      return current if current.next_node.nil?
      current = current.next_node
    end
  end

  def at(index)
    return head if index == 0
    current = @head
    index.times { current = current.next_node }
    current
  end

  def pop
    if size == 1
      @head = nil
    else
      current = self.at(size - 2)
      current.next_node = nil
    end
  end

  def contains?(value)
    current = head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    index = 0
    current = head
    while current
      return index if current.value == value
      current = current.next_node
      index += 1
    end
    nil
  end

  def insert_at(index, value)
    return append(value) if index >= size
    return prepend(value) if index == 0
    current_node = head
    (index-1).times { current_node = current_node.next_node }
    current_node.next_node = Node.new(value, current_node.next_node)
  end

  def remove_at(index)
    return nil if index >= size
    temp_left = @head
    temp_right = @head
    (index-1).times { temp_left = temp_left.next_node}
    (index).times { temp_right = temp_right.next_node}
    temp_left.next_node = temp_right.next_node
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
list.append(2)
list.append(3)
puts list
list.prepend("prepend")
puts list
list.pop
puts list
p("List size: #{list.size}")
list.insert_at(0, "insert @ 0")
puts list
list.insert_at(1, "insert @ 1")
puts list
list.remove_at(1)
puts list
list.insert_at(99, 99)
puts list