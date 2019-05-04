require 'benchmark'

def hoarasort(array, first, last)
  i, j = first, last
  pivot = array[(first + last) / 2]

  loop do
    i+= 1 while (array[i] < pivot)
    j-= 1 while (array[j] > pivot)
    
    if (i <= j)
      array[i], array[j] = array[j], array[i] if (i < j)

      i+= 1
      j-= 1
    end
    break if (i >= j)
  end
  
  hoarasort(array, i, last)  if (i < last)
  hoarasort(array, first, j) if (first < j)
end

def hoara(array)
  hoarasort(array, 0, array.length - 1)
end

array_std = Array.new(1_000_0000) { rand(0..10_000) }
array_hoara = array_std.dup

Benchmark.bm do |x|
  x.report('std_sort') { array_std.sort! }
  x.report('hoara')    { hoara(array_hoara) }
end
