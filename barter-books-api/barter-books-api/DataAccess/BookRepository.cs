using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Dapper;
using barter_books_api.Models;

namespace barter_books_api.DataAccess
{
    public class BookRepository
    {
        const string ConnectionString = "Server=localhost; Database=BarterBooks; Trusted_Connection=True";

        public List<Book> GetAll()
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"SELECT * FROM Book";
            var books = connection.Query<Book>(sql).OrderByDescending(book => book.DateAddedToCollection).ToList();
            return books;
        }

        public Book GetBookById(int id)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"SELECT * from Book WHERE Id=@id";
            
            var book = connection.QueryFirstOrDefault<Book>(sql, new { Id = id });
            return book;
        }
        public void AddBook(Book book)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @$"INSERT INTO Book(CollectionId, Name, Image, Author, PublishDate, PageCount)
                        OUTPUT inserted.Id
                        VALUES(@CollectionId, @Name, @Image, @Author, @PublishDate, @PageCount)";

            var id = connection.ExecuteScalar<int>(sql, book);

            book.Id = id;
        }

        public List<Book> GetCollectionBooks(string user_Id)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"SELECT b.*
                        FROM [User] as u
                        INNER JOIN [Collection] as c
                        ON u.Id = c.UserId
                        INNER JOIN Book as b
                        ON c.Id = b.CollectionId
                        WHERE u.Id = @userId";
            var books = connection.Query<Book>(sql, new { userId = user_Id }).OrderByDescending(book => book.DateAddedToCollection).ToList();
            return books;
        }
        public void DeleteShop(int id)
        {
            using var db = new SqlConnection(ConnectionString);
            var sql = "DELETE FROM Book WHERE Id = @id";
            db.Execute(sql, new { id = id });
        }
    }
}
