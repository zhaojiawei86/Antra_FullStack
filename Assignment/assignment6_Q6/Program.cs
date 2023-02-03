using System;

namespace Jan2023.Console1
{
    public class Program
    {
        public static void Main()
        {
            // create departemnt
            Department department = new Department();

            // create courses
            Course java = new Course();
            Course c = new Course();
            department.AddCourses(java);
            department.AddCourses(c);

            // create Instructor
            Person itr = new Instructor(department);
            itr.Salary = 10000;
            ((Instructor)itr).JoinDate = new DateTime(2008, 3, 1, 7, 0, 0);
            Console.WriteLine(itr.CalculateSalary()); // 25000
            department.DepartmentHead = (Instructor)itr;

            // create student
            Student std = new Student();
            std.YearOfBirth = 2000;
            Console.WriteLine(std.GetAge()); // 23
            Console.WriteLine(std.CalculateSalary); // 0
            std.AddAddress("gardner st");
            std.AddAddress("allston");
            foreach(string address in std.GetAddresses())
            {
                Console.WriteLine(address);
            }
            // gardner st
            // allston
         
            java.EnrollStudent(std);
            java.Grade = Course.Grades.A;
            c.EnrollStudent(std);
            c.Grade = Course.Grades.B;
            foreach (Student student in java.GetEnrolledStudents())
            {
                Console.WriteLine(student);
            }

            // calculate gpa
            std.AddCourse(java);
            std.AddCourse(c);
            Console.WriteLine(std.CalculateGPA());

        }

    }
    
}


