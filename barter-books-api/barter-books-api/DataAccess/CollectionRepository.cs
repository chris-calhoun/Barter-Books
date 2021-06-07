using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using barter_books_api.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace barter_books_api.DataAccess
{
    public class CollectionRepository
    {
        const string ConnectionString = "Server=localhost;Database=BarterBooks;Trusted_Connection=True";

        public Collection GetUserCollection(string userId)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = "SELECT * FROM Collection WHERE UserId = @userId";
            var collection = connection.QueryFirstOrDefault<Collection>(sql, new { UserId = userId });
            return collection;
        }

        public void AddCollection(Collection collection)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"INSERT INTO [dbo].[Collection]([UserId],[Description])
                        OUTPUT inserted.Id
                        VALUES(@UserId, @Description)";
            var id = connection.ExecuteScalar<int>(sql, collection);
            collection.Id = id;
        }

        public void UpdateCollection(Collection collection)
        {
            using var connection = new SqlConnection(ConnectionString);

            var sql = @"UPDATE [dbo].[Collection]
                        SET [UserId] = @UserId
                            ,[Description] = @Description
                             WHERE Id = @id";

            connection.Execute(sql, collection);
        }
    }
}
