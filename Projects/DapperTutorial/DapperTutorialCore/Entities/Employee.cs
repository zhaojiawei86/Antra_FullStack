using System;
namespace DapperTutorialCore.Entities
{
    /*
	 id INT,
     Name VARCHAR(30),
     Age INT,
     DeptID INT FOREIGN KEY REFERENCES Department(id)
	 */
    public class Employee
	{
        public int Id { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public int DeptID { get; set; }


        // navigation propoties
        public Department Department { get; set; }
    }


}

