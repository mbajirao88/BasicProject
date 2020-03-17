using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StudentManagementSystem.Models;

namespace StudentManagementSystem.Controllers
{
    public class UserAccountsController : Controller
    {        
        public ActionResult Signin()
        {
            ViewBag.message = "";
            return View();
        }

        [HttpPost]
        public ActionResult Signin(UserLogin lg)
        {
            if(ModelState.IsValid)
            {
                using (DBEntities db=new DBEntities())
                {
                   UserMaster um= db.UserMasters.Where
                        (
                        x => x.Username == lg.Username && x.Password == lg.Password
                        ).FirstOrDefault();
                    if(um!=null)
                    {
                        //success
                        return RedirectToAction("Index", "Home");

                    }
                    else
                    {
                        //failure
                        ViewBag.message = "Incorrect UserId/Password";
                    }
                }
            }
            return View();
        }
    }
}