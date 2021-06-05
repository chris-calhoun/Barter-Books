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

        public Wishlist GetUserWishlist(string userId)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = "SELECT * FROM Wishlist WHERE UserId = @userId";
            var wishlist = connection.QueryFirstOrDefault<Wishlist>(sql, new { UserId = userId });
            return wishlist;
        }
    }
}
