using System;
using System.Xml.Linq;

namespace Jan2023.Console1
{
	public class Student : Person, IStudentService
    {
        public List<Course> Courses { get; set; }

        public Student()
        {
            Courses = new List<Course>();
        }

        public void AddCourse(Course course)
        {
            Courses.Add(course);
        }

        public double CalculateGPA()
        {
            double totalGrades = 0;
            foreach(Course course in Courses)
            {
                totalGrades += (int)course.Grade;
            }
            return totalGrades / Courses.Count;
        }

    }
}

