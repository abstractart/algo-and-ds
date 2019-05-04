require 'pry'

class SinglyLinkedList
  Node = Struct.new(:value, :next)
  
  def initialize
    @head = nil
  end
  
  def add_at(index, value)
    raise 'OutOfRange' if @head.nil? && index != 0

    return add_to_first(value) if empty?
    
    current = @head
    previous = nil
    (0...index).each do |i|
      raise "OutOfRange" if current.nil?
      previous = current
      current = @head.next
    end

    if !previous.nil?
        previous.next = Node.new(value, current)
    else
        @head = Node.new(value, current)
    end

    value
  end

  def empty?
    @head.nil?
  end

  private

  def add_to_first(value)
    @head = Node.new(value, nil)
    value
  end
end

sll = SinglyLinkedList.new



sll.add_at(0, 1)
sll.add_at(1, 2)
