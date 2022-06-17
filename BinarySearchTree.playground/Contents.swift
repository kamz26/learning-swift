import UIKit

class BinaryNode{
  var value:Int!
  var left:BinaryNode?
  var right: BinaryNode?
  init(_ val:Int){
    self.value = val
  }
}

struct BinarySearchTree{
  public private(set) var root:BinaryNode?
}

extension BinarySearchTree{
  public mutating func insert(_ value:Int){
    self.root = insert(node: root, value: value)
  }
  
  private func insert(node:BinaryNode?, value:Int) -> BinaryNode{
    guard let node = node else {
      return BinaryNode(value)
    }
    
    if value < node.left?.value ?? -10001{
      node.left = insert(node: node.left, value: value)
    }else{
      node.right = insert(node: node.right, value: value)
    }
    return node
  }
}




var bst = BinarySearchTree()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)


