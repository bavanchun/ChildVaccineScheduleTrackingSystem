using System;
using System.Collections.Generic;
using ChilVaccineScheduleApp.DAL.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace ChilVaccineScheduleApp.DAL;

public partial class ChildVaccineContext : DbContext
{
    public ChildVaccineContext()
    {
    }

    public ChildVaccineContext(DbContextOptions<ChildVaccineContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblAppointment> TblAppointments { get; set; }

    public virtual DbSet<TblCenter> TblCenters { get; set; }

    public virtual DbSet<TblChild> TblChildren { get; set; }

    public virtual DbSet<TblCustomer> TblCustomers { get; set; }

    public virtual DbSet<TblDisease> TblDiseases { get; set; }

    public virtual DbSet<TblDiseaseName> TblDiseaseNames { get; set; }

    public virtual DbSet<TblDoctor> TblDoctors { get; set; }

    public virtual DbSet<TblFeedback> TblFeedbacks { get; set; }

    public virtual DbSet<TblNotification> TblNotifications { get; set; }

    public virtual DbSet<TblPackage> TblPackages { get; set; }

    public virtual DbSet<TblPackageDetail> TblPackageDetails { get; set; }

    public virtual DbSet<TblPayment> TblPayments { get; set; }

    public virtual DbSet<TblReport> TblReports { get; set; }

    public virtual DbSet<TblService> TblServices { get; set; }

    public virtual DbSet<TblServiceAppointment> TblServiceAppointments { get; set; }

    public virtual DbSet<TblStaff> TblStaffs { get; set; }

    public virtual DbSet<TblVaccine> TblVaccines { get; set; }

    public virtual DbSet<TblVaccineReaction> TblVaccineReactions { get; set; }

    private string GetConnectionString()
    {
        IConfiguration config = new ConfigurationBuilder()
             .SetBasePath(Directory.GetCurrentDirectory())
                    .AddJsonFile("appsettings.json", true, true)
                    .Build();
        var strConn = config["ConnectionStrings:DefaultConnectionStringDB"];

        return strConn;
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer(GetConnectionString());

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblAppointment>(entity =>
        {
            entity.HasKey(e => e.AppointmentId).HasName("PK__tblAppoi__D067651E04BAEEE1");

            entity.ToTable("tblAppointments");

            entity.Property(e => e.AppointmentId).HasColumnName("appointmentID");
            entity.Property(e => e.AppointmentDate).HasColumnName("appointmentDate");
            entity.Property(e => e.AppointmentTime)
                .HasDefaultValue(new TimeOnly(8, 0, 0))
                .HasColumnName("appointmentTime");
            entity.Property(e => e.CenterId).HasColumnName("centerID");
            entity.Property(e => e.ChildId).HasColumnName("childID");
            entity.Property(e => e.NotificationStatus)
                .HasMaxLength(20)
                .HasDefaultValue("Not pending")
                .HasColumnName("notificationStatus");
            entity.Property(e => e.ServiceType)
                .HasMaxLength(50)
                .HasDefaultValue("Tiêm lẻ")
                .HasColumnName("serviceType");
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .HasDefaultValue("Pending")
                .HasColumnName("status");
            entity.Property(e => e.VaccineId).HasColumnName("vaccineID");

            entity.HasOne(d => d.Center).WithMany(p => p.TblAppointments)
                .HasForeignKey(d => d.CenterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblAppoin__cente__46E78A0C");

            entity.HasOne(d => d.Child).WithMany(p => p.TblAppointments)
                .HasForeignKey(d => d.ChildId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblAppoin__child__45F365D3");

            entity.HasOne(d => d.Vaccine).WithMany(p => p.TblAppointments)
                .HasForeignKey(d => d.VaccineId)
                .HasConstraintName("FK__tblAppoin__vacci__47DBAE45");
        });

        modelBuilder.Entity<TblCenter>(entity =>
        {
            entity.HasKey(e => e.CenterId).HasName("PK__tblCente__19B5E9C265AD4651");

            entity.ToTable("tblCenters");

            entity.Property(e => e.CenterId).HasColumnName("centerID");
            entity.Property(e => e.Address)
                .HasMaxLength(255)
                .HasColumnName("address");
            entity.Property(e => e.CenterName)
                .HasMaxLength(100)
                .HasColumnName("centerName");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .HasColumnName("email");
            entity.Property(e => e.OperatingHours)
                .HasMaxLength(50)
                .HasColumnName("operatingHours");
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(15)
                .HasColumnName("phoneNumber");
        });

        modelBuilder.Entity<TblChild>(entity =>
        {
            entity.HasKey(e => e.ChildId).HasName("PK__tblChild__223925ED8FCA583E");

            entity.ToTable("tblChildren");

            entity.Property(e => e.ChildId).HasColumnName("childID");
            entity.Property(e => e.ChildName)
                .HasMaxLength(100)
                .HasColumnName("childName");
            entity.Property(e => e.DateOfBirth).HasColumnName("dateOfBirth");
            entity.Property(e => e.Gender)
                .HasMaxLength(10)
                .HasColumnName("gender");
            entity.Property(e => e.UserId)
                .HasMaxLength(20)
                .HasColumnName("userID");

            entity.HasOne(d => d.User).WithMany(p => p.TblChildren)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblChildr__userI__3C69FB99");
        });

        modelBuilder.Entity<TblCustomer>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__tblCusto__CB9A1CDFD531AAF6");

            entity.ToTable("tblCustomers");

            entity.Property(e => e.UserId)
                .HasMaxLength(20)
                .HasColumnName("userID");
            entity.Property(e => e.Address)
                .HasMaxLength(200)
                .HasColumnName("address");
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .HasColumnName("email");
            entity.Property(e => e.FullName)
                .HasMaxLength(100)
                .HasColumnName("fullName");
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .HasColumnName("password");
            entity.Property(e => e.Phone)
                .HasMaxLength(15)
                .HasColumnName("phone");
            entity.Property(e => e.RoleId)
                .HasMaxLength(20)
                .HasColumnName("roleID");
            entity.Property(e => e.Status)
                .HasDefaultValue(true)
                .HasColumnName("status");
        });

        modelBuilder.Entity<TblDisease>(entity =>
        {
            entity.HasKey(e => e.DiseaseId).HasName("PK__tblDisea__49A195770049E9CB");

            entity.ToTable("tblDisease");

            entity.Property(e => e.DiseaseId).HasColumnName("diseaseID");
            entity.Property(e => e.AppointmentId).HasColumnName("appointmentID");
            entity.Property(e => e.ChildId).HasColumnName("childID");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.DiagnosisDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnName("diagnosisDate");
            entity.Property(e => e.DiseaseName)
                .HasMaxLength(100)
                .HasColumnName("diseaseName");
            entity.Property(e => e.VaccineId).HasColumnName("vaccineID");

            entity.HasOne(d => d.Appointment).WithMany(p => p.TblDiseases)
                .HasForeignKey(d => d.AppointmentId)
                .HasConstraintName("FK_tblDisease_tblAppointments");

            entity.HasOne(d => d.Child).WithMany(p => p.TblDiseases)
                .HasForeignKey(d => d.ChildId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tblDisease_tblChildren");

            entity.HasOne(d => d.Vaccine).WithMany(p => p.TblDiseases)
                .HasForeignKey(d => d.VaccineId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_tblDisease_tblVaccines");
        });

        modelBuilder.Entity<TblDiseaseName>(entity =>
        {
            entity.HasKey(e => e.DiseaseId).HasName("PK__tblDisea__49A195575C20CC8A");

            entity.ToTable("tblDiseaseName");

            entity.Property(e => e.DiseaseId).HasColumnName("diseaseId");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.DiseaseName)
                .HasMaxLength(100)
                .HasColumnName("diseaseName");
            entity.Property(e => e.VaccineId).HasColumnName("vaccineID");

            entity.HasOne(d => d.Vaccine).WithMany(p => p.TblDiseaseNames)
                .HasForeignKey(d => d.VaccineId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblDiseas__vacci__6477ECF3");
        });

        modelBuilder.Entity<TblDoctor>(entity =>
        {
            entity.HasKey(e => e.DoctorId).HasName("PK__tblDocto__72248596E575CCC5");

            entity.ToTable("tblDoctor");

            entity.Property(e => e.DoctorId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("doctorID");
            entity.Property(e => e.Address)
                .HasMaxLength(100)
                .HasColumnName("address");
            entity.Property(e => e.DoctorName)
                .HasMaxLength(50)
                .HasColumnName("doctorName");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("password");
            entity.Property(e => e.Phone)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("phone");
            entity.Property(e => e.RoleId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasDefaultValue("Doctor")
                .HasColumnName("roleID");
            entity.Property(e => e.Status)
                .HasDefaultValue(true)
                .HasColumnName("status");
        });

        modelBuilder.Entity<TblFeedback>(entity =>
        {
            entity.HasKey(e => e.FeedbackId).HasName("PK__tblFeedb__2613FDC4B9360C6B");

            entity.ToTable("tblFeedback");

            entity.Property(e => e.FeedbackId).HasColumnName("feedbackID");
            entity.Property(e => e.CenterId).HasColumnName("centerID");
            entity.Property(e => e.FeedbackDate).HasColumnName("feedbackDate");
            entity.Property(e => e.FeedbackText).HasColumnName("feedbackText");
            entity.Property(e => e.Rating).HasColumnName("rating");
            entity.Property(e => e.UserId)
                .HasMaxLength(20)
                .HasColumnName("userID");

            entity.HasOne(d => d.Center).WithMany(p => p.TblFeedbacks)
                .HasForeignKey(d => d.CenterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblFeedba__cente__4CA06362");

            entity.HasOne(d => d.User).WithMany(p => p.TblFeedbacks)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblFeedba__userI__4BAC3F29");
        });

        modelBuilder.Entity<TblNotification>(entity =>
        {
            entity.HasKey(e => e.NotificationId).HasName("PK__tblNotif__4BA5CE89FA1344B2");

            entity.ToTable("tblNotifications");

            entity.Property(e => e.NotificationId).HasColumnName("notificationID");
            entity.Property(e => e.IsRead).HasColumnName("isRead");
            entity.Property(e => e.NotificationDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("notificationDate");
            entity.Property(e => e.NotificationText).HasColumnName("notificationText");
            entity.Property(e => e.UserId)
                .HasMaxLength(20)
                .HasColumnName("userID");

            entity.HasOne(d => d.User).WithMany(p => p.TblNotifications)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblNotifi__userI__571DF1D5");
        });

        modelBuilder.Entity<TblPackage>(entity =>
        {
            entity.HasKey(e => e.PackageId).HasName("PK__tblPacka__AA8D20E8B2191B2C");

            entity.ToTable("tblPackages");

            entity.Property(e => e.PackageId).HasColumnName("packageID");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.PackageName)
                .HasMaxLength(100)
                .HasColumnName("packageName");
            entity.Property(e => e.Price)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("price");
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .HasDefaultValue("Active")
                .HasColumnName("status");
        });

        modelBuilder.Entity<TblPackageDetail>(entity =>
        {
            entity.HasKey(e => e.PackageDetailId).HasName("PK__tblPacka__B9B06E1D653E139A");

            entity.ToTable("tblPackageDetails");

            entity.Property(e => e.PackageDetailId).HasColumnName("packageDetailID");
            entity.Property(e => e.PackageId).HasColumnName("packageID");
            entity.Property(e => e.VaccineId).HasColumnName("vaccineID");

            entity.HasOne(d => d.Package).WithMany(p => p.TblPackageDetails)
                .HasForeignKey(d => d.PackageId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblPackag__packa__5CD6CB2B");

            entity.HasOne(d => d.Vaccine).WithMany(p => p.TblPackageDetails)
                .HasForeignKey(d => d.VaccineId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblPackag__vacci__5DCAEF64");
        });

        modelBuilder.Entity<TblPayment>(entity =>
        {
            entity.HasKey(e => e.PaymentId).HasName("PK__tblPayme__A0D9EFA61E539D71");

            entity.ToTable("tblPayments");

            entity.HasIndex(e => e.TransactionCode, "UQ__tblPayme__CF15ABA8B39DF453").IsUnique();

            entity.Property(e => e.PaymentId).HasColumnName("paymentID");
            entity.Property(e => e.Amount)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("amount");
            entity.Property(e => e.AppointmentId).HasColumnName("appointmentID");
            entity.Property(e => e.PaymentDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("paymentDate");
            entity.Property(e => e.PaymentMethod)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("paymentMethod");
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("status");
            entity.Property(e => e.TransactionCode)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("transactionCode");
            entity.Property(e => e.UpdateDate)
                .HasColumnType("datetime")
                .HasColumnName("updateDate");
            entity.Property(e => e.UpdatedBy)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("updatedBy");

            entity.HasOne(d => d.Appointment).WithMany(p => p.TblPayments)
                .HasForeignKey(d => d.AppointmentId)
                .HasConstraintName("FK__tblPaymen__appoi__75A278F5");
        });

        modelBuilder.Entity<TblReport>(entity =>
        {
            entity.HasKey(e => e.ReportId).HasName("PK__tblRepor__1C9B4ECDC7A4BAC1");

            entity.ToTable("tblReports");

            entity.Property(e => e.ReportId).HasColumnName("reportID");
            entity.Property(e => e.CenterId).HasColumnName("centerID");
            entity.Property(e => e.ReportDate).HasColumnName("reportDate");
            entity.Property(e => e.TotalAppointments).HasColumnName("totalAppointments");
            entity.Property(e => e.TotalRevenue)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("totalRevenue");

            entity.HasOne(d => d.Center).WithMany(p => p.TblReports)
                .HasForeignKey(d => d.CenterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblReport__cente__4F7CD00D");
        });

        modelBuilder.Entity<TblService>(entity =>
        {
            entity.HasKey(e => e.ServiceId).HasName("PK__tblServi__4550733F19451A29");

            entity.ToTable("tblServices");

            entity.Property(e => e.ServiceId).HasColumnName("serviceID");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Price)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("price");
            entity.Property(e => e.ServiceName)
                .HasMaxLength(100)
                .HasColumnName("serviceName");
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .HasDefaultValue("Active")
                .HasColumnName("status");
        });

        modelBuilder.Entity<TblServiceAppointment>(entity =>
        {
            entity.HasKey(e => e.ServiceAppointmentId).HasName("PK__tblServi__69AF81B2FB265923");

            entity.ToTable("tblServiceAppointments");

            entity.Property(e => e.ServiceAppointmentId).HasColumnName("serviceAppointmentID");
            entity.Property(e => e.AppointmentId).HasColumnName("appointmentID");
            entity.Property(e => e.ServiceId).HasColumnName("serviceID");

            entity.HasOne(d => d.Appointment).WithMany(p => p.TblServiceAppointments)
                .HasForeignKey(d => d.AppointmentId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblServic__appoi__60A75C0F");

            entity.HasOne(d => d.Service).WithMany(p => p.TblServiceAppointments)
                .HasForeignKey(d => d.ServiceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblServic__servi__619B8048");
        });

        modelBuilder.Entity<TblStaff>(entity =>
        {
            entity.HasKey(e => e.StaffId).HasName("PK__tblStaff__6465E19E9584FEF6");

            entity.ToTable("tblStaff");

            entity.Property(e => e.StaffId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("staffID");
            entity.Property(e => e.Address)
                .HasMaxLength(100)
                .HasColumnName("address");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("password");
            entity.Property(e => e.Phone)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("phone");
            entity.Property(e => e.RoleId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasDefaultValue("Staff")
                .HasColumnName("roleID");
            entity.Property(e => e.StaffName)
                .HasMaxLength(50)
                .HasColumnName("staffName");
            entity.Property(e => e.Status)
                .HasDefaultValue(true)
                .HasColumnName("status");
        });

        modelBuilder.Entity<TblVaccine>(entity =>
        {
            entity.HasKey(e => e.VaccineId).HasName("PK__tblVacci__C1ED3DD583359102");

            entity.ToTable("tblVaccines");

            entity.Property(e => e.VaccineId).HasColumnName("vaccineID");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Price)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("price");
            entity.Property(e => e.RecommendedAge)
                .HasMaxLength(50)
                .HasColumnName("recommendedAge");
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .HasDefaultValue("Active")
                .HasColumnName("status");
            entity.Property(e => e.VaccineName)
                .HasMaxLength(100)
                .HasColumnName("vaccineName");
        });

        modelBuilder.Entity<TblVaccineReaction>(entity =>
        {
            entity.HasKey(e => e.ReactionId).HasName("PK__tblVacci__7F64F4A75AC93C06");

            entity.ToTable("tblVaccineReactions");

            entity.Property(e => e.ReactionId).HasColumnName("reactionID");
            entity.Property(e => e.AppointmentId).HasColumnName("appointmentID");
            entity.Property(e => e.ReactionDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnName("reactionDate");
            entity.Property(e => e.ReactionText).HasColumnName("reactionText");

            entity.HasOne(d => d.Appointment).WithMany(p => p.TblVaccineReactions)
                .HasForeignKey(d => d.AppointmentId)
                .HasConstraintName("FK__tblVaccin__appoi__68487DD7");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
