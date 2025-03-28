using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ChildVaccineScheduleApp;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow : Window
{

    //private FootballPlayerService _service = new();

    //public Uefaaccount AuthenticatedAccount { get; set; }

    public MainWindow()
    {
        InitializeComponent();
        ApplyPermissions();
    }

    private void ApplyPermissions()
    {
        //if (App.CurrentUser.Role == "Staff")
        //{
        //    btnCreate.IsEnabled = false; // Chỉ đọc
        //    btnUpdate.IsEnabled = false;
        //    btnDelete.IsEnabled = false;
        //}
        //else if (App.CurrentUser.Role == "Doctor")
        //{
        //    btnCreate.IsEnabled = true; // Cho phép CRUD
        //    btnUpdate.IsEnabled = true;
        //    btnDelete.IsEnabled = true;
        //}
    }
}