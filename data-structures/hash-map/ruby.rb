class MyOwnHash
  Tuple = Struct.new(:key, :value)
  attr_reader :array, :digest_calculator
  
  def initialize(digest_calculator:)
    @array = Array.new
    @digest_calculator = digest_calculator
  end

  def set(key, value)
    with_digest_and_index(key) do |digest, index| 
      index = 0 if index.nil?
      array[digest][index] = Tuple.new(key, value)
      value
    end
  end
  
  def get(key)
    with_digest_and_index(key) do |digest, index| 
      array[digest][index].value if !index.nil?
    end
  end

  def delete(key)
    with_digest_and_index(key) do |digest, index|
      array[digest][index] = nil if !index.nil?
    end
  end

  def with_digest_and_index(key)
    digest = digest_calculator.call(key)
    array[digest] ||= []
    index = array[digest].index { |tuple| !tuple.nil? && tuple.key == key }
    
    yield(digest, index)
  end
end
