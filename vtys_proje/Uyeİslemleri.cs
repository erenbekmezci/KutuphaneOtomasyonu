using Npgsql;
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
    public partial class Uyeİslemleri : Form
    {
        public Uyeİslemleri()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost;port=5432;Database=KutuphaneOtomasyonu;user ID=postgres;password=kardelen67");

        void griddoldur()
        {
            string sorgu = "select * from tbkisi";

            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            baglanti.Open();
            da.Fill(ds);
            dataGridViewUye.DataSource = ds.Tables[0];
            baglanti.Close();
            
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void Uyeİslemleri_Load(object sender, EventArgs e)
        {
            griddoldur();
            baglanti.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select * from medenidurum", baglanti);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmbMedeni.DisplayMember = "durumAdi";
            cmbMedeni.ValueMember = "durumNo";
            cmbMedeni.DataSource = dt;

            da = new NpgsqlDataAdapter("select * from il", baglanti);
            DataTable dt2 = new DataTable();
            da.Fill(dt2);
            cmbUil.DisplayMember = "ilAd";
            cmbUil.ValueMember = "ilNo";
            cmbUil.DataSource = dt2;

            baglanti.Close();

        }
        
        private void btnUyeEkle_Click(object sender, EventArgs e)
        {
            if (txtUad.Text == "" || txtUsoyad.Text == ""  || txtUadres.Text == "" ||txtUtelefon.Text=="" || txtUyetc.Text=="" || cmbUcinsiyet.SelectedItem.ToString() == "")
            {
                MessageBox.Show("lütfen tüm alanları doldurunuz !!");
               
            }
            else
            {
                baglanti.Open();

                string kod = "INSERT INTO tbkisi (ad,cinsiyet,\"kisiTur\",\"medeniDurumu\",soyad) VALUES (@p1,@p2,@p3,@p4,@p5)";

                NpgsqlCommand komut = new NpgsqlCommand(kod, baglanti);

                komut.Parameters.AddWithValue("@p1", txtUad.Text);
                komut.Parameters.AddWithValue("@p2", cmbUcinsiyet.SelectedItem.ToString());
                komut.Parameters.AddWithValue("@p3", "Üye");
                komut.Parameters.AddWithValue("@p4", int.Parse(cmbMedeni.SelectedValue.ToString()));
                komut.Parameters.AddWithValue("@p5", txtUsoyad.Text);

                komut.ExecuteNonQuery();

                kod = "insert into tbuye (\"kisiNo\" , \"kimlikNo\") values (currval('public.\"Kisi_kisiNo_seq\"') ,@p6)";
                komut = new NpgsqlCommand(kod, baglanti);

                komut.Parameters.AddWithValue("@p6", txtUyetc.Text);

                komut.ExecuteNonQuery();

                kod = "insert into iletisim_bilgileri (adres,telefon,ilce,\"kisiNo\") values(@p7 , @p8 , @p9 , currval('public.\"Kisi_kisiNo_seq\"'))";

                komut = new NpgsqlCommand(kod, baglanti);

                komut.Parameters.AddWithValue("@p7", txtUadres.Text);
                komut.Parameters.AddWithValue("@p8", txtUtelefon.Text);
                komut.Parameters.AddWithValue("@p9", int.Parse(cmbUilce.SelectedValue.ToString()));

                komut.ExecuteNonQuery();

                baglanti.Close();


                MessageBox.Show("ekleme başarılı");
            }
        }

        private void cmbUil_SelectedIndexChanged(object sender, EventArgs e)
        {

            int i = int.Parse(cmbUil.SelectedValue.ToString());

            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select * from ilce where  \"ilNo\" = "+i+"", baglanti);
            DataTable dt3 = new DataTable();
            da.Fill(dt3);
            cmbUilce.DisplayMember = "ilceAd";
            cmbUilce.ValueMember = "ilceNo";
            cmbUilce.DataSource = dt3;

        }

        private void btnUyeListele_Click(object sender, EventArgs e)
        {
            string sorgu = "select * from tbkisi";

            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            baglanti.Open();
            da.Fill(ds);
            dataGridViewUye.DataSource = ds.Tables[0];
            baglanti.Close();



        }

        private void btnUyeUpdate_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string kod =  "update tbkisi set ad = @p1 , cinsiyet = @p2 , \"medeniDurumu\" = @p3, soyad = @p4 where \"kisiNo\" = @p5";

            NpgsqlCommand komut = new NpgsqlCommand(kod, baglanti);

            komut.Parameters.AddWithValue("@p1", txtUad.Text);
            komut.Parameters.AddWithValue("@p2", cmbUcinsiyet.SelectedItem.ToString());
            komut.Parameters.AddWithValue("@p3", int.Parse(cmbMedeni.SelectedValue.ToString()));
            komut.Parameters.AddWithValue("@p4", txtUsoyad.Text);
            komut.Parameters.AddWithValue("@p5", int.Parse(txtUid.Text));

            komut.ExecuteNonQuery();

            kod = "update tbuye set \"kimlikNo\" = @p6 where \"kisiNo\" = @p7";
            komut = new NpgsqlCommand(kod, baglanti);
            komut.Parameters.AddWithValue("@p6", txtUyetc.Text);
            komut.Parameters.AddWithValue("@p7", int.Parse(txtUid.Text));

            komut.ExecuteNonQuery();

            kod = "update iletisim_bilgileri set adres = @p8 , telefon = @p9 , ilce = @p10 where  \"kisiNo\" = @p11";
            komut = new NpgsqlCommand(kod, baglanti);
            komut.Parameters.AddWithValue("@p8", txtUadres.Text);
            komut.Parameters.AddWithValue("@p9", txtUtelefon.Text);
            komut.Parameters.AddWithValue("@p10", int.Parse(cmbUilce.SelectedValue.ToString()));
            komut.Parameters.AddWithValue("@p11", int.Parse(txtUid.Text));
            komut.ExecuteNonQuery();
            MessageBox.Show("güncelleme başarılı");
            baglanti.Close();
        }

        private void btnUyeSil_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string kod = "delete from tbkisi where \"kisiNo\" = @p1 ";

            NpgsqlCommand komut = new NpgsqlCommand(kod, baglanti);

            komut.Parameters.AddWithValue("@p1", int.Parse(txtUid.Text));

            komut.ExecuteNonQuery();

            MessageBox.Show("silme başarılı");
            baglanti.Close();
        }

        private void dataGridViewUye_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridViewUye_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridViewUye_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridViewUye.CurrentRow;
            
            txtUad.Text = row.Cells[1].Value.ToString();
            txtUsoyad.Text = row.Cells[2].Value.ToString();
            cmbUcinsiyet.Text = row.Cells[3].Value.ToString();
            cmbMedeni.Text = row.Cells[4].Value.ToString();
            txtUid.Text = row.Cells[0].Value.ToString();
            


        }

        private void textBox1_TextChanged(object sender, EventArgs e) // uye ara
        {
            baglanti.Open();
            DataTable dt = new DataTable();
            NpgsqlDataAdapter ara = new NpgsqlDataAdapter("SELECT * FROM \"tbkisi\" WHERE \"ad\" LIKE '%" + txtAra.Text + "%' ", baglanti);
            ara.Fill(dt);
            baglanti.Close();
            dataGridViewUye.DataSource = dt;
        }
    }
}
