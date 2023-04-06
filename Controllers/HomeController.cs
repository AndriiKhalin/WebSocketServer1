using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.IO;
using WebSocketServer.Models;

namespace WebSocketServer.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            DirectoryInfoViewModel model = new DirectoryInfoViewModel();
            return View(model);
        }

        [HttpPost]
        public ActionResult Index(DirectoryInfoViewModel model)
        {
            if (String.IsNullOrEmpty(model.Path))
            {
                model.Directories = Directory.GetDirectories(Directory.GetCurrentDirectory()).ToList();
                model.Files = Directory.GetFiles(Directory.GetCurrentDirectory()).ToList();
                return View(model);
            }
            model.Directories = Directory.GetDirectories(model.Path).ToList();
            model.Files = Directory.GetFiles(model.Path).ToList();
            return View(model);
        }


    }
}