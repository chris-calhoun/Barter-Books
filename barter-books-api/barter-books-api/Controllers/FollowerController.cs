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
    [Route("api/Followers")]
    [ApiController]
    public class FollowerController : FirebaseEnabledController
    {
        FollowerRepository _repo;

        public FollowerController()
        {
            _repo = new FollowerRepository();
        }

        [HttpGet]
        public IActionResult GetAllFollowers()
        {
            return Ok(_repo.GetAll());
        }

        //[HttpGet("Potential/{userId}")]
        //public IActionResult GetPotentialFollowers(string userId)
        //{
        //    var followers = _repo.GetPotentialFollowers(userId);
        //    if (followers == null)
        //    {
        //        return NotFound("The user does not have any potential followers");
        //    }

        //    return Ok(followers);
        //}

        [HttpGet("User/{userId}")]
        public IActionResult GetUserFollowers(string userId)
        {
            var followers = _repo.GetUserFollowers(userId);
            if (followers == null)
            {
                return NotFound("The user does not have any followers");
            }

            return Ok(followers);
        }

        [HttpPost]
        public IActionResult AddFollower(Follower follower)
        {
            _repo.AddFollower(follower);
            return Created($"api/Followers/{follower.Id}", follower);
        }


        [HttpDelete("{id}")]
        public IActionResult RemoveFollower(string user_Id, string follower_Id)
        {
            _repo.RemoveFollower(user_Id, follower_Id);
            return Ok();
        }

    }
}
