import UIKit

class BinaryTreeNode{
  var value:Int
  var left:BinaryTreeNode?
  var right:BinaryTreeNode?
  
  init(value:Int){
    self.value = value
  }
}


class BinaryTree{
  var root:BinaryTreeNode?
  var maxLevel = 0
}


extension BinaryTreeNode{
  func inOrder(process:(BinaryTreeNode) -> Void){
    left?.inOrder(process: process)
    process(self)
    right?.inOrder(process: process)
  }
  
  func preOrder(process:(BinaryTreeNode) -> Void){
    process(self)
    left?.preOrder(process: process)
    right?.preOrder(process: process)
  }
  
  func postOrder(process:(BinaryTreeNode) -> Void){
    left?.postOrder(process: process)
    right?.postOrder(process: process)
    process(self)
  }
  
}

//MARK: - Height Of Binary Tree
extension BinaryTree{
  func getHeightOfBinaryTree(node:BinaryTreeNode?) -> Int{
    
    if node == nil{
      return -1
    }
    
    let leftHeight = getHeightOfBinaryTree(node: node?.left)
    let rightHeight = getHeightOfBinaryTree(node: node?.right)
                         
//    print("left: \(leftHeight) right: \(rightHeight)")
    
    return 1 + max(leftHeight,rightHeight)
  }
}

//MARK: - Left View and Right View
extension BinaryTree{
  func leftView(node:BinaryTreeNode?, level:Int){
    
    if node == nil{
      return
    }
    
    if maxLevel < level{
      print(node?.value ?? -1)
      maxLevel = level
    }
    leftView(node: node?.left, level: level + 1)
    leftView(node: node?.right, level: level + 1)
  }
  
  func rightView(node:BinaryTreeNode?, level:Int){
    if node == nil{
      return
    }
    
    if maxLevel < level{
      print(node?.value ?? -1)
      maxLevel = level
    }
    rightView(node: node?.right, level: level + 1)
    rightView(node: node?.left, level: level + 1)
  }
}


extension BinaryTree{
  func topView(node:BinaryTreeNode?){
    
    
  }
  
}


class BinaryNodeQueue{
  var nodes:[BinaryTreeNode] = []
  var level:Int!
  
  var isEmpty:Bool{
    return nodes.isEmpty
  }
  
  func enqueue(node:BinaryTreeNode, level:Int){
    nodes.insert(node, at: 0)
    self.level = level
  }
  func deque() -> BinaryTreeNode?{
    guard let last = nodes.last else {return nil}
    nodes.removeLast()
    return last
  }
  
  
}


//Tree
let zero = BinaryTreeNode(value: 0)
let one = BinaryTreeNode(value: 1)
let five = BinaryTreeNode(value: 5)
let seven = BinaryTreeNode(value: 7)
let eight = BinaryTreeNode(value: 8)
let nine = BinaryTreeNode(value: 9)

one.left = zero
one.right = five
seven.right = nine
nine.left = eight
seven.left = one


var binaryTreeRoot = BinaryTree()
binaryTreeRoot.root = seven

print("In order Traversal")
binaryTreeRoot.root?.inOrder{print($0.value)}

print("Pre order Traversal")
binaryTreeRoot.root?.preOrder{print($0.value)}

print("Post order Traversal")
binaryTreeRoot.root?.postOrder{print($0.value)}

print("Print height of Tree")
let height = binaryTreeRoot.getHeightOfBinaryTree(node: binaryTreeRoot.root)
print(height)

print("Left View Tree")
binaryTreeRoot.leftView(node: binaryTreeRoot.root, level: 1)

binaryTreeRoot.maxLevel = 0
print("Right View Tree")
binaryTreeRoot.rightView(node: binaryTreeRoot.root, level: 1)


