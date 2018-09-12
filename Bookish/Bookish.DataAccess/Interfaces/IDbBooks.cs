using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bookish.DataAccess
{
    public interface IDbBooks
    {
        List<Book> GetAllBooks(bool orderAlphabetically);
        bool InsertBook(string title, string authors, string isbn);
    }
}
