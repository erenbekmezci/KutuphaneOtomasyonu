
namespace vtys_proje
{
    partial class Form1
    {
        /// <summary>
        ///Gerekli tasarımcı değişkeni.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///Kullanılan tüm kaynakları temizleyin.
        /// </summary>
        ///<param name="disposing">yönetilen kaynaklar dispose edilmeliyse doğru; aksi halde yanlış.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer üretilen kod

        /// <summary>
        /// Tasarımcı desteği için gerekli metot - bu metodun 
        ///içeriğini kod düzenleyici ile değiştirmeyin.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridViewKitap = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.txtKadi = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.txtKyazar = new System.Windows.Forms.TextBox();
            this.txtKbasimyili = new System.Windows.Forms.TextBox();
            this.txtKstok = new System.Windows.Forms.TextBox();
            this.txtKisbn = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txtKsayfa = new System.Windows.Forms.TextBox();
            this.BtnKitapekle = new System.Windows.Forms.Button();
            this.btnKitapSil = new System.Windows.Forms.Button();
            this.btnKitapUpdate = new System.Windows.Forms.Button();
            this.btnKitapListele = new System.Windows.Forms.Button();
            this.txtKturadi = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.cmbKyayin = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txtKid = new System.Windows.Forms.TextBox();
            this.txtAraKitap = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewKitap)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridViewKitap
            // 
            this.dataGridViewKitap.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewKitap.Location = new System.Drawing.Point(282, 11);
            this.dataGridViewKitap.Name = "dataGridViewKitap";
            this.dataGridViewKitap.RowHeadersWidth = 51;
            this.dataGridViewKitap.RowTemplate.Height = 24;
            this.dataGridViewKitap.Size = new System.Drawing.Size(869, 276);
            this.dataGridViewKitap.TabIndex = 0;
            this.dataGridViewKitap.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(58, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Kitap adı";
            // 
            // txtKadi
            // 
            this.txtKadi.Location = new System.Drawing.Point(153, 14);
            this.txtKadi.Name = "txtKadi";
            this.txtKadi.Size = new System.Drawing.Size(100, 22);
            this.txtKadi.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(53, 324);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(68, 17);
            this.label2.TabIndex = 3;
            this.label2.Text = "Yazar adı";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(55, 66);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(66, 17);
            this.label3.TabIndex = 4;
            this.label3.Text = "Yayın Evi";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(53, 111);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(68, 17);
            this.label4.TabIndex = 5;
            this.label4.Text = "Basım Yılı";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(42, 153);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(79, 17);
            this.label5.TabIndex = 6;
            this.label5.Text = "stok miktarı";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(82, 199);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(39, 17);
            this.label7.TabIndex = 8;
            this.label7.Text = "ISBN";
            // 
            // txtKyazar
            // 
            this.txtKyazar.Location = new System.Drawing.Point(153, 319);
            this.txtKyazar.Name = "txtKyazar";
            this.txtKyazar.Size = new System.Drawing.Size(100, 22);
            this.txtKyazar.TabIndex = 9;
            // 
            // txtKbasimyili
            // 
            this.txtKbasimyili.Location = new System.Drawing.Point(153, 111);
            this.txtKbasimyili.Name = "txtKbasimyili";
            this.txtKbasimyili.Size = new System.Drawing.Size(100, 22);
            this.txtKbasimyili.TabIndex = 11;
            // 
            // txtKstok
            // 
            this.txtKstok.Location = new System.Drawing.Point(153, 153);
            this.txtKstok.Name = "txtKstok";
            this.txtKstok.Size = new System.Drawing.Size(100, 22);
            this.txtKstok.TabIndex = 12;
            // 
            // txtKisbn
            // 
            this.txtKisbn.Location = new System.Drawing.Point(153, 199);
            this.txtKisbn.Name = "txtKisbn";
            this.txtKisbn.Size = new System.Drawing.Size(100, 22);
            this.txtKisbn.TabIndex = 14;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(36, 243);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(85, 17);
            this.label8.TabIndex = 15;
            this.label8.Text = "Sayfa Sayısı";
            // 
            // txtKsayfa
            // 
            this.txtKsayfa.Location = new System.Drawing.Point(153, 238);
            this.txtKsayfa.Name = "txtKsayfa";
            this.txtKsayfa.Size = new System.Drawing.Size(100, 22);
            this.txtKsayfa.TabIndex = 16;
            // 
            // BtnKitapekle
            // 
            this.BtnKitapekle.Location = new System.Drawing.Point(287, 302);
            this.BtnKitapekle.Name = "BtnKitapekle";
            this.BtnKitapekle.Size = new System.Drawing.Size(119, 57);
            this.BtnKitapekle.TabIndex = 17;
            this.BtnKitapekle.Text = "Kitap Ekle";
            this.BtnKitapekle.UseVisualStyleBackColor = true;
            this.BtnKitapekle.Click += new System.EventHandler(this.BtnKitapekle_Click);
            // 
            // btnKitapSil
            // 
            this.btnKitapSil.Location = new System.Drawing.Point(537, 302);
            this.btnKitapSil.Name = "btnKitapSil";
            this.btnKitapSil.Size = new System.Drawing.Size(119, 57);
            this.btnKitapSil.TabIndex = 18;
            this.btnKitapSil.Text = "Kitap Sil";
            this.btnKitapSil.UseVisualStyleBackColor = true;
            this.btnKitapSil.Click += new System.EventHandler(this.btnKitapSil_Click);
            // 
            // btnKitapUpdate
            // 
            this.btnKitapUpdate.Location = new System.Drawing.Point(662, 302);
            this.btnKitapUpdate.Name = "btnKitapUpdate";
            this.btnKitapUpdate.Size = new System.Drawing.Size(119, 57);
            this.btnKitapUpdate.TabIndex = 19;
            this.btnKitapUpdate.Text = "Güncelle";
            this.btnKitapUpdate.UseVisualStyleBackColor = true;
            this.btnKitapUpdate.Click += new System.EventHandler(this.btnKitapUpdate_Click);
            // 
            // btnKitapListele
            // 
            this.btnKitapListele.Location = new System.Drawing.Point(412, 302);
            this.btnKitapListele.Name = "btnKitapListele";
            this.btnKitapListele.Size = new System.Drawing.Size(119, 57);
            this.btnKitapListele.TabIndex = 20;
            this.btnKitapListele.Text = "Listele";
            this.btnKitapListele.UseVisualStyleBackColor = true;
            this.btnKitapListele.Click += new System.EventHandler(this.button4_Click);
            // 
            // txtKturadi
            // 
            this.txtKturadi.Location = new System.Drawing.Point(153, 277);
            this.txtKturadi.Name = "txtKturadi";
            this.txtKturadi.Size = new System.Drawing.Size(100, 22);
            this.txtKturadi.TabIndex = 22;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(68, 282);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(53, 17);
            this.label9.TabIndex = 21;
            this.label9.Text = "Tür adı";
            // 
            // cmbKyayin
            // 
            this.cmbKyayin.FormattingEnabled = true;
            this.cmbKyayin.Location = new System.Drawing.Point(153, 66);
            this.cmbKyayin.Name = "cmbKyayin";
            this.cmbKyayin.Size = new System.Drawing.Size(100, 24);
            this.cmbKyayin.TabIndex = 23;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(787, 302);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(251, 17);
            this.label6.TabIndex = 43;
            this.label6.Text = "ENTER ID TO UPDATE OR DELETE : ";
            // 
            // txtKid
            // 
            this.txtKid.Location = new System.Drawing.Point(1051, 302);
            this.txtKid.Name = "txtKid";
            this.txtKid.Size = new System.Drawing.Size(100, 22);
            this.txtKid.TabIndex = 42;
            // 
            // txtAraKitap
            // 
            this.txtAraKitap.Location = new System.Drawing.Point(1051, 349);
            this.txtAraKitap.Name = "txtAraKitap";
            this.txtAraKitap.Size = new System.Drawing.Size(100, 22);
            this.txtAraKitap.TabIndex = 45;
            this.txtAraKitap.TextChanged += new System.EventHandler(this.txtAraKitap_TextChanged);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(1001, 352);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(44, 17);
            this.label10.TabIndex = 44;
            this.label10.Text = "ARA :";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1154, 429);
            this.Controls.Add(this.txtAraKitap);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtKid);
            this.Controls.Add(this.cmbKyayin);
            this.Controls.Add(this.txtKturadi);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.btnKitapListele);
            this.Controls.Add(this.btnKitapUpdate);
            this.Controls.Add(this.btnKitapSil);
            this.Controls.Add(this.BtnKitapekle);
            this.Controls.Add(this.txtKsayfa);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.txtKisbn);
            this.Controls.Add(this.txtKstok);
            this.Controls.Add(this.txtKbasimyili);
            this.Controls.Add(this.txtKyazar);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtKadi);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridViewKitap);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewKitap)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewKitap;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtKadi;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtKyazar;
        private System.Windows.Forms.TextBox txtKbasimyili;
        private System.Windows.Forms.TextBox txtKstok;
        private System.Windows.Forms.TextBox txtKisbn;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtKsayfa;
        private System.Windows.Forms.Button BtnKitapekle;
        private System.Windows.Forms.Button btnKitapSil;
        private System.Windows.Forms.Button btnKitapUpdate;
        private System.Windows.Forms.Button btnKitapListele;
        private System.Windows.Forms.TextBox txtKturadi;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.ComboBox cmbKyayin;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtKid;
        private System.Windows.Forms.TextBox txtAraKitap;
        private System.Windows.Forms.Label label10;
    }
}

