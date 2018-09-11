using System;
using System.Collections.Generic;
using System.Configuration;
using Dapper;
using System.Data;
using System.Data.SqlClient;

namespace Bookish.DataAccess
{
    public class BooksData : IDbBooks
    {
        public List<Book> GetAllBooks()
        {
            using (IDbConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                string sqlString = "SELECT * FROM Book;";
                return (List<Book>)connection.Query<Book>(sqlString);
            }
        }

        public bool InsertBook(string title, string authors, string isbn)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                string sqlString = "INSERT INTO Book VALUES (title,authors,isbn) VALUES (@title,@authors,@isbn);";
                using (SqlCommand command = new SqlCommand(sqlString, connection))
                {
                    command.Parameters.AddWithValue("@title", title);
                    command.Parameters.AddWithValue("@authors", authors);
                    command.Parameters.AddWithValue("@isbn", isbn);

                    connection.Open();
                    return command.ExecuteNonQuery() > 0;
                }
            }
        }
    }
}
