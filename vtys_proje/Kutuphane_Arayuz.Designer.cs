
namespace vtys_proje
{
    partial class Kutuphane_Arayuz
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
            this.btnUyeFormu = new System.Windows.Forms.Button();
            this.btnKitapFormu = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnUyeFormu
            // 
            this.btnUyeFormu.Location = new System.Drawing.Point(85, 85);
            this.btnUyeFormu.Name = "btnUyeFormu";
            this.btnUyeFormu.Size = new System.Drawing.Size(124, 75);
            this.btnUyeFormu.TabIndex = 0;
            this.btnUyeFormu.Text = "Üye İşlemleri";
            this.btnUyeFormu.UseVisualStyleBackColor = true;
            this.btnUyeFormu.Click += new System.EventHandler(this.btnUyeFormu_Click);
            // 
            // btnKitapFormu
            // 
            this.btnKitapFormu.Location = new System.Drawing.Point(246, 85);
            this.btnKitapFormu.Name = "btnKitapFormu";
            this.btnKitapFormu.Size = new System.Drawing.Size(124, 75);
            this.btnKitapFormu.TabIndex = 1;
            this.btnKitapFormu.Text = "Kitap İşlemleri";
            this.btnKitapFormu.UseVisualStyleBackColor = true;
            this.btnKitapFormu.Click += new System.EventHandler(this.btnKitapFormu_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(407, 85);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(124, 75);
            this.button1.TabIndex = 2;
            this.button1.Text = "Ödünç İşlemleri";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Kutuphane_Arayuz
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(605, 256);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.btnKitapFormu);
            this.Controls.Add(this.btnUyeFormu);
            this.Name = "Kutuphane_Arayuz";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Kutuphane_Arayuz";
            this.Load += new System.EventHandler(this.Kutuphane_Arayuz_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnUyeFormu;
        private System.Windows.Forms.Button btnKitapFormu;
        private System.Windows.Forms.Button button1;
    }
}