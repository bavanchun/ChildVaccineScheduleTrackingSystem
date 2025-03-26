using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblCustomer
{
    public string UserId { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string? FullName { get; set; }

    public string RoleId { get; set; } = null!;

    public string? Email { get; set; }

    public string? Address { get; set; }

    public string? Phone { get; set; }

    public bool Status { get; set; }

    public virtual ICollection<TblChild> TblChildren { get; set; } = new List<TblChild>();

    public virtual ICollection<TblFeedback> TblFeedbacks { get; set; } = new List<TblFeedback>();

    public virtual ICollection<TblNotification> TblNotifications { get; set; } = new List<TblNotification>();
}
