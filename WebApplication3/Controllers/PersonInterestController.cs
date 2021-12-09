using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using WebApplication3.DbModels;

namespace WebApplication3.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonInterestController : ControllerBase
    {
        [HttpPut]
        public async Task<bool> AddInterest(PersonInterest personInterest)
        {
            var connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=InterestDb;Integrated Security=True";
            var conn = new SqlConnection(connStr);
            var sql = @"INSERT PersonInterest (PersonId, InterestId) VALUES (@PersonId, @InterestId)";
            var rowsAffected = await conn.ExecuteAsync(sql, personInterest);
            return rowsAffected == 1;
        }
    }
}
