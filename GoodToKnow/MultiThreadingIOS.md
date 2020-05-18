# Concurrency:
Concurrency is a process of executing multiple task at same point of time.

**Morden OS are capable of running multiple task with a single cpu by sharing time among the different tasks.**
_Apple_ introduced multicore processor

**in iOS, Concurrency can be achived with two different API's:**
* Dispatch Queue (GCD)
* NSOperationQueue

### Why Concurrency?
* Get benefit out of the hardware
* Better UX

## GCD: Grand Central Dispatch
GCD is low level C API to perform tasks concurretly.
GCD provides and manage queues and tasks.

GCD is most commonly used api, 
   - to manage code
   - execute operatioins asysnchronously at UNIX level


## Queue
Queues are data structure to manage Object. It uses FIFO.


## What is a dispatch queue?
**A DispatchQueue is an abstraction layer on top of the GCD queue.**
It allows you to perform tasks asynchronously and concurrently in your application. 
Tasks are always executed in the order they’re added to the queue.

There are two types of varaites in Dispatch queue:
1. Serial Queue
2. Concurrent Queue


> **NOTE: Each application have one thread, that is Main Thread**

> **By default OS provides:  1 serial queue and 4 concurrent queues**

> **Main Dispatch queue is a serial queue**

> **4 Concurrent queue is known as Global Dispatch queue**

> **Global Dispatch queue are differetiated only by their priority level**


## What is a serial queue?
A serial Dispatch Queue performs only one task at the time. Serial queues are often used to synchronize access to a specific value or resource to prevent data races to occur.

> Serial queues are awesome to manage shared resource

### Creating a serial dispatch queue
A DispatchQueue defaults to a serial queue and can be initialized as follows:

```swift
let serialQueue = DispatchQueue(label: "swiftlee.serial.queue")

serialQueue.async {
    print("Task 1 started")
    // Do some work..
    print("Task 1 finished")
}
serialQueue.async {
    print("Task 2 started")
    // Do some work..
    print("Task 2 finished")
}

/*
Serial Queue prints:
Task 1 started
Task 1 finished
Task 2 started
Task 2 finished
*/
```

## What is a concurrent queue?
A concurrent queue allows us to execute multiple tasks at the same time. Tasks will always start in the order they’re added but they can finish in a different order as they can be executed in parallel. Tasks will run on distinct threads that are managed by the dispatch queue. The number of tasks running at the same time is variable and depends on system conditions.

## Creating a concurrent dispatch queue
A concurrent dispatch queue can be created by passing in an attribute as a parameter to the DispatchQueue initializer:

```swift
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

/*
Concurrent Queue prints:
Task 1 started
Task 2 started
Task 1 finished
Task 2 finished
*/
```

## What is a data race?
A data race can occur when multiple threads access the same memory without synchronization and at least one access is a write. You could be reading values from an array from the main thread while a background thread is adding new values to that same array.

Data races can be the root cause behind flaky tests and weird crashes. Therefore, it’s good practice to regularly spend time using the Thread Sanitizer.

## Asynchronous vs synchronous tasks
A DispatchQueue task can be run synchronously or asynchronously. The main difference occurs when you create the task.

* Synchronously starting a task will block the calling thread until the task is finished
* Asynchronously starting a task will directly return on the calling thread without blocking

## Resource
1. [YouTube](https://www.youtube.com/watch?v=3I_DFf4iYJ8)
2. [SwiftLee](https://www.avanderlee.com/swift/concurrent-serial-dispatchqueue/)
