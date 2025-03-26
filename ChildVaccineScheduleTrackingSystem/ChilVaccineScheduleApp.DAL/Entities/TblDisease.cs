using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblDisease
{
    public int DiseaseId { get; set; }

    public int ChildId { get; set; }

    public int VaccineId { get; set; }

    public int AppointmentId { get; set; }

    public string DiseaseName { get; set; } = null!;

    public string? Description { get; set; }

    public DateOnly DiagnosisDate { get; set; }

    public virtual TblAppointment Appointment { get; set; } = null!;

    public virtual TblChild Child { get; set; } = null!;

    public virtual TblVaccine Vaccine { get; set; } = null!;
}
