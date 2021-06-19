using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Dapper;
using barter_books_api.Models;

namespace barter_books_api.DataAccess
{
    public class UserRepository
    {
        const string ConnectionString = "Server=localhost;Database=BarterBooks;Trusted_Connection=True";

        public List<User> GetAll()
        {
            using var connection = new SqlConnection(ConnectionString);
            var allUsersSql = "SELECT * FROM [User]";
            var users = connection.Query<User>(allUsersSql).ToList();

            return (List<User>)users;
        }
        public User GetSingleUser(string id)
        {
            using var connection = new SqlConnection(ConnectionString);
            var singleUserSql = @"SELECT *
                        FROM [User]
                        WHERE Id = @Id";
            var user = connection.QueryFirstOrDefault<User>(singleUserSql, new { Id = id });

            return user;
        }
        public void AddAUser(User user)
        {
            using var connection = new SqlConnection(ConnectionString);
            var singleUserSql = @"INSERT INTO [dbo].[User]([Id],[FirstName],[LastName],[Email],[ImageUrl])
                        VALUES(@Id, @FirstName,@LastName,@Email,@ImageUrl)";
            var id = connection.ExecuteScalar<string>(singleUserSql, user);

            user.Id = id;
        }

        public void UpdateUser(User user)
        {
            using var connection = new SqlConnection(ConnectionString);

            var userSql = @"UPDATE [dbo].[User]
                        SET [FirstName] = @FirstName
                            ,[LastName] = @LastName
                            ,[Email] = @Email
                            ,[ImageUrl] = @ImageUrl
                            ,[CreatedDate] = @CreatedDate
                             WHERE Id = @id";

            connection.Execute(userSql, user);
        }

        public void DeleteUser(string id)
        {
            using var connection = new SqlConnection(ConnectionString);
            var user = GetSingleUser(id);

            var userSql = @"UPDATE[dbo].[User]
                        SET[FirstName] = 'Deleted'
                            ,[LastName] = 'User'
                            ,[Email] = Null
                            ,[ImageUrl] = Null
                             WHERE Id = @id";

            connection.Execute(userSql, user);
        }
        public List<User> GetPotentialFollowers(string user_Id)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"SELECT *
                        FROM [User]
                        WHERE Id != @userId
                        AND Id not in (Select FollowerId
			                        FROM Follower
			                        Where [UserId] = @userId)";

            var users = connection.Query<User>(sql, new { userId = user_Id }).ToList();
            return users;
        }

        public List<User> GetFollowers(string user_Id)
        {
            using var connection = new SqlConnection(ConnectionString);

            var sql = @"SELECT *
                        FROM [User]
                        WHERE Id in (Select UserId
			                        FROM Follower
			                        Where [FollowerId] = @userId)";

            var users = connection.Query<User>(sql, new { userId = user_Id }).ToList();
            return users;
        }

        public List<User> GetFollowing(string user_Id)
        {
            using var connection = new SqlConnection(ConnectionString);

            var sql = @"SELECT *
                        FROM [User]
                        WHERE Id in (Select FollowerId
			                        FROM Follower
			                        Where [UserId] = @userId)";

            var users = connection.Query<User>(sql, new { userId = user_Id }).ToList();
            return users;
        }

    }
}
