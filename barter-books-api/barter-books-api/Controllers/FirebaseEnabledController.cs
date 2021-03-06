using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace barter_books_api.Controllers
{
    public abstract class FirebaseEnabledController : ControllerBase
    {
        protected string UserId => User.FindFirstValue("user_id");
    }
}