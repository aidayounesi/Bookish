using Bookish.DataAccess;
using System;
using System.Collections.Generic;

namespace Bookish.ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            List<Book> books = new BooksData().GetAllBooks();

            foreach (var book in books)
            {
                Console.WriteLine(new string('*', 20));
                Console.WriteLine(book);
                Console.WriteLine(new string('*', 20));
            }

            Console.ReadLine();
        }
    }
}
