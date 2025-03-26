using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblReport
{
    public int ReportId { get; set; }

    public int CenterId { get; set; }

    public DateOnly ReportDate { get; set; }

    public int? TotalAppointments { get; set; }

    public decimal? TotalRevenue { get; set; }

    public virtual TblCenter Center { get; set; } = null!;
}
