using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace barter_books_api.Models
{
    public class Follower
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string FollowerId { get; set; }
        public DateTime FollowedDate { get; set; }

    }
}
