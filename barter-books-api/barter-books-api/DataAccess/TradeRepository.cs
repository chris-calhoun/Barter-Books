using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using barter_books_api.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace barter_books_api.DataAccess
{
    public class TradeRepository
    {
        const string ConnectionString = "Server=localhost;Database=BarterBooks;Trusted_Connection=True";

        public List<Trade> GetUserTrades(string user_Id)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"SELECT t.Id, t.[Status], t.BookOneId, t.BookTwoId
                        FROM [User] as u
                        INNER JOIN [Collection] as c
                        ON u.Id = c.UserId
                        INNER JOIN Book as b
                        ON c.Id = b.CollectionId
                        INNER JOIN Trade as t
                        ON b.Id = t.BookOneId 
                        UNION
                        SELECT t.Id, t.[Status], t.BookOneId, t.BookTwoId
                        FROM [User] as u
                        INNER JOIN [Collection] as c
                        ON u.Id = c.UserId
                        INNER JOIN Book as b
                        ON c.Id = b.CollectionId
                        INNER JOIN Trade as t
                        ON b.Id = t.BookTwoId
                        WHERE u.Id = @userId";

            var trades = connection.Query<Trade>(sql, new { userId = user_Id }).ToList();
            return trades;
        }

        public void AddTrade(Trade trade)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"INSERT INTO [Trade] ([BookOneId], [BookTwoId], [Status])
                        OUTPUT inserted.Id
                        VALUES (@BookOneId, @BookTwoId, @Status)";

            var id = connection.ExecuteScalar<int>(sql, trade);
            trade.Id = id;
        }

        public void CancelTrade(string trade_Id)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"DELETE FROM Trade
                        WHERE Id = @tradeId";
            // dapper assigns parameters to scalar variables created in sql statement
            connection.Execute(sql, new { tradeId = trade_Id });
        }
    }
}
