using System;
namespace DapperTutorialCore.Entities
{
    /*
	 id INT PRIMARY KEY,
     Name VARCHAR(30),
     Location VARCHAR(40)
	 */
    public class Department
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public string Location { get; set; }

		// navigation property
		public List<Employee> Employees { get; set; }
	}
}    

