﻿using System;
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
            var sql = @$"INSERT INTO Book(CollectionId, Name, Image, Author, PublishDate, Publisher, PageCount, Category, AverageRating)
                        OUTPUT inserted.Id
                        VALUES(@CollectionId, @Name, @Image,@Author, @PublishDate, @Publisher, @PageCount, @Category, @AverageRating)";

            var id = connection.ExecuteScalar<int>(sql, book);

            book.Id = id;
        }

        public List<Book> GetCollectionBooks(int collection_Id)
        {
            using var connection = new SqlConnection(ConnectionString);
            var sql = @"SELECT * 
                        FROM Book
                        WHERE CollectionId = @collectionId";
            var books = connection.Query<Book>(sql, new { collectionId = collection_Id }).OrderByDescending(book => book.DateAddedToCollection).ToList();
            return books;
        }
    }
}