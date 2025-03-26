using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblServiceAppointment
{
    public int ServiceAppointmentId { get; set; }

    public int AppointmentId { get; set; }

    public int ServiceId { get; set; }

    public virtual TblAppointment Appointment { get; set; } = null!;

    public virtual TblService Service { get; set; } = null!;
}
