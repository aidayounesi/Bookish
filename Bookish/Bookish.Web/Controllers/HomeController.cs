using Bookish.DataAccess;
using System.Web.Mvc;

namespace Bookish.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult BooksList()
        {
            ViewBag.Books = new BooksData().GetAllBooks(true);

            return View();
        }

        public ActionResult AddBook(Book book)
        {
            ViewBag.IsAdded = new BooksData().InsertBook(book.title, book.authors, book.isbn);
            return View();
        }
    }
}