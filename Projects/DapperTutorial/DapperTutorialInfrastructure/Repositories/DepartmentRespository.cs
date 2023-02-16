using System;
using Dapper;
using DapperTutorialCore.Contracts.Repositories;
using DapperTutorialCore.Entities;
using DapperTutorialInfrastructure.Data;

namespace DapperTutorialInfrastructure.Repositories
{
	public class DepartmentRespository : IDepartmentRepository
	{
        DapperDbContext dbContext;
        public DepartmentRespository()
        {
            dbContext = new DapperDbContext();
        }

        public int DeleteById(int id)
        {
            using (var conn = dbContext.GetConnection())
            {
                // execute: interact with data
                return conn.Execute("Delete From Department Where Id = @deptId", new { deptId = id });
            }
        }

        // select every single dpt
        public IEnumerable<Department> GetAll()
        {
            using (var conn = dbContext.GetConnection())
            {
                // query: get data
                return conn.Query<Department>("Select Id, Name, Location From Department");
            }
        }

        public Department GetById(int id)
        {
            using (var conn = dbContext.GetConnection())
            {
                return conn.QuerySingleOrDefault<Department>("Select Id, Name, Location From Department Where Id = @deptId", new { deptId = id });
            }
        }

        public int Insert(Department obj)
        {
            using (var conn = dbContext.GetConnection())
            {
                return conn.Execute("Insert Into Department Values (@Name, @Location)", obj);
            }
        }

        public int Update(Department obj)
        {
            using (var conn = dbContext.GetConnection())
            {
                return conn.Execute("Update Department Set Name = @name, Location = @location Where id = @id", obj);
            }
        }

    }
}

