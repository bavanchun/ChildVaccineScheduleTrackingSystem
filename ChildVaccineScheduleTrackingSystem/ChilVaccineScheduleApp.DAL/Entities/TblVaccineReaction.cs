using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblVaccineReaction
{
    public int ReactionId { get; set; }

    public int AppointmentId { get; set; }

    public string? ReactionText { get; set; }

    public DateOnly ReactionDate { get; set; }

    public virtual TblAppointment Appointment { get; set; } = null!;
}
