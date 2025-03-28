using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;
using ChilVaccineScheduleApp.DAL.Entities;
using ChilVaccineScheduleApp.DAL.Repositories;
using Microsoft.Identity.Client;

namespace ChildVaccineScheduleApp.BLL.Services
{
    public class AuthService
    {
        private readonly TblStaffRepository _staffRepo;
        private readonly TblDoctorRepository _doctorRepo;

        public AuthService()
        {
            _staffRepo = new TblStaffRepository();
            _doctorRepo = new TblDoctorRepository();
        }

        public User GetOne(string email, string password)
        {
            // Kiểm tra trong bảng tblStaff trước
            TblStaff staff = _staffRepo.GetOne(email, password);
            if (staff != null)
            {
                return new User { Email = staff.StaffId, RoleId = "Staff" };
            }

            // Nếu không tìm thấy, kiểm tra trong bảng tblDoctor
            TblDoctor doctor = _doctorRepo.GetOne(email, password);
            if (doctor != null)
            {
                return new User { Email = doctor.DoctorId, RoleId = "Doctor" };
            }

            return null; // Đăng nhập thất bại
        }

        
    }

    public class User
    {
        public string Email { get; set; }
        public string RoleId { get; set; }
    }
}
