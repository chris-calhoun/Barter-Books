using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace barter_books_api.Models
{
    public class Trade
    {
        public int Id { get; set; }
        public DateTime TradeDate { get; set; }
        public int BookOneId { get; set; }
        public int BookTwoId { get; set; }
        public TradeStatus Status { get; set; }

        public enum TradeStatus
        {
            Pending,
            Accepted,
            Complete
        }
    }
}
