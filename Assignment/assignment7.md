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
```c#
public class MyStack<T>
{
    private List<T> myStack;
    public MyStack()
    {
        myStack = new List<T>();

    }
    public int Count()
    {
        return myStack.Count;
    }
    public void Push(T item)
    {
        myStack.Add(item);
    }
    public T Pop()
    {
        if (this.Count() == 0)
        {
            throw new Exception("myStack is empty.");
        }
        T item = myStack[this.Count() - 1];
        myStack.RemoveAt(this.Count() - 1);
        return item;
    }
} 
```
```c#
MyStack<int> stack = new MyStack<int>();
stack.Pop();
stack.Push(10);
stack.Push(20);
stack.Pop(); 
```
**2. Create a Generic List data structure MyList<T> that can store any data type.**  
Implement the following methods.  
1. void Add (T element)
2. T Remove (int index)
3. bool Contains (T element)
4. void Clear ()
5. void InsertAt (T element, int index)
6. void DeleteAt (int index)
7. T Find (int index)
```c#
public class MyList<T>
{
    private List<T> list;
    public MyList()
    {
        list = new List<T>();
    }
    public void Add(T element)
    {
        list.Add(element);
    }
    public T Remove(int index)
    {
        if (index < 0 || index >= list.Count)
        {
            throw new Exception("The index is out of range.");
        }
        T element = list[index];
        list.RemoveAt(index);
        return element;
    }
    public bool Contains(T element)
    {
        return list.Contains(element);
    }
    public void Clear()
    {
        list.Clear();
    }
    public void InsertAt(T element, int index)
    {
        if (index < 0 || index >= list.Count)
        {
            throw new Exception("The index is out of range.");
        }
        list.Insert(index, element);
    }
    public void DeleteAt(int index)
    {
        if (index < 0 || index >= list.Count)
        {
            throw new Exception("The index is out of range.");
        }

        list.RemoveAt(index);
    }
    public T Find(int index)
    {
        if (index < 0 || index >= list.Count)
        {
            throw new Exception("The index is out of range.");
        }
        return list[index];
    }

}    
```
    
```c#
MyList<int> list = new MyList<int>();
list.Add(10);
list.Add(20);
list.Add(30);
Console.WriteLine(list.Remove(0)); // 10
Console.WriteLine(list.Contains(10)); // False
list.InsertAt(10, 0);
list.DeleteAt(0);
Console.WriteLine(list.Find(1)); // 30
list.Clear();
```
    
**3. Implement a GenericRepository<T> class that implements IRepository<T> interface
that will have common /CRUD/ operations so that it can work with any data source
such as SQL Server, Oracle, In-Memory Data etc. Make sure you have a type constraint
on T were it should be of reference type and can be of type Entity which has one
property called Id.**  
IRepository<T> should have following methods
1. void Add(T item)
2. void Remove(T item)
3. Void Save()
4. IEnumerable<T> GetAll()
5. T GetById(int id)

```c#
public interface IEntity
{
    public int Id { get; set; }
}  
```
```c#
public class Entity: IEntity
{
    public int Id { get; set; }
}   
```
```c#
public interface IRepository<T> where T: class
{
    void Add(T item);
    void Remove(T item);
    void Save();
    IEnumerable<T> GetAll();
    T GetById(int id);
}
```
```c#
public class GenericRepository<T> : IRepository<T> where T : class, IEntity
{
    private List<T> list;
    public GenericRepository()
    {
        list = new List<T>();
    }

    public void Add(T item)
    {
        this.list.Add(item);
    }

    public IEnumerable<T> GetAll()
    {
        return this.list;
    }

    public T GetById(int id)
    {
        return this.list.Find(item => item.Id == id);
    }

    public void Remove(T item)
    {
        this.list.Remove(item);
    }

    public void Save()
    {
        // save
    }
}
```
```c#
public static void Main()
{
    GenericRepository<Entity> rep = new GenericRepository<Entity>();
    rep.Add(new Entity { Id = 1 });
    rep.Add(new Entity { Id = 2 });
    rep.Add(new Entity { Id = 3 });

    foreach (Entity entity in rep.GetAll()){
        Console.WriteLine(entity.Id);
    }

    Entity item = rep.GetById(1);
    rep.Remove(item);

    foreach (Entity entity in rep.GetAll())
    {
        Console.WriteLine(entity.Id);
    }
}
```
