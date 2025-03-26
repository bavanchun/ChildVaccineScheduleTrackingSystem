using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblPackageDetail
{
    public int PackageDetailId { get; set; }

    public int PackageId { get; set; }

    public int VaccineId { get; set; }

    public virtual TblPackage Package { get; set; } = null!;

    public virtual TblVaccine Vaccine { get; set; } = null!;
}
