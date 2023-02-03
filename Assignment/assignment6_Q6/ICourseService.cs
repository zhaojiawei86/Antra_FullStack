using System;
using static Jan2023.Console1.Course;

namespace Jan2023.Console1
{
	public interface ICourseService
    {
        public void EnrollStudent(Student student);
        public List<Student> GetEnrolledStudents();
    }
}

