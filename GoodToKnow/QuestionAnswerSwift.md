## [Why swift is better than objc](https://www.youtube.com/watch?v=JpUnYzpAuLs&list=PLAUm8J2tC3-c9EW7mR74DLWt7Wt2Wyj-u)
Swift is better because:
* faster
* Less Code
* Type safe
* no pointer
* Better Memory mangegment
* Protocol Oriented
* Optionals makes application Bug free

### [Any vs. AnyObject in Swift](https://medium.com/@mimicatcodes/any-vs-anyobject-in-swift-3-b1a8d3a02e00)
Any and AnyObject are two special types in Swift that are used for working with non-specific types.

> Any can represent an instance of any type at all, including function types and optional types.

> AnyObject can represent an instance of any class type.

### What is type iterface
Automatic detecting Data type
```swift
let age = 10
let name = "asif"
```
### What is type annotations
Explicitly telling type:
```swift
let age: Int = 10
let name: Swift = "asif"
```
### What is tupple
Tupple is a process of groupingg multiple values in a single variable.

```swift
let man = ("Asif", 20)
print(man.0) // Asif
print(man.1) // 20

let man = (ame: "Asif", age: 20)
print(man.name) // Asif
print(man.age) // 20

```

### What is String Interpolation
String Interpolation is a procees of embedding values into a string

```swift
let name: Swift = "asif"
print("My name is \(name)")
```

### What is optional
An optional in Swift is a type that can hold either a value or no value. 
Optionals are written by appending a `<?>` to any type:
```swift
var variableName: String?
```

### What is optional unwrapping
### What is optional binding

```swift
let myName: Swift?

if let name = myName {
    print("My name is \(name)")
}
```

### What is optional chaining
```swift
class Man {
    var name: Swift?
    var age: Int?
}

let asif: Man?

let name = asif?.name
print("My name is \(name)")
```

### What is guard
Guard is a process of optional unwrapping

## What is Key-Value-Coding and Key-Value-Observing in  swift?
Key-Value-Coding (KVC): means accessing a property or value using a string.

Key-Value-Observing (KVO) allows you to observe changes to a property or value.

To observe a property using KVO you would identify to property with a string; 
i.e., using KVC. Therefore, the observable object must be KVC compliant.




## [What's the difference between the frame and the bounds?](https://stackoverflow.com/questions/1210047/cocoa-whats-the-difference-between-the-frame-and-the-bounds/28917673)

Frame = a view's location and size using the parent view's coordinate system.

> Important for: placing the view in the parent.

Bounds = a view's location and size using its own coordinate system.

> Important for: placing the view's content or subviews within itself.

<p align="center">
    <a href="GoodToKnow/Resource/frame_bounds.png"> <img src="GoodToKnow/Resource/frame_bounds.png"  width="200" height="150"/> </a>
</p>

```
Frame
    origin = (0, 0)
    width = 80
    height = 130

Bounds 
    origin = (0, 0)
    width = 80
    height = 130
```
