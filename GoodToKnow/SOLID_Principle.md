# SOLID
SOLID is an acronym created by Robert C. Martin (Uncle Bob). 
It represents five principles of object-oriented programming: 
- Single responsibility, 
- Open/Closed, 
- Liskov Substitution, 
- Interface Segregation, and 
- Dependency Inversion.

By these principles, we can solve the main problems of a bad architecture:

* Fragility: A change may break unexpected parts—it is very difficult to detect if you don’t have a good test coverage.
* Immobility: A component is difficult to reuse in another project—or in multiple places of the same project—because it has too many coupled dependencies.
* Rigidity: A change requires a lot of efforts because affects several parts of the project.

## Quick Summary
* Each an every class should have only one responsibility
* Should not modify the existing class for change requirement, rather extent the class
* Extending or Inheriting a child/derived class should not break any parent or base class functionality
* The Interface or class API’s to client should have minimum information required by the client
* Class A should not depend on Class B or vice versa, both should be losely coupled 

> Use SOLID principles as your weapon in the war of coding :)


## Resource:
1. [Medium](https://medium.com/ios-expert-series-or-interview-series/solid-design-principle-using-swift-34bb1731cfb3)
2. [GitHub](https://github.com/Vinodh-G/SOLID-Principles-Swift)
3. [dZone](https://dzone.com/articles/solid-principles-applied-to-swift-1)
