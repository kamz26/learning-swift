import UIKit

func merge(left:[Int], right:[Int]) -> [Int]{
  
  var mergeSort:[Int] = []
  var l = left
  var r = right
  
  while(!l.isEmpty && !r.isEmpty){
    if l.first ?? -1 < r.first ?? -1{
      mergeSort.append(l.removeFirst())
    }else{
      mergeSort.append(r.removeFirst())
    }
  }
  return mergeSort + l + r
}

func mergeSort(arr:[Int]) -> [Int]{
  guard arr.count > 1 else {return arr}
  
  let left = Array(arr[0..<arr.count/2])
  let right = Array(arr[arr.count/2..<arr.count])
  return merge(left: mergeSort(arr: left), right: mergeSort(arr: right))
}




let sortedArr = mergeSort(arr: [5,4,3,2,1])
print(sortedArr)


class Person{
  var name:String
  weak var friend:Person?
  
  init(name:String){
    self.name = name
  }
  
  deinit{
    print("\(self.name) got denitialized")
  }
}

var ram:Person?   = Person(name: "Ram")
var shyam:Person? = Person(name: "Shyam")

ram?.friend = shyam
shyam?.friend = ram

ram = nil



//let serialQueue = DispatchQueue(label: "swiftlee.serial.queue")
//
//serialQueue.async {
//    print("Task 1 started")
//    // Do some work..
//    print("Task 1 finished")
//}
//serialQueue.async {
//    print("Task 2 started")
//    // Do some work..
//    print("Task 2 finished")
//}

let concurrentQueue = DispatchQueue(label: "swiftlee.concurrent.queue", attributes: .concurrent)

concurrentQueue.async {
    print("Task 1 started")
    // Do some work..
    print("Task 1 finished")
}
concurrentQueue.async {
    print("Task 2 started")
    // Do some work..
    print("Task 2 finished")
}


extension Array{
  func myMap<T>(transform:(Element) -> T) -> [T]{
    var result: [T] = []
    
    for item in self{
      result.append(transform(item))
    }
    return result
  }
  
  func mycompactMap<T>(transform:(Element) -> T?) -> [T]{
    var result:[T] = []
    
    forEach { item in
      if let value = transform(item){
        result.append(value)
      }
    }
    return result
  }
}




[1,2,3,4,5].myMap {print($0)}
print("compactMap")
let values = ["1","2","a","4","5"].mycompactMap { Float($0)}
print(values)






