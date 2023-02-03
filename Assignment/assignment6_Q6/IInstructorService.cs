using System;
namespace Jan2023.Console1
{
	public interface IInstructorService : IPersonService
    {
        public Department Depart { get; set; }
        public bool IsHead { get; set; }
        public DateTime JoinDate { get; set; }
        public decimal CalculateSalary();
    }
}

