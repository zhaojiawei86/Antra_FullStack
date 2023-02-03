using System;
namespace Jan2023.Console1
{
	public interface IPersonService
    {
        public List<string> Addresses { get; set; }
        public string Name { get; set; }
        public int YearOfBirth { get; set; }
        public decimal CalculateSalary();
        public int GetAge();
        public void AddAddress(string address);
        public List<string> GetAddresses();
    }
}

