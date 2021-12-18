
namespace vtys_proje
{
    partial class Odunc_İslemleri
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridViewOdunc = new System.Windows.Forms.DataGridView();
            this.txtOalma = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txtOuye = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtOkitap = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtOverme = new System.Windows.Forms.TextBox();
            this.btnOduncListele = new System.Windows.Forms.Button();
            this.btnOduncGuncelle = new System.Windows.Forms.Button();
            this.btnOduncSil = new System.Windows.Forms.Button();
            this.btnOduncEkle = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.txtOid = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewOdunc)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridViewOdunc
            // 
            this.dataGridViewOdunc.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewOdunc.Location = new System.Drawing.Point(315, 12);
            this.dataGridViewOdunc.Name = "dataGridViewOdunc";
            this.dataGridViewOdunc.RowHeadersWidth = 51;
            this.dataGridViewOdunc.RowTemplate.Height = 24;
            this.dataGridViewOdunc.Size = new System.Drawing.Size(717, 256);
            this.dataGridViewOdunc.TabIndex = 1;
            // 
            // txtOalma
            // 
            this.txtOalma.Location = new System.Drawing.Point(150, 120);
            this.txtOalma.Name = "txtOalma";
            this.txtOalma.Size = new System.Drawing.Size(100, 22);
            this.txtOalma.TabIndex = 18;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(25, 125);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(119, 17);
            this.label8.TabIndex = 17;
            this.label8.Text = "Ödünç alma tarihi";
            // 
            // txtOuye
            // 
            this.txtOuye.AccessibleName = "";
            this.txtOuye.Location = new System.Drawing.Point(150, 73);
            this.txtOuye.Name = "txtOuye";
            this.txtOuye.Size = new System.Drawing.Size(100, 22);
            this.txtOuye.TabIndex = 16;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(62, 78);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(50, 17);
            this.label2.TabIndex = 15;
            this.label2.Text = "Üye ID";
            // 
            // txtOkitap
            // 
            this.txtOkitap.Location = new System.Drawing.Point(150, 23);
            this.txtOkitap.Name = "txtOkitap";
            this.txtOkitap.Size = new System.Drawing.Size(100, 22);
            this.txtOkitap.TabIndex = 14;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(62, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(57, 17);
            this.label1.TabIndex = 13;
            this.label1.Text = "Kitap ID";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(25, 171);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(113, 17);
            this.label3.TabIndex = 19;
            this.label3.Text = "Geri verme tarihi";
            // 
            // txtOverme
            // 
            this.txtOverme.Location = new System.Drawing.Point(150, 166);
            this.txtOverme.Name = "txtOverme";
            this.txtOverme.Size = new System.Drawing.Size(100, 22);
            this.txtOverme.TabIndex = 20;
            // 
            // btnOduncListele
            // 
            this.btnOduncListele.Location = new System.Drawing.Point(166, 286);
            this.btnOduncListele.Name = "btnOduncListele";
            this.btnOduncListele.Size = new System.Drawing.Size(119, 57);
            this.btnOduncListele.TabIndex = 28;
            this.btnOduncListele.Text = "Listele";
            this.btnOduncListele.UseVisualStyleBackColor = true;
            this.btnOduncListele.Click += new System.EventHandler(this.btnOduncListele_Click);
            // 
            // btnOduncGuncelle
            // 
            this.btnOduncGuncelle.Location = new System.Drawing.Point(291, 286);
            this.btnOduncGuncelle.Name = "btnOduncGuncelle";
            this.btnOduncGuncelle.Size = new System.Drawing.Size(119, 57);
            this.btnOduncGuncelle.TabIndex = 27;
            this.btnOduncGuncelle.Text = "Güncelle";
            this.btnOduncGuncelle.UseVisualStyleBackColor = true;
            this.btnOduncGuncelle.Click += new System.EventHandler(this.btnOduncGuncelle_Click);
            // 
            // btnOduncSil
            // 
            this.btnOduncSil.Location = new System.Drawing.Point(416, 286);
            this.btnOduncSil.Name = "btnOduncSil";
            this.btnOduncSil.Size = new System.Drawing.Size(119, 57);
            this.btnOduncSil.TabIndex = 26;
            this.btnOduncSil.Text = "Kayıt Sil";
            this.btnOduncSil.UseVisualStyleBackColor = true;
            this.btnOduncSil.Click += new System.EventHandler(this.btnOduncSil_Click);
            // 
            // btnOduncEkle
            // 
            this.btnOduncEkle.Location = new System.Drawing.Point(41, 286);
            this.btnOduncEkle.Name = "btnOduncEkle";
            this.btnOduncEkle.Size = new System.Drawing.Size(119, 57);
            this.btnOduncEkle.TabIndex = 25;
            this.btnOduncEkle.Text = "Ödünç Ekle";
            this.btnOduncEkle.UseVisualStyleBackColor = true;
            this.btnOduncEkle.Click += new System.EventHandler(this.btnOduncEkle_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(599, 286);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(251, 17);
            this.label4.TabIndex = 41;
            this.label4.Text = "ENTER ID TO UPDATE OR DELETE : ";
            // 
            // txtOid
            // 
            this.txtOid.Location = new System.Drawing.Point(856, 286);
            this.txtOid.Name = "txtOid";
            this.txtOid.Size = new System.Drawing.Size(100, 22);
            this.txtOid.TabIndex = 40;
            // 
            // Odunc_İslemleri
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1043, 410);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtOid);
            this.Controls.Add(this.btnOduncListele);
            this.Controls.Add(this.btnOduncGuncelle);
            this.Controls.Add(this.btnOduncSil);
            this.Controls.Add(this.btnOduncEkle);
            this.Controls.Add(this.txtOverme);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtOalma);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.txtOuye);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtOkitap);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridViewOdunc);
            this.Name = "Odunc_İslemleri";
            this.Text = "Odunc_İslemleri";
            this.Load += new System.EventHandler(this.Odunc_İslemleri_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewOdunc)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewOdunc;
        private System.Windows.Forms.TextBox txtOalma;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtOuye;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtOkitap;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtOverme;
        private System.Windows.Forms.Button btnOduncListele;
        private System.Windows.Forms.Button btnOduncGuncelle;
        private System.Windows.Forms.Button btnOduncSil;
        private System.Windows.Forms.Button btnOduncEkle;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtOid;
    }
}