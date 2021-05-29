namespace Super_Shop_Management
{
    partial class menuForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(menuForm));
            this.productViewButton = new System.Windows.Forms.Button();
            this.productSellButton = new System.Windows.Forms.Button();
            this.productConfigureButton = new System.Windows.Forms.Button();
            this.aboutButton = new System.Windows.Forms.Button();
            this.shopLabel = new System.Windows.Forms.Label();
            this.uLabel = new System.Windows.Forms.Label();
            this.userLabel = new System.Windows.Forms.Label();
            this.sellReportButton = new System.Windows.Forms.Button();
            this.pictureBox = new System.Windows.Forms.PictureBox();
            this.logoutButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox)).BeginInit();
            this.SuspendLayout();
            // 
            // productViewButton
            // 
            this.productViewButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.productViewButton.Location = new System.Drawing.Point(34, 218);
            this.productViewButton.Name = "productViewButton";
            this.productViewButton.Size = new System.Drawing.Size(211, 51);
            this.productViewButton.TabIndex = 0;
            this.productViewButton.Text = "View Products";
            this.productViewButton.UseVisualStyleBackColor = true;
            this.productViewButton.Click += new System.EventHandler(this.productViewButton_Click);
            // 
            // productSellButton
            // 
            this.productSellButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.productSellButton.Location = new System.Drawing.Point(244, 218);
            this.productSellButton.Name = "productSellButton";
            this.productSellButton.Size = new System.Drawing.Size(211, 51);
            this.productSellButton.TabIndex = 1;
            this.productSellButton.Text = "Sell Products";
            this.productSellButton.UseVisualStyleBackColor = true;
            this.productSellButton.Click += new System.EventHandler(this.productSellButton_Click);
            // 
            // productConfigureButton
            // 
            this.productConfigureButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.productConfigureButton.Location = new System.Drawing.Point(454, 218);
            this.productConfigureButton.Name = "productConfigureButton";
            this.productConfigureButton.Size = new System.Drawing.Size(211, 51);
            this.productConfigureButton.TabIndex = 2;
            this.productConfigureButton.Text = "Configure Products";
            this.productConfigureButton.UseVisualStyleBackColor = true;
            this.productConfigureButton.Click += new System.EventHandler(this.productConfigureButton_Click);
            // 
            // aboutButton
            // 
            this.aboutButton.Location = new System.Drawing.Point(581, 428);
            this.aboutButton.Name = "aboutButton";
            this.aboutButton.Size = new System.Drawing.Size(117, 27);
            this.aboutButton.TabIndex = 3;
            this.aboutButton.Text = "About Super Shop";
            this.aboutButton.UseVisualStyleBackColor = true;
            this.aboutButton.Click += new System.EventHandler(this.aboutButton_Click);
            // 
            // shopLabel
            // 
            this.shopLabel.AutoSize = true;
            this.shopLabel.Font = new System.Drawing.Font("Verdana", 20.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.shopLabel.ForeColor = System.Drawing.SystemColors.WindowFrame;
            this.shopLabel.Location = new System.Drawing.Point(251, 1);
            this.shopLabel.Name = "shopLabel";
            this.shopLabel.Size = new System.Drawing.Size(188, 32);
            this.shopLabel.TabIndex = 4;
            this.shopLabel.Text = "Super Shop";
            // 
            // uLabel
            // 
            this.uLabel.AutoSize = true;
            this.uLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.uLabel.Location = new System.Drawing.Point(146, 111);
            this.uLabel.Name = "uLabel";
            this.uLabel.Size = new System.Drawing.Size(114, 16);
            this.uLabel.TabIndex = 6;
            this.uLabel.Text = "User Profile   :  ";
            // 
            // userLabel
            // 
            this.userLabel.AutoSize = true;
            this.userLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.userLabel.ForeColor = System.Drawing.SystemColors.MenuHighlight;
            this.userLabel.Location = new System.Drawing.Point(280, 107);
            this.userLabel.Name = "userLabel";
            this.userLabel.Size = new System.Drawing.Size(0, 20);
            this.userLabel.TabIndex = 7;
            // 
            // sellReportButton
            // 
            this.sellReportButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sellReportButton.Location = new System.Drawing.Point(209, 339);
            this.sellReportButton.Name = "sellReportButton";
            this.sellReportButton.Size = new System.Drawing.Size(283, 38);
            this.sellReportButton.TabIndex = 8;
            this.sellReportButton.Text = "Show Report";
            this.sellReportButton.UseVisualStyleBackColor = true;
            this.sellReportButton.Click += new System.EventHandler(this.sellReportButton_Click);
            // 
            // pictureBox
            // 
            this.pictureBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pictureBox.Location = new System.Drawing.Point(475, 55);
            this.pictureBox.Name = "pictureBox";
            this.pictureBox.Size = new System.Drawing.Size(150, 130);
            this.pictureBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox.TabIndex = 5;
            this.pictureBox.TabStop = false;
            // 
            // logoutButton
            // 
            this.logoutButton.Location = new System.Drawing.Point(34, 387);
            this.logoutButton.Name = "logoutButton";
            this.logoutButton.Size = new System.Drawing.Size(84, 36);
            this.logoutButton.TabIndex = 9;
            this.logoutButton.Text = "Log Out";
            this.logoutButton.UseVisualStyleBackColor = true;
            this.logoutButton.Click += new System.EventHandler(this.logoutButton_Click);
            // 
            // menuForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(704, 461);
            this.Controls.Add(this.logoutButton);
            this.Controls.Add(this.sellReportButton);
            this.Controls.Add(this.userLabel);
            this.Controls.Add(this.uLabel);
            this.Controls.Add(this.pictureBox);
            this.Controls.Add(this.shopLabel);
            this.Controls.Add(this.aboutButton);
            this.Controls.Add(this.productConfigureButton);
            this.Controls.Add(this.productSellButton);
            this.Controls.Add(this.productViewButton);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "menuForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "menuForm";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button productViewButton;
        private System.Windows.Forms.Button productSellButton;
        private System.Windows.Forms.Button productConfigureButton;
        private System.Windows.Forms.Button aboutButton;
        private System.Windows.Forms.Label shopLabel;
        private System.Windows.Forms.PictureBox pictureBox;
        private System.Windows.Forms.Label uLabel;
        private System.Windows.Forms.Label userLabel;
        private System.Windows.Forms.Button sellReportButton;
        private System.Windows.Forms.Button logoutButton;
    }
}