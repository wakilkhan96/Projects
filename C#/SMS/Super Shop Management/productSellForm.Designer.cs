namespace Super_Shop_Management
{
    partial class productSellForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(productSellForm));
            this.label1 = new System.Windows.Forms.Label();
            this.customerNameLabel = new System.Windows.Forms.Label();
            this.customerAddressLabel = new System.Windows.Forms.Label();
            this.customerCellLabel = new System.Windows.Forms.Label();
            this.customerNameTextBox = new System.Windows.Forms.TextBox();
            this.addressTextBox = new System.Windows.Forms.TextBox();
            this.cellTextBox = new System.Windows.Forms.TextBox();
            this.invoiceNumberLabel = new System.Windows.Forms.Label();
            this.dateLabel = new System.Windows.Forms.Label();
            this.invoiceNumberTextBox = new System.Windows.Forms.TextBox();
            this.dateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.label = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.quantity = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.price = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.productNameComboBox = new System.Windows.Forms.ComboBox();
            this.productQuantityComboBox = new System.Windows.Forms.ComboBox();
            this.totalTextBox = new System.Windows.Forms.TextBox();
            this.addButton = new System.Windows.Forms.Button();
            this.availableStockLabel = new System.Windows.Forms.Label();
            this.stockTextBox = new System.Windows.Forms.TextBox();
            this.okButton = new System.Windows.Forms.Button();
            this.printDialog1 = new System.Windows.Forms.PrintDialog();
            this.printDocument1 = new System.Drawing.Printing.PrintDocument();
            this.printPreviewDialog1 = new System.Windows.Forms.PrintPreviewDialog();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Verdana", 18F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.WindowFrame;
            this.label1.Location = new System.Drawing.Point(246, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(174, 29);
            this.label1.TabIndex = 0;
            this.label1.Text = "Invoice Paper";
            // 
            // customerNameLabel
            // 
            this.customerNameLabel.AutoSize = true;
            this.customerNameLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.customerNameLabel.Location = new System.Drawing.Point(80, 79);
            this.customerNameLabel.Name = "customerNameLabel";
            this.customerNameLabel.Size = new System.Drawing.Size(97, 15);
            this.customerNameLabel.TabIndex = 1;
            this.customerNameLabel.Text = "Customer Name";
            // 
            // customerAddressLabel
            // 
            this.customerAddressLabel.AutoSize = true;
            this.customerAddressLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.customerAddressLabel.Location = new System.Drawing.Point(80, 116);
            this.customerAddressLabel.Name = "customerAddressLabel";
            this.customerAddressLabel.Size = new System.Drawing.Size(51, 15);
            this.customerAddressLabel.TabIndex = 2;
            this.customerAddressLabel.Text = "Address";
            // 
            // customerCellLabel
            // 
            this.customerCellLabel.AutoSize = true;
            this.customerCellLabel.Location = new System.Drawing.Point(406, 110);
            this.customerCellLabel.Name = "customerCellLabel";
            this.customerCellLabel.Size = new System.Drawing.Size(51, 13);
            this.customerCellLabel.TabIndex = 3;
            this.customerCellLabel.Text = "Cell (+88)";
            // 
            // customerNameTextBox
            // 
            this.customerNameTextBox.Location = new System.Drawing.Point(180, 76);
            this.customerNameTextBox.Name = "customerNameTextBox";
            this.customerNameTextBox.Size = new System.Drawing.Size(100, 20);
            this.customerNameTextBox.TabIndex = 4;
            // 
            // addressTextBox
            // 
            this.addressTextBox.Location = new System.Drawing.Point(180, 113);
            this.addressTextBox.Name = "addressTextBox";
            this.addressTextBox.Size = new System.Drawing.Size(100, 20);
            this.addressTextBox.TabIndex = 5;
            // 
            // cellTextBox
            // 
            this.cellTextBox.Location = new System.Drawing.Point(505, 107);
            this.cellTextBox.Name = "cellTextBox";
            this.cellTextBox.Size = new System.Drawing.Size(100, 20);
            this.cellTextBox.TabIndex = 6;
            this.cellTextBox.TextChanged += new System.EventHandler(this.cellTextBox_TextChanged);
            // 
            // invoiceNumberLabel
            // 
            this.invoiceNumberLabel.AutoSize = true;
            this.invoiceNumberLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.invoiceNumberLabel.Location = new System.Drawing.Point(406, 77);
            this.invoiceNumberLabel.Name = "invoiceNumberLabel";
            this.invoiceNumberLabel.Size = new System.Drawing.Size(67, 15);
            this.invoiceNumberLabel.TabIndex = 7;
            this.invoiceNumberLabel.Text = "Invoice No.";
            // 
            // dateLabel
            // 
            this.dateLabel.AutoSize = true;
            this.dateLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dateLabel.Location = new System.Drawing.Point(406, 142);
            this.dateLabel.Name = "dateLabel";
            this.dateLabel.Size = new System.Drawing.Size(33, 15);
            this.dateLabel.TabIndex = 8;
            this.dateLabel.Text = "Date";
            // 
            // invoiceNumberTextBox
            // 
            this.invoiceNumberTextBox.Location = new System.Drawing.Point(505, 76);
            this.invoiceNumberTextBox.Name = "invoiceNumberTextBox";
            this.invoiceNumberTextBox.Size = new System.Drawing.Size(100, 20);
            this.invoiceNumberTextBox.TabIndex = 9;
            // 
            // dateTimePicker
            // 
            this.dateTimePicker.CustomFormat = "dd-MM-yyyy";
            this.dateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dateTimePicker.Location = new System.Drawing.Point(505, 138);
            this.dateTimePicker.Name = "dateTimePicker";
            this.dateTimePicker.Size = new System.Drawing.Size(100, 20);
            this.dateTimePicker.TabIndex = 10;
            // 
            // label
            // 
            this.label.AutoSize = true;
            this.label.Location = new System.Drawing.Point(80, 205);
            this.label.Name = "label";
            this.label.Size = new System.Drawing.Size(75, 13);
            this.label.TabIndex = 11;
            this.label.Text = "Product Name";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(80, 258);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(46, 13);
            this.label3.TabIndex = 12;
            this.label3.Text = "Quantity";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(274, 412);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(56, 15);
            this.label4.TabIndex = 13;
            this.label4.Text = "Total   =  ";
            // 
            // dataGridView
            // 
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.name,
            this.quantity,
            this.price});
            this.dataGridView.Location = new System.Drawing.Point(83, 291);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.Size = new System.Drawing.Size(381, 110);
            this.dataGridView.TabIndex = 14;
            // 
            // name
            // 
            this.name.HeaderText = "Product Name";
            this.name.Name = "name";
            this.name.Width = 120;
            // 
            // quantity
            // 
            this.quantity.HeaderText = "Product Quantity";
            this.quantity.Name = "quantity";
            this.quantity.Width = 110;
            // 
            // price
            // 
            this.price.HeaderText = "Price";
            this.price.Name = "price";
            this.price.Width = 110;
            // 
            // productNameComboBox
            // 
            this.productNameComboBox.FormattingEnabled = true;
            this.productNameComboBox.Location = new System.Drawing.Point(161, 202);
            this.productNameComboBox.Name = "productNameComboBox";
            this.productNameComboBox.Size = new System.Drawing.Size(119, 21);
            this.productNameComboBox.TabIndex = 15;
            this.productNameComboBox.SelectedIndexChanged += new System.EventHandler(this.productNameComboBox_SelectedIndexChanged);
            // 
            // productQuantityComboBox
            // 
            this.productQuantityComboBox.FormattingEnabled = true;
            this.productQuantityComboBox.Items.AddRange(new object[] {
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10"});
            this.productQuantityComboBox.Location = new System.Drawing.Point(161, 255);
            this.productQuantityComboBox.Name = "productQuantityComboBox";
            this.productQuantityComboBox.Size = new System.Drawing.Size(119, 21);
            this.productQuantityComboBox.TabIndex = 16;
            // 
            // totalTextBox
            // 
            this.totalTextBox.Location = new System.Drawing.Point(336, 408);
            this.totalTextBox.Name = "totalTextBox";
            this.totalTextBox.Size = new System.Drawing.Size(103, 20);
            this.totalTextBox.TabIndex = 17;
            // 
            // addButton
            // 
            this.addButton.Location = new System.Drawing.Point(336, 248);
            this.addButton.Name = "addButton";
            this.addButton.Size = new System.Drawing.Size(128, 32);
            this.addButton.TabIndex = 18;
            this.addButton.Text = "Add Item";
            this.addButton.UseVisualStyleBackColor = true;
            this.addButton.Click += new System.EventHandler(this.addButton_Click);
            // 
            // availableStockLabel
            // 
            this.availableStockLabel.AutoSize = true;
            this.availableStockLabel.Location = new System.Drawing.Point(305, 205);
            this.availableStockLabel.Name = "availableStockLabel";
            this.availableStockLabel.Size = new System.Drawing.Size(53, 26);
            this.availableStockLabel.TabIndex = 20;
            this.availableStockLabel.Text = "Available \r\n Stock";
            // 
            // stockTextBox
            // 
            this.stockTextBox.Location = new System.Drawing.Point(374, 202);
            this.stockTextBox.Name = "stockTextBox";
            this.stockTextBox.Size = new System.Drawing.Size(90, 20);
            this.stockTextBox.TabIndex = 21;
            // 
            // okButton
            // 
            this.okButton.Location = new System.Drawing.Point(545, 280);
            this.okButton.Name = "okButton";
            this.okButton.Size = new System.Drawing.Size(105, 44);
            this.okButton.TabIndex = 22;
            this.okButton.Text = "Save && Print ";
            this.okButton.UseVisualStyleBackColor = true;
            this.okButton.Click += new System.EventHandler(this.okButton_Click);
            // 
            // printDialog1
            // 
            this.printDialog1.UseEXDialog = true;
            // 
            // printDocument1
            // 
            this.printDocument1.PrintPage += new System.Drawing.Printing.PrintPageEventHandler(this.printDocument1_PrintPage);
            // 
            // printPreviewDialog1
            // 
            this.printPreviewDialog1.AutoScrollMargin = new System.Drawing.Size(0, 0);
            this.printPreviewDialog1.AutoScrollMinSize = new System.Drawing.Size(0, 0);
            this.printPreviewDialog1.ClientSize = new System.Drawing.Size(400, 300);
            this.printPreviewDialog1.Enabled = true;
            this.printPreviewDialog1.Icon = ((System.Drawing.Icon)(resources.GetObject("printPreviewDialog1.Icon")));
            this.printPreviewDialog1.Name = "printPreviewDialog1";
            this.printPreviewDialog1.Visible = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(442, 412);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(33, 13);
            this.label2.TabIndex = 23;
            this.label2.Text = "( TK )";
            // 
            // productSellForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(704, 461);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.okButton);
            this.Controls.Add(this.stockTextBox);
            this.Controls.Add(this.availableStockLabel);
            this.Controls.Add(this.addButton);
            this.Controls.Add(this.totalTextBox);
            this.Controls.Add(this.productQuantityComboBox);
            this.Controls.Add(this.productNameComboBox);
            this.Controls.Add(this.dataGridView);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label);
            this.Controls.Add(this.dateTimePicker);
            this.Controls.Add(this.invoiceNumberTextBox);
            this.Controls.Add(this.dateLabel);
            this.Controls.Add(this.invoiceNumberLabel);
            this.Controls.Add(this.cellTextBox);
            this.Controls.Add(this.addressTextBox);
            this.Controls.Add(this.customerNameTextBox);
            this.Controls.Add(this.customerCellLabel);
            this.Controls.Add(this.customerAddressLabel);
            this.Controls.Add(this.customerNameLabel);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "productSellForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Invoice";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label customerNameLabel;
        private System.Windows.Forms.Label customerAddressLabel;
        private System.Windows.Forms.Label customerCellLabel;
        private System.Windows.Forms.TextBox customerNameTextBox;
        private System.Windows.Forms.TextBox addressTextBox;
        private System.Windows.Forms.TextBox cellTextBox;
        private System.Windows.Forms.Label invoiceNumberLabel;
        private System.Windows.Forms.Label dateLabel;
        private System.Windows.Forms.TextBox invoiceNumberTextBox;
        private System.Windows.Forms.DateTimePicker dateTimePicker;
        private System.Windows.Forms.Label label;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.ComboBox productNameComboBox;
        private System.Windows.Forms.ComboBox productQuantityComboBox;
        private System.Windows.Forms.TextBox totalTextBox;
        private System.Windows.Forms.Button addButton;
        private System.Windows.Forms.Label availableStockLabel;
        private System.Windows.Forms.TextBox stockTextBox;
        private System.Windows.Forms.DataGridViewTextBoxColumn name;
        private System.Windows.Forms.DataGridViewTextBoxColumn quantity;
        private System.Windows.Forms.DataGridViewTextBoxColumn price;
        private System.Windows.Forms.Button okButton;
        private System.Windows.Forms.PrintDialog printDialog1;
        private System.Drawing.Printing.PrintDocument printDocument1;
        private System.Windows.Forms.PrintPreviewDialog printPreviewDialog1;
        private System.Windows.Forms.Label label2;
    }
}