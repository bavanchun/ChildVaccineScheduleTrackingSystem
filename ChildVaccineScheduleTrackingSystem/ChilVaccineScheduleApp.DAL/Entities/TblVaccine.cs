using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblVaccine
{
    public int VaccineId { get; set; }

    public string VaccineName { get; set; } = null!;

    public string? Description { get; set; }

    public decimal Price { get; set; }

    public string? RecommendedAge { get; set; }

    public string Status { get; set; } = null!;

    public virtual ICollection<TblAppointment> TblAppointments { get; set; } = new List<TblAppointment>();

    public virtual ICollection<TblDiseaseName> TblDiseaseNames { get; set; } = new List<TblDiseaseName>();

    public virtual ICollection<TblDisease> TblDiseases { get; set; } = new List<TblDisease>();

    public virtual ICollection<TblPackageDetail> TblPackageDetails { get; set; } = new List<TblPackageDetail>();
}
