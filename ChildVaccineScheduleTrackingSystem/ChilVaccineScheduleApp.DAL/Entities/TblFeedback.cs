using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblFeedback
{
    public int FeedbackId { get; set; }

    public string UserId { get; set; } = null!;

    public int CenterId { get; set; }

    public string? FeedbackText { get; set; }

    public int? Rating { get; set; }

    public DateOnly FeedbackDate { get; set; }

    public virtual TblCenter Center { get; set; } = null!;

    public virtual TblCustomer User { get; set; } = null!;
}
