using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblNotification
{
    public int NotificationId { get; set; }

    public string UserId { get; set; } = null!;

    public DateTime NotificationDate { get; set; }

    public string NotificationText { get; set; } = null!;

    public bool IsRead { get; set; }

    public virtual TblCustomer User { get; set; } = null!;
}
