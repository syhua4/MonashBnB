using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MonashBnB.Models;

namespace MonashBnB.Controllers
{
    public class MonashBnbController : Controller
    {
        private MonashBnBModelContainer db = new MonashBnBModelContainer();

        // GET: MonashBnb
        public async Task<ActionResult> Index()
        {
            return View(await db.Hotels.ToListAsync());
        }

        // GET: MonashBnb/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hotel hotel = await db.Hotels.FindAsync(id);
            if (hotel == null)
            {
                return HttpNotFound();
            }
            return View(hotel);
        }

        // GET: MonashBnb/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MonashBnb/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "hotelId,hotelName,hotelAddress,hotelDesc,hotelAmenties,hotelImage,hotelLongitude,hotelLatitude")] Hotel hotel)
        {
            if (ModelState.IsValid)
            {
                db.Hotels.Add(hotel);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(hotel);
        }

        // GET: MonashBnb/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hotel hotel = await db.Hotels.FindAsync(id);
            if (hotel == null)
            {
                return HttpNotFound();
            }
            return View(hotel);
        }

        // POST: MonashBnb/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "hotelId,hotelName,hotelAddress,hotelDesc,hotelAmenties,hotelImage,hotelLongitude,hotelLatitude")] Hotel hotel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hotel).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(hotel);
        }

        // GET: MonashBnb/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hotel hotel = await db.Hotels.FindAsync(id);
            if (hotel == null)
            {
                return HttpNotFound();
            }
            return View(hotel);
        }

        // POST: MonashBnb/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Hotel hotel = await db.Hotels.FindAsync(id);
            db.Hotels.Remove(hotel);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult RegisterAccount(int id=0)
        {
            User user = new User();
            return View();
        }
        [HttpPost]
        public ActionResult RegisterAccount(User user)
        {
            if (db.Users.Any(x => x.userEmail == user.userEmail))
            {
                ViewBag.DuplicateMsg = "This email already exists. \nPlease log in.";
                return View("RegisterAccount", user);
            }
            else
            {
                db.Users.Add(user);
                db.SaveChanges();
            }
            

            ModelState.Clear();
            ViewBag.SuccessMsg = "Registration Success!";
            return View("RegisterAccount", new User());
        }
    }
}
