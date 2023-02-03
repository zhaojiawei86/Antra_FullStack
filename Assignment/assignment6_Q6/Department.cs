using System;
namespace Jan2023.Console1
{
	public class Department: IDepartmentService
	{
        public string DepaName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public List<Course> Courses { get; set; }
        public Instructor DepartmentHead { get; set; }
        private decimal budget;
        public decimal Budget
        {
            get
            {
                return this.budget;
            }
            set
            {
                if (budget >= 0)
                    this.budget = budget;
                else
                    Console.WriteLine("Error: Budget cannot be negative.");
            }
        }

        public Department()
        {
            Courses = new List<Course>();
        }

        public void AddCourses(Course course)
        {
            Courses.Add(course);
        }
    }
}

