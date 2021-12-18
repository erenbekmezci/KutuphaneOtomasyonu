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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost;port=5432;Database=KutuphaneOtomasyonu;user ID=postgres;password=kardelen67");
        NpgsqlDataAdapter da;
        void griddoldur2()
        {
            string sorgu = "select * from tbkitap";

            da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            baglanti.Open();
            da.Fill(ds);
            dataGridViewKitap.DataSource = ds.Tables[0];
            baglanti.Close();

        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e) //kitap listele
        {
            string sorgu = "select * from tbkitap";

            da = new NpgsqlDataAdapter(sorgu, baglanti);

            DataSet ds = new DataSet();

            da.Fill(ds);

            dataGridViewKitap.DataSource = ds.Tables[0];

        }

        private void BtnKitapekle_Click(object sender, EventArgs e)
        {
            if (txtKadi.Text == "" || txtKbasimyili.Text == "" || txtKisbn.Text == "" || txtKsayfa.Text == "" || txtKstok.Text == "" || txtKturadi.Text == "" || txtKyazar.Text == "")
            {
                MessageBox.Show("lütfen tüm alanları doldurunuz !!");

            }
            else
            {
                baglanti.Open();

                string kod = "INSERT INTO tbkitap (\"kitapAdi\",\"ISBN\",\"basimYili\",\"sayfaSayisi\",stok,\"yayinEvi\") VALUES (@p1,@p2,@p3,@p4,@p5,@p6)";

                NpgsqlCommand komut = new NpgsqlCommand(kod, baglanti);

                komut.Parameters.AddWithValue("@p1", txtKadi.Text);
                komut.Parameters.AddWithValue("@p2", txtKisbn.Text);
                komut.Parameters.AddWithValue("@p3", DateTime.Parse(txtKbasimyili.Text));
                komut.Parameters.AddWithValue("@p4", int.Parse(txtKsayfa.Text));
                komut.Parameters.AddWithValue("@p5", int.Parse(txtKstok.Text));
                komut.Parameters.AddWithValue("@p6", int.Parse(cmbKyayin.SelectedValue.ToString()));

                komut.ExecuteNonQuery();

                kod = "insert into tbyazar (\"yazarAd\") values (@p7)";

                komut = new NpgsqlCommand(kod, baglanti);

                komut.Parameters.AddWithValue("@p7", txtKyazar.Text);

                komut.ExecuteNonQuery();

                kod = "insert into tbtur (\"turAd\") values( @p8)";

                komut = new NpgsqlCommand(kod, baglanti);
                
                komut.Parameters.AddWithValue("@p8", txtKturadi.Text);
       

                komut.ExecuteNonQuery();

                kod = "insert into kitap_tur (kitap , tur) values(currval('public.\"Kitap_kitapNo_seq\"') , currval('public.\"Tur_turNo_seq\"')) ";

                komut = new NpgsqlCommand(kod, baglanti);

                komut.ExecuteNonQuery();

                kod = "insert into kitap_yazar (kitap , yazar) values(currval('public.\"Kitap_kitapNo_seq\"') , currval('public.\"Yazar_yazarNo_seq\"')) ";

                komut = new NpgsqlCommand(kod, baglanti);

                komut.ExecuteNonQuery();


                baglanti.Close();


                MessageBox.Show("ekleme başarılı");
            }



        }

        private void Form1_Load(object sender, EventArgs e)
        {
            griddoldur2();
            da = new NpgsqlDataAdapter("select * from tbyayinevi", baglanti);
            DataTable dt2 = new DataTable();
            da.Fill(dt2);
            cmbKyayin.DisplayMember = "yayinEviAdi";
            cmbKyayin.ValueMember = "yayinEviNo";
            cmbKyayin.DataSource = dt2;
        }

        private void btnKitapUpdate_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string kod = "update tbkitap set \"kitapAdi\" = @p1 , \"ISBN\" = @p2 , \"basimYili\" = @p3, \"sayfaSayisi\" = @p4,stok = @p5 ,\"yayinEvi\" = @p6 where \"kitapNo\" = @p7";

            NpgsqlCommand komut = new NpgsqlCommand(kod, baglanti);

            komut.Parameters.AddWithValue("@p1", txtKadi.Text);
            komut.Parameters.AddWithValue("@p2", txtKisbn.Text);
            komut.Parameters.AddWithValue("@p3", DateTime.Parse(txtKbasimyili.Text));
            komut.Parameters.AddWithValue("@p4", int.Parse(txtKsayfa.Text));
            komut.Parameters.AddWithValue("@p5", int.Parse(txtKstok.Text));
            komut.Parameters.AddWithValue("@p6", int.Parse(cmbKyayin.SelectedValue.ToString()));
            komut.Parameters.AddWithValue("@p7", int.Parse(txtKid.Text));

            komut.ExecuteNonQuery();



           

           
            MessageBox.Show("güncelleme başarılı");
            baglanti.Close();
        }

        private void btnKitapSil_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string kod = "delete from tbkitap where \"kitapNo\" = @p1 ";

            NpgsqlCommand komut = new NpgsqlCommand(kod, baglanti);

            komut.Parameters.AddWithValue("@p1", int.Parse(txtKid.Text));

            komut.ExecuteNonQuery();

            MessageBox.Show("silme başarılı");
            baglanti.Close();
        }

        private void txtAraKitap_TextChanged(object sender, EventArgs e)
        {
            baglanti.Open();
            DataTable dt = new DataTable();
            NpgsqlDataAdapter ara = new NpgsqlDataAdapter("SELECT * FROM \"tbkitap\" WHERE \"kitapAdi\" LIKE '%" + txtAraKitap.Text + "%' ", baglanti);
            ara.Fill(dt);
            baglanti.Close();
            dataGridViewKitap.DataSource = dt;
        }
    }
}
