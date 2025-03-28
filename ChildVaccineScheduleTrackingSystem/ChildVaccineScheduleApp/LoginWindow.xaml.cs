using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using ChildVaccineScheduleApp.BLL.Services;

namespace ChildVaccineScheduleApp
{
    /// <summary>
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {

        private AuthService _authService = new();

        public LoginWindow()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            // lay info da go tu man hinh login
            string email = EmailTextBox.Text.Trim();
            string password = PasswordTextBox.Text.Trim();

            // kiem tra xem co thieu thong tin khong
            if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
            {
                MessageBox.Show("Please enter both email and password", "Missing info", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // kiem tra xem co dung thong tin dang nhap khong
            var user = _authService.GetOne(email, password);

            if (user == null)
            {
                MessageBox.Show("Invalid email or password", "Login failed", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Lưu thông tin người dùng vào ứng dụng
            //App.CurrentUser = user;

            MainWindow mainWindow = new();
            //mainWindow.AuthenticatedAccount = user;
            mainWindow.Show();
            this.Close();

        }
        private void QuitButton_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}
