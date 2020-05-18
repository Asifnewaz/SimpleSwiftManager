## What is Abstraction in Java?
Abstraction in JAVA “shows” only the essential attributes and “hides” unnecessary details of the object from the user. 
In Java, abstraction is accomplished using Abstract classes, Abstract methods, and interfaces. 

Java doesn't have multiple inheritance; thus, 
you cannot have a class that implements two abstract classes at once. 

### Goal:
Its main goal is to handle complexity by hiding unnecessary details from the user. 
That enables the user to implement more complex logic on top of the provided abstraction without understanding or even thinking about all the hidden complexity.


## Abstract Class
A class which is declared “abstract” is called as an abstract class. 

* Abstract Classes can have constructors !
* It can have abstract methods as well as non abstract methods. 
* A normal class(non-abstract class) cannot have abstract methods.
(Abstract class is a partially implemented class)

## Abstract Method
A method without a body is known as an Abstract Method. 
It must be declared in an abstract class. 
The abstract method will never be final because the abstract class must implement all the abstract methods.


### Advantages of Data Abstraction:
* Abstraction helps in reducing programming complexity and effort.
* Helps the user to avoid writing the low level code
* Avoids code duplication and increases reusability.
* Can change internal implementation of class independently without affecting the user.
* Helps to increase security of an application or program as only important details are provided to the user.

## Interface: 
An interface contains behaviors that a class implements.

## Difference Between Interface and Abstract Class

Interface | Abstract
------------ | -------------
An interface contains only abstract methods. | An abstract contains both abstract and non abstract methods.
All the members of the interface are public by default. | abstract
Interface supports multiple inheritance. | Abstract does not, it can have public private...
Interface can't provide the implementation of abstract class. | Abstract method can provide impelmentation


## Abstract in swift:
There no concept of abstract in Swift (like Objective-C) but you can do this :

