using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using barter_books_api.Models;
using barter_books_api.DataAccess;
using Microsoft.AspNetCore.Authorization;

namespace barter_books_api.Controllers
{
    [Route("api/Books")]
    [ApiController]
    [Authorize]
    public class BookController : FirebaseEnabledController
    {
        BookRepository _repo;
        public BookController()
        {
            _repo = new BookRepository();
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult GetAllBooks()
        {
            return Ok(_repo.GetAll());
        }

        [HttpGet("Collection/{userId}")]
        [AllowAnonymous]
        public IActionResult GetBooksFromCollection(string userId)
        {
            var booksList = _repo.GetCollectionBooks(userId);

            if (booksList == null)
            {
                return NotFound("This collection does not exist");
            }

            return Ok(booksList);
        }

        //[HttpGet("Collection/{collectionId}")]
        //[AllowAnonymous]
        //public IActionResult GetBooksFromCollection(int collectionId)
        //{
        //    var booksList = _repo.GetCollectionBooks(collectionId);

        //    if (booksList == null)
        //    {
        //        return NotFound("This collection does not exist");
        //    }

        //    return Ok(booksList);
        //}

        [HttpGet("{id}")]
        public IActionResult GetBookById(int id)
        {
            var book = _repo.GetBookById(id);

            if (book == null)
            {
                return NotFound("This book does not exist");
            }
            return Ok(book);
        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult AddBook(Book book)
        {
            _repo.AddBook(book);
            return Created($"api/Books/{book.Id}", book);
        }

        [HttpDelete("{id}")]
        [AllowAnonymous]
        public IActionResult DeleteBook(int id)
        {
            _repo.DeleteShop(id);
            return Ok();
        }
    }
}
