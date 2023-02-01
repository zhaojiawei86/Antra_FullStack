# Assignment 05 Introduction to C# and Data Types
Jiawei Zhao

## 1. Data Types
### Q1 What type would you choose for the following “numbers”?
A person’s telephone number: string  
A person’s height: byte 
A person’s age: byte  
A person’s gender (Male, Female, Prefer Not To Answer): string  
A person’s salary: decimal  
A book’s ISBN: string   
A book’s price: decimal   
A book’s shipping weight: float   
A country’s population: int   
The number of stars in the universe: long   
The number of employees in each of the small or medium businesses
in the United Kingdom (up to about 50,000 employees per business): short / int  

### Q2 What are the difference between value type and reference type variables? What is boxing and unboxing?
Valud Date Type: Store variable value in memory directly, allocated on the stack; 
Reference Data Type: Hold reference(pointer) in stack, points to another memory(heap) to store its real data. 

### Q3 What is meant by the terms managed resource and unmanaged resource in .NET
Managed resource: pure .NET code and managed by CLR, which could be freed up by GC.
Unmanaged resource: not directly under the control of GC, refers to the wilderness outside the .NET, like file 
handles, database connections etc.  

### Q4 Whats the purpose of Garbage Collector in .NET?
Automatic memory management.  
When a class object is created, certain memory will be allocated it to heap. After actions to this object are 
completed, memory allocated to it will be kind of waste.  
Garbage collection could be helpful cause it could automatically release the space when it's not longer required. 

## 2. Controlling Flow and Converting Types
### Q1 What happens when you divide an int variable by 0?
Throws a DivideByZeroException exception.
### Q2 What happens when you divide a double variable by 0?
Doesn't throw an exception, it returns positive infinity on my pc.
### Q3. What happens when you overflow an int variable, that is, set it to a value beyond its range?
Does not throw overflow exception. Return an error says explicit conversion exists.
### Q4. What is the difference between x = y++; and x = ++y;?
For the first one, it will assign y to x firstly, then then add y by 1;  
For the second one, y added by 1 and then assign new y to x.
### Q5. What is the difference between break, continue, and return when used inside a loop statement?
In a loop statement,  
break: jump out of a loop;  
continue: jump out one iteration and continue the next one;  
return: jump out of the method.
### Q6. What are the three parts of a for statement and which of them are required?
for (initialization; condition; iteration)  
required: none    
### Q7. What is the difference between the = and == operators?
=: assignment operater, used to assign value to variable;  
==: logical operater, combine two expressions and return boolean value.  
### Q8. Does the following statement compile? for ( ; true; ) ;
Will compile.
### Q9. What does the underscore _ represent in a switch expression? 
Represent default in c# switch case statement, in order to make the expression "lightweight".
```c#
int choice = 2; 
var result = choice switch  
{  
    1 => "Case 1",  
    2 => "Case 2",  
    3 => "Case 3",  
    _ => "Others"  
}; 
```
### Q10. What interface must an object implement to be enumerated over by using the foreach statement?
IEnumerable and IEnumerator interfaces

## Arrays and Strings
### Q1. When to use String vs. StringBuilder in C# ?
use string when:  
concatenate a few small strings;  
perform read-only operations;  
don't need to modify the value.  
Use StringBuilder when:  
concatenat many strings;  
perform frequent modifications to the string.
### Q2. What is the base class for all arrays in C#?
Array Class
### Q3. How do you sort an array in C#?
```c#
Array.Sort(array);
Array.Reverse(array);
```
### Q4. What property of an array object can be used to get the total number of elements in an array?
```c#
array.Length
```
### Q5. Can you store multiple data types in System.Array?
No, all arrays must store elements of a single data type.
Instead, with List<object>, you can store elements of any data type as objects.
### Q6. What’s the difference between the System.Array.CopyTo() and System.Array.Clone()?
```c#
array.CopyTo(newArray, startIndex);
datatype[] newArray = (datatype[])array.Clone();
```
Copyto( ) copies the source array to desitination array and takes two parameters. It starts copying 
from the given index of the new array to the end of the array. Slightly slower because it is a wrapper 
of the copy method.  
Clone() copies the array and returns the new object. It takes a single parameter and copies all content of 
the array. Needs to typecast the result to the original array datatype. 

