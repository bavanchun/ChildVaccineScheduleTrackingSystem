using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ChilVaccineScheduleApp.DAL.Entities;

namespace ChilVaccineScheduleApp.DAL.Repositories
{
    public class TblDoctorRepository
    {
        private ChildVaccineContext _context;

        public TblDoctor? GetOne(string email, string password)
        {
            _context = new ChildVaccineContext();
            return _context.TblDoctors.FirstOrDefault(x => x.Email == email && x.Password == password);
        }
    }
}
