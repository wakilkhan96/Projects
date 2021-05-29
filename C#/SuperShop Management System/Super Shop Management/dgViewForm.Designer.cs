namespace Super_Shop_Management
{
    partial class dgViewForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(dgViewForm));
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.quantity = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.category = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cost = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.superShopLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView
            // 
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.id,
            this.name,
            this.quantity,
            this.category,
            this.cost});
            this.dataGridView.Location = new System.Drawing.Point(23, 102);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.Size = new System.Drawing.Size(657, 341);
            this.dataGridView.TabIndex = 0;
            // 
            // id
            // 
            this.id.HeaderText = "Product ID";
            this.id.Name = "id";
            // 
            // name
            // 
            this.name.HeaderText = "Product Name";
            this.name.Name = "name";
            this.name.Width = 140;
            // 
            // quantity
            // 
            this.quantity.HeaderText = "Product Available          (qty)";
            this.quantity.Name = "quantity";
            this.quantity.Width = 120;
            // 
            // category
            // 
            this.category.HeaderText = "Product Category";
            this.category.Name = "category";
            this.category.Width = 120;
            // 
            // cost
            // 
            this.cost.HeaderText = "Unit Cost";
            this.cost.Name = "cost";
            // 
            // superShopLabel
            // 
            this.superShopLabel.AutoSize = true;
            this.superShopLabel.Font = new System.Drawing.Font("Verdana", 20.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.superShopLabel.ForeColor = System.Drawing.SystemColors.WindowFrame;
            this.superShopLabel.Location = new System.Drawing.Point(177, 28);
            this.superShopLabel.Name = "superShopLabel";
            this.superShopLabel.Size = new System.Drawing.Size(349, 32);
            this.superShopLabel.TabIndex = 1;
            this.superShopLabel.Text = "Super  Shop  Products";
            // 
            // dgViewForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(704, 461);
            this.Controls.Add(this.superShopLabel);
            this.Controls.Add(this.dataGridView);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "dgViewForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "All Products";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.DataGridViewTextBoxColumn id;
        private System.Windows.Forms.DataGridViewTextBoxColumn name;
        private System.Windows.Forms.DataGridViewTextBoxColumn quantity;
        private System.Windows.Forms.DataGridViewTextBoxColumn category;
        private System.Windows.Forms.DataGridViewTextBoxColumn cost;
        private System.Windows.Forms.Label superShopLabel;
    }
}