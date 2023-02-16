using System;
namespace DapperTutorialCore.Contracts.Services
{
	public interface IDepartmentService
	{
        public void AddDepartment();
        public void UpdateDepartment();
        public void DeleteDepartment();
        public void GetAllDepartments();
        public void GetDepartment();
    }
}

