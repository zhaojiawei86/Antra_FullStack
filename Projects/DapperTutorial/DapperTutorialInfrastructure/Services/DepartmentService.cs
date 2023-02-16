using System;
using DapperTutorialCore.Contracts.Services;
using DapperTutorialCore.Entities;
using DapperTutorialInfrastructure.Repositories;

namespace DapperTutorialInfrastructure.Services
{
	public class DepartmentService : IDepartmentService
	{
        DepartmentRespository departmentRepository;
        public DepartmentService()
        {
            departmentRepository = new DepartmentRespository();
        }

        public void AddDepartment()
        {
            var d = new Department();
            Console.WriteLine("Enter the name of Department: ");
            d.Name = Console.ReadLine();
            Console.WriteLine("Enter the location of the Department: ");
            d.Location = Console.ReadLine();
            if (departmentRepository.Insert(d) > 0)
            {
                Console.WriteLine("Successfully inserted.");
            }
            else
            {
                Console.WriteLine("Error");
            }
        }

        public void DeleteDepartment()
        {
            Console.Write("Enter ID of Department: ");
            int id = Convert.ToInt32(Console.ReadLine());
            departmentRepository.DeleteById(id);
        }

        public void GetAllDepartments()
        {
            var departments = departmentRepository.GetAll();
            foreach (var d in departments)
            {
                Console.WriteLine(d.Id + " " + d.Name + " " + d.Location);
            }
        }

        public void GetDepartment()
        {
            Console.Write("Enter ID of Department to get: ");
            int id = Convert.ToInt32(Console.ReadLine());
            Department d = departmentRepository.GetById(id);
            Console.WriteLine(d.Id + " " + d.Name + " " + d.Location);
        }

        public void UpdateDepartment()
        {
            var d = new Department();
            Console.WriteLine("Enter the name of Department: ");
            d.Name = Console.ReadLine();
            Console.WriteLine("Enter the location of the Department: ");
            d.Location = Console.ReadLine();
            if (departmentRepository.Update(d) > 0)
            {
                Console.WriteLine("Successfully updated.");
            }
            else
            {
                Console.WriteLine("Error");
            }
        }

        public void Run()
        {
            AddDepartment();
        }
    }
}

