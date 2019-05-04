class Stack
  class EmptyStackError < StandardError; end
  Node = Struct.new(:value, :next)

  def initialize
    @head = nil
  end

  def push(value)
    self.head = Node.new(value, head)
    value
  end

  def pop
    raise EmptyStackError if empty? 
    
    value = head.value
    self.head = head.next

    value
  end
  
  def empty?
    head.nil?
  end
  
  private
  
  attr_accessor :head
end
