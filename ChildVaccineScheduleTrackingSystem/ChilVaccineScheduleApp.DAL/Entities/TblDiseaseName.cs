using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblDiseaseName
{
    public int DiseaseId { get; set; }

    public int VaccineId { get; set; }

    public string DiseaseName { get; set; } = null!;

    public string? Description { get; set; }

    public virtual TblVaccine Vaccine { get; set; } = null!;
}
