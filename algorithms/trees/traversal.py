class TreeNode:
  def __init__(self, val):
    self.val = val
    self.left = None
    self.right = None

class Traversal:
  def inOrder(self, node):
    if not node: return

    yield from self.inOrder(node.left)
    yield(node)
    yield from self.inOrder(node.right)



root = TreeNode(10)

root.left = TreeNode(5)
root.left.left = TreeNode(0)
root.left.right = TreeNode(7)

root.right = TreeNode(15)
root.right.right = TreeNode(20)
root.right.left = TreeNode(12)
nodes = Traversal().inOrder(root)

for node in nodes:
  print(node.val)
