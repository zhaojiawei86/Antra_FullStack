using System;
namespace Jan2023.Console1
{
	public interface IStudentService : IPersonService
    {
        public void AddCourse(Course course);
        public double CalculateGPA();
    }
}

