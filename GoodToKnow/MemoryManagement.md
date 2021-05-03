# Memory Management

### What's the difference between the atomic and nonatomic attributes?
* Atomic: 
    - default behavior
    - only one thread accesses the variable (static type). 
    - Atomic is thread-safe, 
    - but it is slow.
* Nonatomic:
    - Not default behavior
    - multiple threads access the variable (dynamic type). 
    - Nonatomic is thread-unsafe, 
    - but it is fast.
[Link](https://stackoverflow.com/questions/588866/whats-the-difference-between-the-atomic-and-nonatomic-attributes#:~:text=Atomic%20means%20only%20one%20thread%20accesses%20the%20variable%20(static%20type).&text=Nonatomic%20means%20multiple%20threads%20access,unsafe%2C%20but%20it%20is%20fast.)


## Reference:
* [swift](https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html#:~:text=Swift%20uses%20Automatic%20Reference%20Counting,think%20about%20memory%20management%20yourself.&text=Reference%20counting%20applies%20only%20to%20instances%20of%20classes.)
* [Swift By Sundell](https://www.swiftbysundell.com/basics/memory-management/)
* [Vadimbulavin](https://www.vadimbulavin.com/swift-memory-management-arc-strong-weak-and-unowned/)
* [NileshiOS](https://swift007blog.wordpress.com/2017/01/14/what-is-arc-in-ios/)
* [StackOverflow](https://stackoverflow.com/questions/9110188/difference-between-arc-and-mrc#:~:text=Some%20differences%20between%20ARC%20and%20Garbage%20Collector%20are%3A&text=If%20some%20objects%20cycle%20(or,it%20other(retain%20cycle).)
* [JournalDev](https://www.journaldev.com/19619/swift-memory-management-automatic-reference-counting)
* [Medium](https://medium.com/computed-comparisons/garbage-collection-vs-automatic-reference-counting-a420bd4c7c81)
* [Medium](https://medium.com/elements/memory-management-in-swift-31e20f942bbc)
* [AppCoda](https://www.appcoda.com/memory-management-swift/)


