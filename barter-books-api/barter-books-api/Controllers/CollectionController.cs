using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using barter_books_api.DataAccess;
using barter_books_api.Models;

namespace barter_books_api.Controllers
{
    [Route("api/Collections")]
    [ApiController]
    public class CollectionController : FirebaseEnabledController
    {
        CollectionRepository _repo;

        public CollectionController()
        {
            _repo = new CollectionRepository();
        }

        [HttpGet("User/{userId}")]
        public IActionResult GetUserCollection(string userId)
        {
            var collection = _repo.GetUserCollection(userId);
            if (collection == null)
            {
                return NoContent();
            }
            return Ok(collection);
        }

        [HttpPost]
        public IActionResult AddCollection(Collection collection)
        {
            _repo.AddCollection(collection);
            return Created($"api/Collection/{collection.Id}", collection);
        }


        [HttpPatch]
        public IActionResult UpdateCollection(Collection collection)
        {
            _repo.UpdateCollection(collection);

            return NoContent();
        }
    }
}
