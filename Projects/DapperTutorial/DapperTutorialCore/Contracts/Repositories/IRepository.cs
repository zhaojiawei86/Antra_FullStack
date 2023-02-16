using System;
namespace DapperTutorialCore.Contracts.Repositories
{
	public interface IRepository<T> where T: class
	{
		public int Insert(T obj);
		public int Update(T obj);
		public int DeleteById(int id);
		public IEnumerable<T> GetAll();
		public T GetById(int id);
	}
}

