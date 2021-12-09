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
    public class PeopleInterestController : ControllerBase
    {
        [HttpGet]
        public IEnumerable<PersonInterest> Get()
        {
            var connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=InterestDb;Integrated Security=True";
            var conn = new SqlConnection(connStr);

            var id = new Guid("139913d1-3bd7-4016-974a-054e0f9a9151");
            var sql = @"select p.Name Person, i.Name Interest
                        from PersonInterest 
                        join Interest i on InterestId = i.Id
                        join Person p on PersonId = p.Id
                        where PersonId = @Id";
            var people = conn.Query<PersonInterest>(sql, new {Id = id});
            return people;
        }


        [HttpPut]
        public bool Terje(PersonInterest personInterest)
        {
            return true;

        }
    }
}
