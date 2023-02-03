using System;
using System.Xml.Linq;

namespace Jan2023.Console1
{
    public class Instructor : Person, IInstructorService
    {
        public Department Depart { get; set; }
        public bool IsHead { get; set; }
        public DateTime JoinDate { get; set; }
        public Instructor(Department department)
        {
            this.Depart = department;
        }
        public override decimal CalculateSalary()
        {
            int yearsOfExperience = DateTime.Now.Year - JoinDate.Year;
            decimal bonus = yearsOfExperience * 1000;
            return Salary + bonus;
        }
    }
}

