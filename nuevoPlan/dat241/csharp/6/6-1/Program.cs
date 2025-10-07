using System;
using System.Windows.Forms;
using System.Drawing;
using System.Text;
using System.Data;

namespace CalculadoraSencilla
{
    class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Calculadora());
        }
    }

    public class Calculadora : Form
    {
        private TextBox txtNumero1;
        private TextBox txtNumero2;
        private Button btnCalcular;
        private TextBox txtResultado;
        private Label lblNumero1;
        private Label lblNumero2;
        private Label lblResultado;

        public Calculadora()
        {
            // Configuración de la ventana
            this.Text = "Calculadora Sencilla";
            this.Size = new Size(300, 250);
            this.StartPosition = FormStartPosition.CenterScreen;
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;

            // Etiqueta para el primer número
            lblNumero1 = new Label();
            lblNumero1.Text = "Número 1:";
            lblNumero1.Location = new Point(20, 20);
            lblNumero1.Size = new Size(80, 20);
            this.Controls.Add(lblNumero1);

            // Casilla para el primer número
            txtNumero1 = new TextBox();
            txtNumero1.Location = new Point(100, 20);
            txtNumero1.Size = new Size(150, 20);
            this.Controls.Add(txtNumero1);

            // Etiqueta para el segundo número
            lblNumero2 = new Label();
            lblNumero2.Text = "Número 2:";
            lblNumero2.Location = new Point(20, 50);
            lblNumero2.Size = new Size(80, 20);
            this.Controls.Add(lblNumero2);

            // Casilla para el segundo número
            txtNumero2 = new TextBox();
            txtNumero2.Location = new Point(100, 50);
            txtNumero2.Size = new Size(150, 20);
            this.Controls.Add(txtNumero2);

            // Botón para calcular
            btnCalcular = new Button();
            btnCalcular.Text = "Calcular Suma";
            btnCalcular.Location = new Point(100, 90);
            btnCalcular.Size = new Size(100, 30);
            btnCalcular.Click += BtnCalcular_Click;
            this.Controls.Add(btnCalcular);

            // Etiqueta para el resultado
            lblResultado = new Label();
            lblResultado.Text = "Resultado:";
            lblResultado.Location = new Point(20, 130);
            lblResultado.Size = new Size(80, 20);
            this.Controls.Add(lblResultado);

            // Casilla para el resultado (solo lectura)
            txtResultado = new TextBox();
            txtResultado.Location = new Point(100, 130);
            txtResultado.Size = new Size(150, 20);
            txtResultado.ReadOnly = true; // Solo lectura para evitar edición
            this.Controls.Add(txtResultado);
        }

        private void BtnCalcular_Click(object sender, EventArgs e)
        {
            try
            {
                // Obtener los números de las casillas
                double numero1 = Convert.ToDouble(txtNumero1.Text);
                double numero2 = Convert.ToDouble(txtNumero2.Text);

                // Calcular la suma
                double suma = numero1 + numero2;

                // Mostrar el resultado en la casilla
                txtResultado.Text = suma.ToString();
            }
            catch (FormatException)
            {
                MessageBox.Show("Por favor, ingrese números válidos.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ocurrió un error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}