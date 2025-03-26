﻿using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblStaff
{
    public string StaffId { get; set; } = null!;

    public string StaffName { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string? RoleId { get; set; }

    public string? Email { get; set; }

    public string? Address { get; set; }

    public string? Phone { get; set; }

    public bool? Status { get; set; }
}
