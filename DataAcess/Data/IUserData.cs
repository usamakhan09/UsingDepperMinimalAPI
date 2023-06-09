using DataAcess.Models;

namespace DataAcess.Data
{
    public interface IUserData
    {
        Task DeleteUser(int id);
        Task<UserModel?> GetUser(int id);
        Task<IEnumerable<UserModel>> GetUsers();
        Task InsertUser(CreateUser user);
        Task UpdateUser(UserModel user);
    }
}