using Bookish.DataAccess;
using Dapper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Bookish.ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            string SqlString = "SELECT TOP 100 [id],[title],[authors],[isbn] FROM [Book]";
            var books = (List<Book>)db.Query<Book>(SqlString);

            foreach (var book in books)
            {
                Console.WriteLine(new string('*', 20));
                Console.WriteLine("\nID: " + book.id.ToString());
                Console.WriteLine("Title: " + book.title + "\n");
                Console.WriteLine(new string('*', 20));
            }

            Console.ReadLine();
        }
    }
}
