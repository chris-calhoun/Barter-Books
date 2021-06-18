using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using barter_books_api.DataAccess;
using barter_books_api.Models;
using Microsoft.AspNetCore.Authorization;

namespace barter_books_api.Controllers
{
    [Route("api/Collections")]
    [ApiController]
    [Authorize]
    public class CollectionController : FirebaseEnabledController
    {
        CollectionRepository _repo;

        public CollectionController()
        {
            _repo = new CollectionRepository();
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult GetAllCollections()
        {
            return Ok(_repo.GetAll());
        }

        [HttpGet("User/{userId}")]
        [AllowAnonymous]
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
            return Created($"api/Collections/{collection.Id}", collection);
        }


        [HttpPatch]
        public IActionResult UpdateCollection(Collection collection)
        {
            _repo.UpdateCollection(collection);

            return NoContent();
        }
    }
}
