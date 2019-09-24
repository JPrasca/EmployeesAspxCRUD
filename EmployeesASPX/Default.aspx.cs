using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmployeesASPX.App_Data;

namespace EmployeesASPX
{
    public partial class _Default : Page
    {
        static EmployeeDBEntities db = new EmployeeDBEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static object GetAllEmployees()
        {
            var r = db.Employees.OrderBy(x => x.EmployeeID).ToList();

            var json = new { data = r };
          
            return json;
        }

        [WebMethod]
        public static object GetOneEmployee()
        {
            var r = db.Employees.FirstOrDefault(x => x.EmployeeID == 1);
            var json = new { data = r };
            return json;
        }
    }
}