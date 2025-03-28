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

    private void ShowChildrenProfile_Click(object sender, RoutedEventArgs e)
    {

    }

    private void ShowVaccineSchedule_Click(object sender, RoutedEventArgs e)
    {

    }

    private void ShowBooking_Click(object sender, RoutedEventArgs e)
    {

    }

    private void ShowNotifications_Click(object sender, RoutedEventArgs e)
    {

    }

    private void ShowReactions_Click(object sender, RoutedEventArgs e)
    {

    }

    private void ShowUserProfile_Click(object sender, RoutedEventArgs e)
    {

    }

    private void AddChild_Click(object sender, RoutedEventArgs e)
    {

    }

    private void Logout_Click(object sender, RoutedEventArgs e)
    {
        // Clear the current user's session
        // App.CurrentUser = null; // Uncomment this line if you have a CurrentUser property in App.xaml.cs

        // Open the LoginWindow
        LoginWindow loginWindow = new LoginWindow();
        loginWindow.Show();

        // Close the MainWindow
        this.Close();

    }
    private void EditChild_Click(object sender, RoutedEventArgs e)
    {
        MessageBox.Show("Edit child information - Implement logic to update tblChildren");
    }

    private void ViewChildDetails_Click(object sender, RoutedEventArgs e)
    {
        MessageBox.Show("View details");
    }
}