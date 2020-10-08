class Heap:
  def __init__(self, maxsize):
    self.heapList = [float('-inf')]
    self.size = 0
    self.max_size = maxsize

  def insert(self, val):
    if self.size >= self.max_size: return

    self.heapList.append(val)
    self.size += 1
    self.up(self.size)


  def up(self, p):
    while(p // 2 > 0 and self.heapList[p] > self.heapList[p // 2]):        
      self.swap(p, p // 2)
      p = p // 2
    
  
  def swap(self, i, j):
    self.heapList[i], self.heapList[j] = self.heapList[j], self.heapList[i]




h = Heap(10)
h.insert(5)
print(h.heapList)
h.insert(10)
print(h.heapList)
h.insert(-1)
print(h.heapList)

h.insert(100)
h.insert(-100)
print(h.heapList)
