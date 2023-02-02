# Assignment 6 for Antra Full Stack
Object-Oriented Programming
Jiawei Zhao

## Test your knowledge
### 1. What are the six combinations of access modifier keywords and what do they do?
private: only in the same class  
protected: in the same class or class derived from that class  
internal: in the same assembly  
public: everywhere in the program  
protected internal: in the same assembly(internal) and class from different assembly derived from its class  
private protected: in the same class or class derived from that class (protected) in the same assembly    
Reference: https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/access-modifiers

### 2. What is the difference between the static, const, and readonly keywords when applied to a type member?
const: constant at compile time, immutable after first initialization  
readonly: could only be initialized when declare or within the constructor at the same class
```c#
class MyClass
{
 readonly int X = 10; // initialized at the time of declaration
 readonly int X1;

 public MyClass(int x1)
 {
 X1 = x1; // initialized at run time
 }
}
```
static: static members are common to all the objects and do not tie to a specific object.

### 3. What does a constructor do?
A special method that is used to initialize objects. Set initial value for object through passed parameters.

### 4. Why is the partial keyword useful?


5. What is a tuple?
6. What does the C# record keyword do?
7. What does overloading and overriding mean?
8. What is the difference between a field and a property?
9. How do you make a method parameter optional?
10. What is an interface and how is it different from abstract class?
11. What accessibility level are members of an interface?
12. True/False. Polymorphism allows derived classes to provide different implementations
of the same method.
13. True/False. The override keyword is used to indicate that a method in a derived class is
providing its own implementation of a method.
14. True/False. The new keyword is used to indicate that a method in a derived class is
providing its own implementation of a method.
15. True/False. Abstract methods can be used in a normal (non-abstract) class. 16.
True/False. Normal (non-abstract) methods can be used in an abstract class. 17. True/False.
Derived classes can override methods that were virtual in the base class. 18. True/False.
Derived classes can override methods that were abstract in the base class. 19. True/False.
In a derived class, you can override a method that was neither virtual non abstract in the
base class.
20. True/False. A class that implements an interface does not have to provide an
implementation for all of the members of the interface.
21. True/False. A class that implements an interface is allowed to have other members that
aren’t defined in the interface.
22. True/False. A class can have more than one base class.
23. True/False. A class can implement more than one interface.
Working with methods
1. Let’s make a program that uses methods to accomplish a task. Let’s take an array and
reverse the contents of it. For example, if you have 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, it would
