using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ChilVaccineScheduleApp.DAL.Entities;

namespace ChilVaccineScheduleApp.DAL.Repositories
{
    public class TblStaffRepository
    {
        private ChildVaccineContext _context;

        public TblStaff? GetOne(string email, string password)
        {
            _context = new ChildVaccineContext();
            return _context.TblStaffs.FirstOrDefault(x => x.Email == email && x.Password == password);

        }

    }
}
