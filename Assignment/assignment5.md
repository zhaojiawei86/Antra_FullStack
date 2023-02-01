# Assignment 05 Introduction to C# and Data Types
Jiawei Zhao

## Data Types
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

## Controlling Flow and Converting Types
