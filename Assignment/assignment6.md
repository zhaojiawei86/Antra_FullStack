# Assignment 6 for Antra Full Stack  
Object-Oriented Programming  
Jiawei Zhao

**1. What are the six combinations of access modifier keywords and what do they do?**  
private: only in the same class  
protected: in the same class or class derived from that class  
internal: in the same assembly  
public: everywhere in the program  
protected internal: in the same assembly(internal) and class from different assembly derived from its class  
private protected: in the same class or class derived from that class (protected) in the same assembly    
Reference: https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/access-modifiers

**2. What is the difference between the static, const, and readonly keywords when applied to a type member?**  
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

**3. What does a constructor do?**  
A special method that is used to initialize objects. Set initial value for object through passed parameters.

**4. Why is the partial keyword useful?**  
Partial class could implement functions of one single class from different files, and all these files will be combined
into a single file class while compiling.  
Advantages:    
1. multiple developers could work on the same class from different files simultaneously.
2. split the class into different parts(like design and logic code) for readable.

**5. What is a tuple?**  
Tuple is a data structure which could store at most 8 elements in different data types.
```c#
// create
Tuple<int, string, int> tuple = new Tuple(1, "Bob", 18);
var tuple2 = Tuple.Create(1, "Bob", 18);

// access
Console.Write(tuple.Item1());
```

**6. What does the C# record keyword do?**  
Record help to define new values for immutable properties(init), which make the development faster and cleaner.
```c#
public record Member
{
 public int Id { get; init; }
 public string Name { get; init; }
 public int Age { get; init; }
 public Member(int id, string name, int age)
 {
  this.Id = id;
  this.Name = name;
  this.Age = age;
 }
}
 
// Main
Member member = new Member(1, "Bob", 18);
Member newMember = member with { Age = 20 };
```
Reference: https://www.c-sharpcorner.com/article/c-sharp-9-0-introduction-to-record-types/

**7. What does overloading and overriding mean?**  
Both are common forms for polymorphism.  
overloading: having multiple methods within the same class, with the same function name but different parameters.
The methods behave differently depending on the parameters passed through.   
overriding: define a method from the class which inherits from parent class. When a method is overriden, method name and 
parameters stay the same. The method be got called depends on the type of the object that's calling it.

**8. What is the difference between a field and a property?**  
Fields should be kept private to a class and accessed via get and set properties. 
```c#
public class Employee
 {
  // private field
  private int id;
  // property: help to get and set private field
  public int Id
  {
   get { return id; }
   set { id = value; }
  }
}
```

**9. How do you make a method parameter optional?**  
1. method overloading
2. parameter arrays
3. default parameter values
4. optional attributes
```c#
// parameter arrays
public static int Sum(int first, int second, params int[] numbers)
{
 int result = first + second;
 foreach(int number in numbers)
  result += number;
 return result;
}

// default parameter values
public static int Sum2(int first, int second, int[] numbers = null)
{
 int result = first + second;
 if (numbers != null)
 { 
  foreach (int number in numbers)
   result += number;
 }
 return result;
}

// optional attribute
// using System.Runtime.InteropServices;
public static int Sum3(int first, int second, [Optional] int[] numbers)
{
 int result = first + second;
 if (numbers != null)
 {
  foreach (int number in numbers)
   result += number;
 }
 return result;
}
```
Reference: https://www.c-sharpcorner.com/article/make-parameter-optional-in-c-sharp/

**10. What is an interface and how is it different from abstract class?**  
An interface is a completely "abstract class" that is used to group related methods with empty bodies  
Difference:  
Abstract class allows to create functionality that subclasses can implement or override. 
An interface only allows to define functionality, not implement it. 
A class can extend only one abstract class, but multiple interfaces. 

**11. What accessibility level are members of an interface?**  
Interface itself can have access specifiers like protected or internal.  
Members of interface could have all access modifiers, but have to provide a default implementation for private members.
 
**12. True/False. Polymorphism allows derived classes to provide different implementations of the same method.**  
True, overloading.

**13. True/False. The override keyword is used to indicate that a method in a derived class is providing its own implementation of a method.**  
True.

**14. True/False. The new keyword is used to indicate that a method in a derived class is providing its own implementation of a method.**  
False, "new" hides a member that is inherited from a base class, the derived version of the member replaces the base class version.

**15. True/False. Abstract methods can be used in a normal (non-abstract) class.**  
False.  

**16. True/False. Normal (non-abstract) methods can be used in an abstract class.**  
True.  

**17. True/False. Derived classes can override methods that were virtual in the base class.**  
True.  

**18. True/False. Derived classes can override methods that were abstract in the base class.**  
False. not override, give the implement detail of abstact method which has an empty body.  

**19. True/False. In a derived class, you can override a method that was neither virtual non abstract in the base class.**  
False.   

**20. True/False. A class that implements an interface does not have to provide an implementation for all of the members of the interface.**  
False.  

**21. True/False. A class that implements an interface is allowed to have other members that aren’t defined in the interface.**  
True.  

**22. True/False. A class can have more than one base class.**  
False.  

**23. True/False. A class can implement more than one interface.**  
True.  

## Designing and Building Classes using object-oriented principles
**1. Write a program that demonstrates use of four basic principles of
object-oriented programming /Abstraction/, /Encapsulation/, /Inheritance/ and
/Polymorphism/.  
2. Use /Abstraction/ to define different classes for each person type such as Student
and Instructor. These classes should have behavior for that type of person.  
3. Use /Encapsulation/ to keep many details private in each class.  
4. Use /Inheritance/ by leveraging the implementation already created in the Person
class to save code in Student and Instructor classes.  
5. Use /Polymorphism/ to create virtual methods that derived classes could override to
create specific behavior such as salary calculations.**  
**6. Make sure to create appropriate /interfaces/ such as ICourseService, IStudentService,
IInstructorService, IDepartmentService, IPersonService, IPersonService (should have
person specific methods). IStudentService, IInstructorService should inherit from
IPersonService.**
Person  
Calculate Age of the Person  
Calculate the Salary of the person, Use decimal for salary  
Salary cannot be negative number  
Can have multiple Addresses, should have method to get addresses  
Instructor  
Belongs to one Department and he can be Head of the Department  
Instructor will have added bonus salary based on his experience, calculate his
years of experience based on Join Date
Student  
Can take multiple courses  
Calculate student GPA based on grades for courses  
Each course will have grade from A to F  
Course  
Will have list of enrolled students  
Department  
Will have one Instructor as head  
Will have Budget for school year (start and end Date Time)  
Will offer list of courses  

Link of answer:


