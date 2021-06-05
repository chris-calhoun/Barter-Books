using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using barter_books_api.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace barter_books_api.DataAccess
{
    public class FollowerRepository
    {
        const string ConnectionString = "Server=localhost;Database=BarterBooks;Trusted_Connection=True";

        public List<Follower> GetUserFollowers(string userId)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"SELECT * FROM Follower WHERE UserId = @userId";

            var followers = connection.Query<Follower>(sql, new { userId = userId }).ToList();
            return followers;
        }

        public void AddFollower(Follower follower)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"INSERT INTO [Follower] ([UserId], [FollowerId])
                        OUTPUT inserted.Id
                        VALUES(@UserId, @FollowerId)";

            var id = connection.ExecuteScalar<int>(sql, follower);
            follower.Id = id;
        }

        public void RemoveFollower(string user_Id, string follower_Id)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"DELETE FROM Follower
                        WHERE UserId = @userId AND FollowerId = @followerId";
            // dapper assigns parameters to scalar variables created in sql statement
            connection.Execute(sql, new { userId = user_Id, followerId = follower_Id });
        }
    }
}
