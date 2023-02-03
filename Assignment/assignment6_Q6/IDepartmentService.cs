using System;
namespace Jan2023.Console1
{
	public interface IDepartmentService
    {
        public string DepaName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public List<Course> Courses { get; set; }
        public Instructor DepartmentHead { get; set; }
    }
}

