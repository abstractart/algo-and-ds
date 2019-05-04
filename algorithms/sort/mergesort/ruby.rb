require 'pry'

def mergesort(array)
  case array.length
  when 0, 1
    array
  when 2
    swap(array) if array[0] > array[1]
    array
  else
    middle = array.length / 2
    mergesort_recursive(array[0...middle], array[middle...array.length])
  end
end


def mergesort_recursive(array1, array2)
  merge(mergesort(array1),   mergesort(array2))
end

def swap(array)
  array[0], array[1] = array[1], array[0]
end

def merge_acc(acc, array1, i1, array2, i2)
  return append_to_end(acc, array2[i2..-1]) if i1 >= array1.length
  return append_to_end(acc, array1[i1..-1]) if i2 >= array2.length

  if array1[i1] <= array2[i2]
    acc << array1[i1]
    merge_acc(acc, array1, i1 + 1, array2, i2)
  else
    acc << array2[i2]
    merge_acc(acc, array1, i1, array2, i2 + 1)
  end
end

def merge(array1, array2)
  merge_acc([], array1, 0, array2, 0)
end

def append_to_end(array1, array2)
  array2.each do |e|
    array1 << e
  end

  array1
end
# arr1 = Array.new(10) { rand(1...100) }.sort
# arr2 = Array.new(10) { rand(1...100) }.sort

# puts arr1.join(", ")
# puts arr2.join(", ")
# puts merge(arr1, arr2).join(", ")

array = Array.new(10) { rand(1...100) }
puts array.join(", ")

puts mergesort(array).join(", ")
