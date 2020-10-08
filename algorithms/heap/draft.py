class TreeNode:
  def __init__(self, val):
    self.val = val
    self.left = None
    self.right = None
    self.parent = None



class Heap:
  def __init__(self):
    self.root = None
  
  def min(self):
    if not self.root: return float('-inf')
    return self.root.val

  def insert(self, val):
    if not self.root:
      self.root = TreeNode(val)
      return
    
    curr = self.root
    stack = []
    while(curr):
      stack.append(curr)
      curr = curr.right

    stack.append(TreeNode(val))

    nextChild = None
    while(len(stack) > 1):
      child = stack.pop()

      parent = stack.pop()

      if child.val < parent.val:
        child.right = parent
        parent.right = nextChild
        nextChild = parent
        stack.append(child)
      else:
        parent.right = child
        child.right = nextChild
        break

    if len(stack) == 1: self.root = stack.pop()
