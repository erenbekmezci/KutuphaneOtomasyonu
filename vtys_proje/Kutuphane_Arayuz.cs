using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace vtys_proje
{
    public partial class Kutuphane_Arayuz : Form
    {
        public Kutuphane_Arayuz()
        {
            InitializeComponent();
        }

       
        private void btnUyeFormu_Click(object sender, EventArgs e)
        {
            

            Uyeİslemleri frm = new Uyeİslemleri();
            frm.ShowDialog();
            
            

        }

        private void btnKitapFormu_Click(object sender, EventArgs e)
        {
            Form1 frm = new Form1();
            frm.ShowDialog();
        }

        private void Kutuphane_Arayuz_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e) //ödünç işlemeri butonu
        {
            Odunc_İslemleri frm = new Odunc_İslemleri();
            frm.ShowDialog();
        }
    }
}
