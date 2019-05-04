def bubble_sort(array)
  push_next_element_to_top = lambda do |array, count_of_elements_at_top|
    for i in 0...(array.length - count_of_elements_at_top - 1)
      array[i], array[i + 1] = array[i + 1],  array[i] if array[i] > array[i + 1]
    end
  end
  
  for i in 0...(array.length - 1) do
    push_next_element_to_top.call(array, i)
  end

  array
end

puts bubble_sort((1..10).to_a.shuffle).join(", ")
