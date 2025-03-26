using System;
using System.Collections.Generic;

namespace ChilVaccineScheduleApp.DAL.Entities;

public partial class TblPayment
{
    public int PaymentId { get; set; }

    public int? AppointmentId { get; set; }

    public decimal Amount { get; set; }

    public DateTime? PaymentDate { get; set; }

    public string? Status { get; set; }

    public string PaymentMethod { get; set; } = null!;

    public string TransactionCode { get; set; } = null!;

    public DateTime? UpdateDate { get; set; }

    public string? UpdatedBy { get; set; }

    public virtual TblAppointment? Appointment { get; set; }
}
