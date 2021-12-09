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
    public class InterestsController : ControllerBase
    {
        [HttpGet]
        public async Task<IEnumerable<Interest>> GetAll()
        {
            var connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=InterestDb;Integrated Security=True";
            var conn = new SqlConnection(connStr);
            var sql = @"select id, name from interest";
            return await conn.QueryAsync<Interest>(sql);
        }

        [HttpGet("{id}")]
        public async Task<IEnumerable<Interest>> GetOne(Guid id)
        {
            var connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=InterestDb;Integrated Security=True";
            var conn = new SqlConnection(connStr);
            var sql = @"select i.Id, i.Name
                        from PersonInterest pi
                        join Interest i on InterestId = i.Id
                        where pi.PersonId = @Id";
            return await conn.QueryAsync<Interest>(sql, new { Id = id });
        }
    }
}
