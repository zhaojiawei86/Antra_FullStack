using System;
namespace Jan2023.Console1
{
    public class Course : ICourseService
    {
        public enum Grades
        {
            F,
            D,
            C,
            B,
            A
        }
        public string CourseName { get; set; }
        public Grades Grade { get; set; }
        private List<Student> enrolledStudents;
        public Course()
        {
            enrolledStudents = new List<Student>();
        }

        public void EnrollStudent(Student student)
        {
            enrolledStudents.Add(student);
        }

        public List<Student> GetEnrolledStudents()
        {
            return enrolledStudents;
        }
    }
}


