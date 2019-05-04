class Queue
  Node = Struct.new(:value, :next, :prev)
  
  def initialize
    @head = nil
    @last = nil
  end

  def push(value)
    if empty?
      push_first_element(value)
    else
      push_in_end(value)
    end
        
    value
  end

  def pop
    raise 'EmptyQueueError' if empty? 
    
    value = @head.value
    @head = @head.next

    value
  end

  def empty?
    @head.nil? && @last.nil?
  end

  private
  
  def push_first_element(value)
    @head = @last = Node.new(value, nil, nil)
  end

  def push_in_end(value)
    new_last = Node.new(value, nil, @last)
    @last.next = new_last
    @last = new_last
  end
end
