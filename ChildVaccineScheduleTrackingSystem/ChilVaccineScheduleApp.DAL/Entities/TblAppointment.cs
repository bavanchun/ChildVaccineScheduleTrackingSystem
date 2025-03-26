using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblAppointment
{
    public int AppointmentId { get; set; }

    public int ChildId { get; set; }

    public int CenterId { get; set; }

    public DateOnly AppointmentDate { get; set; }

    public TimeOnly AppointmentTime { get; set; }

    public string ServiceType { get; set; } = null!;

    public string? NotificationStatus { get; set; }

    public string Status { get; set; } = null!;

    public int? VaccineId { get; set; }

    public virtual TblCenter Center { get; set; } = null!;

    public virtual TblChild Child { get; set; } = null!;

    public virtual ICollection<TblDisease> TblDiseases { get; set; } = new List<TblDisease>();

    public virtual ICollection<TblPayment> TblPayments { get; set; } = new List<TblPayment>();

    public virtual ICollection<TblServiceAppointment> TblServiceAppointments { get; set; } = new List<TblServiceAppointment>();

    public virtual ICollection<TblVaccineReaction> TblVaccineReactions { get; set; } = new List<TblVaccineReaction>();

    public virtual TblVaccine? Vaccine { get; set; }
}
