using DataAcess.DbAccess;
using DataAcess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAcess.Data;

public class UserData : IUserData
{
    private readonly ISqlDataAccess _db;

    public UserData(ISqlDataAccess db)
    {
        _db = db;
    }
    public Task<IEnumerable<UserModel>> GetUsers() =>
        _db.LoadData<UserModel, dynamic>(storedProcedures: "dbo.spUser_GetAll", new { });

    public async Task<UserModel?> GetUser(int id)
    {
        var result = await _db.LoadData<UserModel, dynamic>
            (storedProcedures: "dbo.spUser_Get", new { Id = id });
        return result.FirstOrDefault();
    }

    public Task InsertUser(CreateUser user) => _db.SaveData(storedProcedures: "dbo.spUser_Insert", new { user.FirstName, user.LastName });
    public Task UpdateUser(UserModel user) => _db.SaveData(storedProcedures: "dbo.spUser_Update", new { user.Id, user.FirstName, user.LastName });

    public Task DeleteUser(int id) => _db.SaveData(storedProcedures: "dbo.spUser_Delete", new { Id = id });

}

