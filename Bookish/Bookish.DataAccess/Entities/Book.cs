using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bookish.DataAccess
{
    public class Book
    {
        public int id { get; set; }
        public string title { get; set; }
        public string authors { get; set; }
        public string isbn { get; set; }

        public override string ToString()
        {
            return title + " by " + authors + ", ISBN: " + isbn;
        }
    }
}
