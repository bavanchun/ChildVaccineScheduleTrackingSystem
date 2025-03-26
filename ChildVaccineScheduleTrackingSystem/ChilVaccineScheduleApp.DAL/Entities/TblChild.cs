using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblChild
{
    public int ChildId { get; set; }

    public string UserId { get; set; } = null!;

    public string ChildName { get; set; } = null!;

    public DateOnly DateOfBirth { get; set; }

    public string? Gender { get; set; }

    public virtual ICollection<TblAppointment> TblAppointments { get; set; } = new List<TblAppointment>();

    public virtual ICollection<TblDisease> TblDiseases { get; set; } = new List<TblDisease>();

    public virtual TblCustomer User { get; set; } = null!;
}
