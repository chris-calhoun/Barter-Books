using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace barter_books_api.Models
{
    public class Collection
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string Description { get; set; }
    }
}
