using System;
namespace Jan2023.Console1
{
    public abstract class Person : IPersonService
    {
        public List<string> Addresses { get; set; }
        public string Name { get; set; }
        public int YearOfBirth { get; set; }
        private decimal salary;
        public decimal Salary
        {
            get { return salary; }
            set
            {
                if (value >= 0)
                    salary = value;
                else
                    throw new Exception("Salary cannot be negative.");
            }
        }
        
        public virtual decimal CalculateSalary()
        {
            return Salary;
        }

        public int GetAge()
        {
            return DateTime.Now.Year - YearOfBirth;
        }

        public void AddAddress(string address)
        {
            if (this.Addresses == null)
            {
                this.Addresses = new List<string>();
            }
            this.Addresses.Add(address);
        }

        public List<string> GetAddresses()
        {
            return Addresses;
        }
    }

}

