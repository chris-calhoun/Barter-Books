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
    [Route("api/Trades")]
    [ApiController]
    public class TradeController : FirebaseEnabledController
    {
        TradeRepository _repo;

        public TradeController()
        {
            _repo = new TradeRepository();
        }

        [HttpGet]
        public IActionResult GetAllTrades()
        {
            return Ok(_repo.GetAll());
        }

        [HttpGet("User/{userId}")]
        public IActionResult GetUserTrades(string userId)
        {
            var trades = _repo.GetUserTrades(userId);
            if (trades == null)
            {
                return NotFound("The user does not have any trades");
            }

            return Ok(trades);
        }

        [HttpPost]
        public IActionResult AddTrade(Trade trade)
        {
            _repo.AddTrade(trade);
            return Created($"api/Trades/{trade.Id}", trade);
        }


        [HttpDelete("{id}")]
        public IActionResult CancelTrade(int tradeId)
        {
            _repo.CancelTrade(tradeId);
            return Ok();
        }
    }
}
