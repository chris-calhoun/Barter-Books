using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using barter_books_api.Models;
using Microsoft.Data.SqlClient;
using Dapper;

namespace barter_books_api.DataAccess
{
    public class WishlistRepository
    {
        const string ConnectionString = "Server=localhost;Database=BarterBooks;Trusted_Connection=True";

        public List<Wishlist> GetAll()
        {
            using var connection = new SqlConnection(ConnectionString);
            var allWishlistsSql = "SELECT * FROM [Wishlist]";
            var wishlists = connection.Query<Wishlist>(allWishlistsSql).ToList();

            return (List<Wishlist>)wishlists;
        }

        public Wishlist GetUserWishlist(string userId)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = "SELECT * FROM Wishlist WHERE UserId = @userId";
            var wishlist = connection.QueryFirstOrDefault<Wishlist>(sql, new { UserId = userId });
            return wishlist;
        }

        public void AddWishlist(Wishlist wishlist)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"INSERT INTO [dbo].[Wishlist]([UserId],[BookId])
                        OUTPUT inserted.Id
                        VALUES(@UserId, @BookId)";
            var id = connection.ExecuteScalar<int>(sql, wishlist);
            wishlist.Id = id;
        }
    }
}
