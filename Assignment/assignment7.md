# Generics
Jiawei Zhao  


**1. Describe the problem generics address.**  
Allow to define classes or methods which are available to any data type. Help to increase the reuse of code.   

**2. How would you create a list of strings, using the generic List class?**  
```c#
List<string> strList = new List<string>();
strList.Add("string");
```
**3. How many generic type parameters does the Dictionary class have?**  
Two. key and value.  

**4. True/False. When a generic class has multiple type parameters, they must all match.**  
False. Type parameters could be different, like Dictionary, two different type parameters, key and value types.  

**5. What method is used to add items to a List object?**  
```c#
obj.Add(item)
```

**6. Name two methods that cause items to be removed from a List.**  
```c#
obj.Remove(item);
obj.RemoveAt(index);
```

**7. How do you indicate that a class has a generic type parameter?**  
Using angle brackets (< and >) after the class name, followed by the type parameter name.
```c#
public class DataStore<T> {}
// or
public class KeyValuePair<TKey, TValue> {}
```

**8. True/False. Generic classes can only have one generic type parameter.**  
False. Eg. Dictionary.  

**9. True/False. Generic type constraints limit what can be used for the generic type.**  
True.
For the following example, T limited to only reference data type.
```c#
class DataStore<T> where T : class
{
    public T Data { get; set; }
}
```
Reference: https://www.tutorialsteacher.com/csharp/constraints-in-generic-csharp  

**10. True/False. Constraints let you use the methods of the thing you are constraining to.**
True. The methods, properties, and other members of the constraints are available to generic type that was constrainted.
```c#
public class MyGenericClass<T> where T : IComparable
{
    public T Max(T a, T b)
    {
        return a.CompareTo(b) > 0 ? a : b;
    }
}
```
IComparable ensures that T implements the IComparable interface, and use the CompareTo method directly on T.  

## Practice working with Generics
**1. Create a custom Stack class MyStack<T> that can be used with any data type which has following methods**  
1. int Count()
2. T Pop()
3. Void Push()
2. Create a Generic List data structure MyList<T> that can store any data type.
Implement the following methods.
1. void Add (T element)
2. T Remove (int index)
3. bool Contains (T element)
4. void Clear ()
5. void InsertAt (T element, int index)
6. void DeleteAt (int index)
7. T Find (int index)
3. Implement a GenericRepository<T> class that implements IRepository<T> interface
that will have common /CRUD/ operations so that it can work with any data source
such as SQL Server, Oracle, In-Memory Data etc. Make sure you have a type constraint
on T were it should be of reference type and can be of type Entity which has one
property called Id. IRepository<T> should have following methods
1. void Add(T item)
2. void Remove(T item)
3. Void Save()
4. IEnumerable<T> GetAll()
5. T GetById(int id)
Explore following topics
Generics in .NET
Generic classes and methods
Collections and Data Structures
Commonly Used Collection Types
