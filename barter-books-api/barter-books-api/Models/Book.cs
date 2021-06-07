using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace barter_books_api.Models
{
    public class Book
    {
        public int Id { get; set; }
        public int CollectionId { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public string Author { get; set; }
        public DateTime PublishDate { get; set; }
        public string Publisher { get; set; }
        public int PageCount { get; set; }
        public string Category { get; set; }
        public decimal AverageRating { get; set; }
        public DateTime DateAddedToCollection { get; set; }
    }
}
