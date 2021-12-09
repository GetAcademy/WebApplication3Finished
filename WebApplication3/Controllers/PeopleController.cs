using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using WebApplication3.DbModels;

namespace WebApplication3.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PeopleController : ControllerBase
    {
        [HttpGet]
        public async Task<IEnumerable<Person>> GetAll()
        {
            var connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=InterestDb;Integrated Security=True";
            var conn = new SqlConnection(connStr);
            var sql = @"select id, name from person";
            return await conn.QueryAsync<Person>(sql);
        }

        [HttpGet("{id}")]
        public async Task<IEnumerable<Person>> GetOne(Guid id)
        {
            var connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=InterestDb;Integrated Security=True";
            var conn = new SqlConnection(connStr);
            var sql = @"select p.Id, p.Name
                        from PersonInterest pi
                        join Person p on PersonId = p.Id
                        where pi.InterestId = @Id";
            return await conn.QueryAsync<Person>(sql, new { Id = id });
        }
    }
}
