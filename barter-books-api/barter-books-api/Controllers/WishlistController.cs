using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using barter_books_api.Models;
using barter_books_api.DataAccess;

namespace barter_books_api.Controllers
{
    [Route("api/Wishlist")]
    [ApiController]
    public class WishlistController : FirebaseEnabledController
    {
        WishlistRepository _repo;

        public WishlistController()
        {
            _repo = new WishlistRepository();
        }

        [HttpGet("getByUserId/{userId}")]
        public IActionResult GetUserWishlist(string userId)
        {
            var wishlist = _repo.GetUserWishlist(userId);
            if (wishlist == null)
            {
                return NoContent();
            }
            return Ok(wishlist);
        }

        [HttpPost]
        public IActionResult AddWishlist(Wishlist wishlist)
        {
            _repo.AddWishlist(wishlist);
            return Created($"api/Wishlist/{wishlist.Id}", wishlist);
        }

    }
}
