namespace Student_Attendance_System__Voice_Engine_
{
    partial class mainForm
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(mainForm));
            this.tabControl = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.optionComboBox = new System.Windows.Forms.ComboBox();
            this.okButton = new System.Windows.Forms.Button();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.SchemaID_Column = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Course_Column = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Semester_Column = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Department_Column = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.excelPanel = new System.Windows.Forms.Panel();
            this.fileLabel = new System.Windows.Forms.Label();
            this.importButton = new System.Windows.Forms.Button();
            this.textBox = new System.Windows.Forms.TextBox();
            this.openButton = new System.Windows.Forms.Button();
            this.importRadioButton = new System.Windows.Forms.RadioButton();
            this.schemaIDTextBox = new System.Windows.Forms.TextBox();
            this.schemaIDLabel = new System.Windows.Forms.Label();
            this.innerPanel = new System.Windows.Forms.Panel();
            this.leftCheckBox = new System.Windows.Forms.CheckBox();
            this.leftTextBox = new System.Windows.Forms.TextBox();
            this.toLabel = new System.Windows.Forms.Label();
            this.maxTextBox = new System.Windows.Forms.TextBox();
            this.minTextBox = new System.Windows.Forms.TextBox();
            this.rangeLabel = new System.Windows.Forms.Label();
            this.generateButton = new System.Windows.Forms.Button();
            this.studentIDRichTextBox = new System.Windows.Forms.RichTextBox();
            this.createButton = new System.Windows.Forms.Button();
            this.sIDGenerateLabel = new System.Windows.Forms.Label();
            this.automaticRadioButton = new System.Windows.Forms.RadioButton();
            this.manualRadioButton = new System.Windows.Forms.RadioButton();
            this.agreeCheckBox = new System.Windows.Forms.CheckBox();
            this.courseCodeComboBox = new System.Windows.Forms.ComboBox();
            this.courseCodeLabel = new System.Windows.Forms.Label();
            this.semesterComboBox = new System.Windows.Forms.ComboBox();
            this.semesterLabel = new System.Windows.Forms.Label();
            this.departmentComboBox = new System.Windows.Forms.ComboBox();
            this.deptLabel = new System.Windows.Forms.Label();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.agreeCheckBox2 = new System.Windows.Forms.CheckBox();
            this.agreeCheckBox1 = new System.Windows.Forms.CheckBox();
            this.exportCourseCodeTextBox = new System.Windows.Forms.TextBox();
            this.exportSemesterTextBox = new System.Windows.Forms.TextBox();
            this.exportDepartmentTextBox = new System.Windows.Forms.TextBox();
            this.exportButton = new System.Windows.Forms.Button();
            this.exportSchemaIDTextBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.panel = new System.Windows.Forms.Panel();
            this.signUpButton = new System.Windows.Forms.Button();
            this.enterButton = new System.Windows.Forms.Button();
            this.passwordTextBox = new System.Windows.Forms.TextBox();
            this.userTextBox = new System.Windows.Forms.TextBox();
            this.loginLabel = new System.Windows.Forms.Label();
            this.passwordLabel = new System.Windows.Forms.Label();
            this.userNameLabel = new System.Windows.Forms.Label();
            this.tabControl.SuspendLayout();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.tabPage2.SuspendLayout();
            this.excelPanel.SuspendLayout();
            this.innerPanel.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.panel.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl
            // 
            this.tabControl.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.tabControl.Controls.Add(this.tabPage1);
            this.tabControl.Controls.Add(this.tabPage2);
            this.tabControl.Controls.Add(this.tabPage3);
            this.tabControl.Controls.Add(this.tabPage4);
            this.tabControl.ItemSize = new System.Drawing.Size(60, 30);
            this.tabControl.Location = new System.Drawing.Point(12, 51);
            this.tabControl.Multiline = true;
            this.tabControl.Name = "tabControl";
            this.tabControl.Padding = new System.Drawing.Point(40, 3);
            this.tabControl.SelectedIndex = 0;
            this.tabControl.Size = new System.Drawing.Size(800, 353);
            this.tabControl.TabIndex = 1;
            this.tabControl.SelectedIndexChanged += new System.EventHandler(this.tabControl_SelectedIndexChanged);
            // 
            // tabPage1
            // 
            this.tabPage1.AutoScrollMargin = new System.Drawing.Size(0, 100);
            this.tabPage1.BackColor = System.Drawing.Color.Gainsboro;
            this.tabPage1.Controls.Add(this.optionComboBox);
            this.tabPage1.Controls.Add(this.okButton);
            this.tabPage1.Controls.Add(this.dataGridView);
            this.tabPage1.Location = new System.Drawing.Point(4, 34);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Size = new System.Drawing.Size(792, 315);
            this.tabPage1.TabIndex = 4;
            this.tabPage1.Text = "Attendance Schema";
            // 
            // optionComboBox
            // 
            this.optionComboBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.optionComboBox.FormattingEnabled = true;
            this.optionComboBox.Items.AddRange(new object[] {
            "Take New Attendance",
            "View Attendance Data",
            "Export Attendance Data"});
            this.optionComboBox.Location = new System.Drawing.Point(601, 136);
            this.optionComboBox.Name = "optionComboBox";
            this.optionComboBox.Size = new System.Drawing.Size(158, 24);
            this.optionComboBox.TabIndex = 5;
            this.optionComboBox.Text = "    Select an Option";
            // 
            // okButton
            // 
            this.okButton.Location = new System.Drawing.Point(638, 178);
            this.okButton.Name = "okButton";
            this.okButton.Size = new System.Drawing.Size(75, 28);
            this.okButton.TabIndex = 4;
            this.okButton.Text = "OK";
            this.okButton.UseVisualStyleBackColor = true;
            this.okButton.Click += new System.EventHandler(this.okButton_Click);
            // 
            // dataGridView
            // 
            this.dataGridView.BackgroundColor = System.Drawing.Color.Gainsboro;
            this.dataGridView.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dataGridView.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Single;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.DarkGray;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dataGridView.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dataGridView.ColumnHeadersHeight = 50;
            this.dataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.SchemaID_Column,
            this.Course_Column,
            this.Semester_Column,
            this.Department_Column});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.Gainsboro;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.OldLace;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dataGridView.DefaultCellStyle = dataGridViewCellStyle2;
            this.dataGridView.EnableHeadersVisualStyles = false;
            this.dataGridView.Location = new System.Drawing.Point(24, 27);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.ReadOnly = true;
            this.dataGridView.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.dataGridView.RowHeadersVisible = false;
            this.dataGridView.RowHeadersWidth = 10;
            this.dataGridView.RowTemplate.DefaultCellStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dataGridView.RowTemplate.Height = 50;
            this.dataGridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView.Size = new System.Drawing.Size(557, 258);
            this.dataGridView.TabIndex = 2;
            this.dataGridView.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellClick);
            // 
            // SchemaID_Column
            // 
            this.SchemaID_Column.HeaderText = "Schema ID";
            this.SchemaID_Column.Name = "SchemaID_Column";
            this.SchemaID_Column.ReadOnly = true;
            this.SchemaID_Column.Width = 120;
            // 
            // Course_Column
            // 
            this.Course_Column.HeaderText = "Course";
            this.Course_Column.Name = "Course_Column";
            this.Course_Column.ReadOnly = true;
            this.Course_Column.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Course_Column.Width = 140;
            // 
            // Semester_Column
            // 
            this.Semester_Column.HeaderText = "Semester";
            this.Semester_Column.Name = "Semester_Column";
            this.Semester_Column.ReadOnly = true;
            this.Semester_Column.Width = 150;
            // 
            // Department_Column
            // 
            this.Department_Column.HeaderText = "Department";
            this.Department_Column.Name = "Department_Column";
            this.Department_Column.ReadOnly = true;
            this.Department_Column.Width = 125;
            // 
            // tabPage2
            // 
            this.tabPage2.AutoScrollMargin = new System.Drawing.Size(0, 100);
            this.tabPage2.BackColor = System.Drawing.Color.Gainsboro;
            this.tabPage2.Controls.Add(this.excelPanel);
            this.tabPage2.Controls.Add(this.importRadioButton);
            this.tabPage2.Controls.Add(this.schemaIDTextBox);
            this.tabPage2.Controls.Add(this.schemaIDLabel);
            this.tabPage2.Controls.Add(this.innerPanel);
            this.tabPage2.Controls.Add(this.studentIDRichTextBox);
            this.tabPage2.Controls.Add(this.createButton);
            this.tabPage2.Controls.Add(this.sIDGenerateLabel);
            this.tabPage2.Controls.Add(this.automaticRadioButton);
            this.tabPage2.Controls.Add(this.manualRadioButton);
            this.tabPage2.Controls.Add(this.agreeCheckBox);
            this.tabPage2.Controls.Add(this.courseCodeComboBox);
            this.tabPage2.Controls.Add(this.courseCodeLabel);
            this.tabPage2.Controls.Add(this.semesterComboBox);
            this.tabPage2.Controls.Add(this.semesterLabel);
            this.tabPage2.Controls.Add(this.departmentComboBox);
            this.tabPage2.Controls.Add(this.deptLabel);
            this.tabPage2.Location = new System.Drawing.Point(4, 34);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Size = new System.Drawing.Size(792, 315);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Create Schema";
            // 
            // excelPanel
            // 
            this.excelPanel.Controls.Add(this.fileLabel);
            this.excelPanel.Controls.Add(this.importButton);
            this.excelPanel.Controls.Add(this.textBox);
            this.excelPanel.Controls.Add(this.openButton);
            this.excelPanel.Location = new System.Drawing.Point(404, 140);
            this.excelPanel.Name = "excelPanel";
            this.excelPanel.Size = new System.Drawing.Size(271, 94);
            this.excelPanel.TabIndex = 16;
            // 
            // fileLabel
            // 
            this.fileLabel.AutoSize = true;
            this.fileLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.fileLabel.Location = new System.Drawing.Point(4, 23);
            this.fileLabel.Name = "fileLabel";
            this.fileLabel.Size = new System.Drawing.Size(30, 16);
            this.fileLabel.TabIndex = 11;
            this.fileLabel.Text = "File";
            // 
            // importButton
            // 
            this.importButton.Location = new System.Drawing.Point(86, 51);
            this.importButton.Name = "importButton";
            this.importButton.Size = new System.Drawing.Size(75, 30);
            this.importButton.TabIndex = 6;
            this.importButton.Text = "Import";
            this.importButton.UseVisualStyleBackColor = true;
            this.importButton.Click += new System.EventHandler(this.importButton_Click);
            // 
            // textBox
            // 
            this.textBox.Location = new System.Drawing.Point(37, 22);
            this.textBox.Name = "textBox";
            this.textBox.Size = new System.Drawing.Size(152, 20);
            this.textBox.TabIndex = 5;
            // 
            // openButton
            // 
            this.openButton.Location = new System.Drawing.Point(196, 20);
            this.openButton.Name = "openButton";
            this.openButton.Size = new System.Drawing.Size(60, 23);
            this.openButton.TabIndex = 4;
            this.openButton.Text = "Open";
            this.openButton.UseVisualStyleBackColor = true;
            this.openButton.Click += new System.EventHandler(this.openButton_Click);
            // 
            // importRadioButton
            // 
            this.importRadioButton.AutoSize = true;
            this.importRadioButton.Location = new System.Drawing.Point(678, 37);
            this.importRadioButton.Name = "importRadioButton";
            this.importRadioButton.Size = new System.Drawing.Size(86, 17);
            this.importRadioButton.TabIndex = 15;
            this.importRadioButton.Text = "Import(Excel)";
            this.importRadioButton.UseVisualStyleBackColor = true;
            this.importRadioButton.CheckedChanged += new System.EventHandler(this.importRadioButton_CheckedChanged);
            // 
            // schemaIDTextBox
            // 
            this.schemaIDTextBox.Location = new System.Drawing.Point(178, 38);
            this.schemaIDTextBox.Name = "schemaIDTextBox";
            this.schemaIDTextBox.ReadOnly = true;
            this.schemaIDTextBox.Size = new System.Drawing.Size(141, 20);
            this.schemaIDTextBox.TabIndex = 14;
            // 
            // schemaIDLabel
            // 
            this.schemaIDLabel.AutoSize = true;
            this.schemaIDLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.schemaIDLabel.Location = new System.Drawing.Point(85, 39);
            this.schemaIDLabel.Name = "schemaIDLabel";
            this.schemaIDLabel.Size = new System.Drawing.Size(74, 16);
            this.schemaIDLabel.TabIndex = 13;
            this.schemaIDLabel.Text = "Schema ID";
            // 
            // innerPanel
            // 
            this.innerPanel.Controls.Add(this.leftCheckBox);
            this.innerPanel.Controls.Add(this.leftTextBox);
            this.innerPanel.Controls.Add(this.toLabel);
            this.innerPanel.Controls.Add(this.maxTextBox);
            this.innerPanel.Controls.Add(this.minTextBox);
            this.innerPanel.Controls.Add(this.rangeLabel);
            this.innerPanel.Controls.Add(this.generateButton);
            this.innerPanel.Location = new System.Drawing.Point(401, 129);
            this.innerPanel.Name = "innerPanel";
            this.innerPanel.Size = new System.Drawing.Size(271, 94);
            this.innerPanel.TabIndex = 10;
            // 
            // leftCheckBox
            // 
            this.leftCheckBox.AutoSize = true;
            this.leftCheckBox.Location = new System.Drawing.Point(16, 40);
            this.leftCheckBox.Name = "leftCheckBox";
            this.leftCheckBox.Size = new System.Drawing.Size(75, 17);
            this.leftCheckBox.TabIndex = 15;
            this.leftCheckBox.Text = "( Left IDs )";
            this.leftCheckBox.UseVisualStyleBackColor = true;
            // 
            // leftTextBox
            // 
            this.leftTextBox.Location = new System.Drawing.Point(94, 37);
            this.leftTextBox.Name = "leftTextBox";
            this.leftTextBox.Size = new System.Drawing.Size(149, 20);
            this.leftTextBox.TabIndex = 14;
            // 
            // toLabel
            // 
            this.toLabel.AutoSize = true;
            this.toLabel.Location = new System.Drawing.Point(147, 8);
            this.toLabel.Name = "toLabel";
            this.toLabel.Size = new System.Drawing.Size(16, 13);
            this.toLabel.TabIndex = 13;
            this.toLabel.Text = "to";
            // 
            // maxTextBox
            // 
            this.maxTextBox.Location = new System.Drawing.Point(168, 5);
            this.maxTextBox.Name = "maxTextBox";
            this.maxTextBox.Size = new System.Drawing.Size(75, 20);
            this.maxTextBox.TabIndex = 12;
            // 
            // minTextBox
            // 
            this.minTextBox.Location = new System.Drawing.Point(64, 5);
            this.minTextBox.Name = "minTextBox";
            this.minTextBox.Size = new System.Drawing.Size(72, 20);
            this.minTextBox.TabIndex = 11;
            // 
            // rangeLabel
            // 
            this.rangeLabel.AutoSize = true;
            this.rangeLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rangeLabel.Location = new System.Drawing.Point(3, 8);
            this.rangeLabel.Name = "rangeLabel";
            this.rangeLabel.Size = new System.Drawing.Size(49, 16);
            this.rangeLabel.TabIndex = 10;
            this.rangeLabel.Text = "Range";
            // 
            // generateButton
            // 
            this.generateButton.BackColor = System.Drawing.Color.Silver;
            this.generateButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.generateButton.Location = new System.Drawing.Point(168, 70);
            this.generateButton.Name = "generateButton";
            this.generateButton.Size = new System.Drawing.Size(75, 23);
            this.generateButton.TabIndex = 1;
            this.generateButton.Text = "Generate";
            this.generateButton.UseVisualStyleBackColor = false;
            this.generateButton.Click += new System.EventHandler(this.generateButton_Click);
            // 
            // studentIDRichTextBox
            // 
            this.studentIDRichTextBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.studentIDRichTextBox.Location = new System.Drawing.Point(401, 80);
            this.studentIDRichTextBox.Name = "studentIDRichTextBox";
            this.studentIDRichTextBox.Size = new System.Drawing.Size(271, 43);
            this.studentIDRichTextBox.TabIndex = 12;
            this.studentIDRichTextBox.Text = "Enter Student IDs seperated by Blank Space or Comma";
            this.studentIDRichTextBox.MouseClick += new System.Windows.Forms.MouseEventHandler(this.sIDRichTextBox_MouseClick);
            // 
            // createButton
            // 
            this.createButton.BackColor = System.Drawing.Color.Silver;
            this.createButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.createButton.Location = new System.Drawing.Point(330, 262);
            this.createButton.Name = "createButton";
            this.createButton.Size = new System.Drawing.Size(94, 36);
            this.createButton.TabIndex = 11;
            this.createButton.Text = "Create";
            this.createButton.UseVisualStyleBackColor = false;
            this.createButton.Click += new System.EventHandler(this.createButton_Click);
            // 
            // sIDGenerateLabel
            // 
            this.sIDGenerateLabel.AutoSize = true;
            this.sIDGenerateLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sIDGenerateLabel.Location = new System.Drawing.Point(398, 37);
            this.sIDGenerateLabel.Name = "sIDGenerateLabel";
            this.sIDGenerateLabel.Size = new System.Drawing.Size(132, 16);
            this.sIDGenerateLabel.TabIndex = 9;
            this.sIDGenerateLabel.Text = "Student ID Generator";
            // 
            // automaticRadioButton
            // 
            this.automaticRadioButton.AutoSize = true;
            this.automaticRadioButton.Location = new System.Drawing.Point(605, 37);
            this.automaticRadioButton.Name = "automaticRadioButton";
            this.automaticRadioButton.Size = new System.Drawing.Size(72, 17);
            this.automaticRadioButton.TabIndex = 8;
            this.automaticRadioButton.Text = "Automatic";
            this.automaticRadioButton.UseVisualStyleBackColor = true;
            this.automaticRadioButton.CheckedChanged += new System.EventHandler(this.automaticRadioButton_CheckedChanged);
            // 
            // manualRadioButton
            // 
            this.manualRadioButton.AutoSize = true;
            this.manualRadioButton.Checked = true;
            this.manualRadioButton.Location = new System.Drawing.Point(545, 37);
            this.manualRadioButton.Name = "manualRadioButton";
            this.manualRadioButton.Size = new System.Drawing.Size(60, 17);
            this.manualRadioButton.TabIndex = 7;
            this.manualRadioButton.TabStop = true;
            this.manualRadioButton.Text = "Manual";
            this.manualRadioButton.UseVisualStyleBackColor = true;
            this.manualRadioButton.CheckedChanged += new System.EventHandler(this.manualRadioButton_CheckedChanged);
            // 
            // agreeCheckBox
            // 
            this.agreeCheckBox.AutoSize = true;
            this.agreeCheckBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.agreeCheckBox.Location = new System.Drawing.Point(84, 246);
            this.agreeCheckBox.Name = "agreeCheckBox";
            this.agreeCheckBox.Size = new System.Drawing.Size(237, 19);
            this.agreeCheckBox.TabIndex = 6;
            this.agreeCheckBox.Text = "   I agree to create attendance schema.";
            this.agreeCheckBox.UseVisualStyleBackColor = true;
            // 
            // courseCodeComboBox
            // 
            this.courseCodeComboBox.FormattingEnabled = true;
            this.courseCodeComboBox.Items.AddRange(new object[] {
            "CSE-1101",
            "CSE-1201",
            "CSE-2101",
            "CSE-2204",
            "CSE-3101",
            "CSE-3201",
            "CSE-3202",
            "CSE-4103",
            "CSE-4204"});
            this.courseCodeComboBox.Location = new System.Drawing.Point(178, 186);
            this.courseCodeComboBox.Name = "courseCodeComboBox";
            this.courseCodeComboBox.Size = new System.Drawing.Size(141, 21);
            this.courseCodeComboBox.TabIndex = 5;
            this.courseCodeComboBox.Text = "    Select Course Code";
            // 
            // courseCodeLabel
            // 
            this.courseCodeLabel.AutoSize = true;
            this.courseCodeLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.courseCodeLabel.Location = new System.Drawing.Point(85, 188);
            this.courseCodeLabel.Name = "courseCodeLabel";
            this.courseCodeLabel.Size = new System.Drawing.Size(87, 16);
            this.courseCodeLabel.TabIndex = 4;
            this.courseCodeLabel.Text = "Course Code";
            // 
            // semesterComboBox
            // 
            this.semesterComboBox.FormattingEnabled = true;
            this.semesterComboBox.Items.AddRange(new object[] {
            "1st Year - 1st Semester",
            "1st Year - 2nd Semester",
            "2nd Year - 1st Semester",
            "2nd Year - 2nd Semester",
            "3rd Year - 1st Semester",
            "3rd Year - 2nd Semester",
            "4th Year - 1st Semester",
            "4th Year - 2nd Semester"});
            this.semesterComboBox.Location = new System.Drawing.Point(178, 138);
            this.semesterComboBox.Name = "semesterComboBox";
            this.semesterComboBox.Size = new System.Drawing.Size(141, 21);
            this.semesterComboBox.TabIndex = 3;
            this.semesterComboBox.Text = "    Select Here";
            // 
            // semesterLabel
            // 
            this.semesterLabel.AutoSize = true;
            this.semesterLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.semesterLabel.Location = new System.Drawing.Point(85, 140);
            this.semesterLabel.Name = "semesterLabel";
            this.semesterLabel.Size = new System.Drawing.Size(66, 16);
            this.semesterLabel.TabIndex = 2;
            this.semesterLabel.Text = "Semester";
            // 
            // departmentComboBox
            // 
            this.departmentComboBox.FormattingEnabled = true;
            this.departmentComboBox.Items.AddRange(new object[] {
            "CSE",
            "EEE"});
            this.departmentComboBox.Location = new System.Drawing.Point(178, 89);
            this.departmentComboBox.Name = "departmentComboBox";
            this.departmentComboBox.Size = new System.Drawing.Size(141, 21);
            this.departmentComboBox.TabIndex = 1;
            this.departmentComboBox.Text = "    Select Department";
            // 
            // deptLabel
            // 
            this.deptLabel.AutoSize = true;
            this.deptLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deptLabel.Location = new System.Drawing.Point(85, 90);
            this.deptLabel.Name = "deptLabel";
            this.deptLabel.Size = new System.Drawing.Size(78, 16);
            this.deptLabel.TabIndex = 0;
            this.deptLabel.Text = "Department";
            // 
            // tabPage3
            // 
            this.tabPage3.AutoScroll = true;
            this.tabPage3.AutoScrollMargin = new System.Drawing.Size(0, 100);
            this.tabPage3.BackColor = System.Drawing.Color.Gainsboro;
            this.tabPage3.Controls.Add(this.agreeCheckBox2);
            this.tabPage3.Controls.Add(this.agreeCheckBox1);
            this.tabPage3.Controls.Add(this.exportCourseCodeTextBox);
            this.tabPage3.Controls.Add(this.exportSemesterTextBox);
            this.tabPage3.Controls.Add(this.exportDepartmentTextBox);
            this.tabPage3.Controls.Add(this.exportButton);
            this.tabPage3.Controls.Add(this.exportSchemaIDTextBox);
            this.tabPage3.Controls.Add(this.label1);
            this.tabPage3.Controls.Add(this.label2);
            this.tabPage3.Controls.Add(this.label3);
            this.tabPage3.Controls.Add(this.label4);
            this.tabPage3.Location = new System.Drawing.Point(4, 34);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Size = new System.Drawing.Size(792, 315);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Export Attendance Data";
            // 
            // agreeCheckBox2
            // 
            this.agreeCheckBox2.AutoSize = true;
            this.agreeCheckBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.agreeCheckBox2.Location = new System.Drawing.Point(447, 134);
            this.agreeCheckBox2.Name = "agreeCheckBox2";
            this.agreeCheckBox2.Size = new System.Drawing.Size(230, 19);
            this.agreeCheckBox2.TabIndex = 28;
            this.agreeCheckBox2.Text = "   I agree to export as Excel(.xlsx) File.";
            this.agreeCheckBox2.UseVisualStyleBackColor = true;
            // 
            // agreeCheckBox1
            // 
            this.agreeCheckBox1.AutoSize = true;
            this.agreeCheckBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.agreeCheckBox1.Location = new System.Drawing.Point(447, 93);
            this.agreeCheckBox1.Name = "agreeCheckBox1";
            this.agreeCheckBox1.Size = new System.Drawing.Size(217, 19);
            this.agreeCheckBox1.TabIndex = 27;
            this.agreeCheckBox1.Text = "   I agree to export attendance data.";
            this.agreeCheckBox1.UseVisualStyleBackColor = true;
            // 
            // exportCourseCodeTextBox
            // 
            this.exportCourseCodeTextBox.Location = new System.Drawing.Point(198, 229);
            this.exportCourseCodeTextBox.Name = "exportCourseCodeTextBox";
            this.exportCourseCodeTextBox.ReadOnly = true;
            this.exportCourseCodeTextBox.Size = new System.Drawing.Size(141, 20);
            this.exportCourseCodeTextBox.TabIndex = 26;
            // 
            // exportSemesterTextBox
            // 
            this.exportSemesterTextBox.Location = new System.Drawing.Point(198, 181);
            this.exportSemesterTextBox.Name = "exportSemesterTextBox";
            this.exportSemesterTextBox.ReadOnly = true;
            this.exportSemesterTextBox.Size = new System.Drawing.Size(141, 20);
            this.exportSemesterTextBox.TabIndex = 25;
            // 
            // exportDepartmentTextBox
            // 
            this.exportDepartmentTextBox.Location = new System.Drawing.Point(198, 135);
            this.exportDepartmentTextBox.Name = "exportDepartmentTextBox";
            this.exportDepartmentTextBox.ReadOnly = true;
            this.exportDepartmentTextBox.Size = new System.Drawing.Size(141, 20);
            this.exportDepartmentTextBox.TabIndex = 24;
            // 
            // exportButton
            // 
            this.exportButton.Location = new System.Drawing.Point(509, 181);
            this.exportButton.Name = "exportButton";
            this.exportButton.Size = new System.Drawing.Size(106, 28);
            this.exportButton.TabIndex = 23;
            this.exportButton.Text = "Export";
            this.exportButton.UseVisualStyleBackColor = true;
            this.exportButton.Click += new System.EventHandler(this.exportButton_Click);
            // 
            // exportSchemaIDTextBox
            // 
            this.exportSchemaIDTextBox.Location = new System.Drawing.Point(198, 80);
            this.exportSchemaIDTextBox.Name = "exportSchemaIDTextBox";
            this.exportSchemaIDTextBox.ReadOnly = true;
            this.exportSchemaIDTextBox.Size = new System.Drawing.Size(141, 20);
            this.exportSchemaIDTextBox.TabIndex = 22;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(105, 81);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(74, 16);
            this.label1.TabIndex = 21;
            this.label1.Text = "Schema ID";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(105, 230);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(87, 16);
            this.label2.TabIndex = 19;
            this.label2.Text = "Course Code";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(105, 182);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(66, 16);
            this.label3.TabIndex = 17;
            this.label3.Text = "Semester";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(105, 132);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(78, 16);
            this.label4.TabIndex = 15;
            this.label4.Text = "Department";
            // 
            // tabPage4
            // 
            this.tabPage4.AutoScroll = true;
            this.tabPage4.AutoScrollMargin = new System.Drawing.Size(0, 100);
            this.tabPage4.Location = new System.Drawing.Point(4, 34);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Size = new System.Drawing.Size(792, 315);
            this.tabPage4.TabIndex = 3;
            this.tabPage4.Text = "tabPage4";
            this.tabPage4.UseVisualStyleBackColor = true;
            // 
            // panel
            // 
            this.panel.AutoScroll = true;
            this.panel.Controls.Add(this.signUpButton);
            this.panel.Controls.Add(this.enterButton);
            this.panel.Controls.Add(this.passwordTextBox);
            this.panel.Controls.Add(this.userTextBox);
            this.panel.Controls.Add(this.loginLabel);
            this.panel.Controls.Add(this.passwordLabel);
            this.panel.Controls.Add(this.userNameLabel);
            this.panel.Location = new System.Drawing.Point(12, 12);
            this.panel.Name = "panel";
            this.panel.Size = new System.Drawing.Size(796, 417);
            this.panel.TabIndex = 2;
            // 
            // signUpButton
            // 
            this.signUpButton.Location = new System.Drawing.Point(688, 24);
            this.signUpButton.Name = "signUpButton";
            this.signUpButton.Size = new System.Drawing.Size(75, 34);
            this.signUpButton.TabIndex = 15;
            this.signUpButton.Text = "Sign Up";
            this.signUpButton.UseVisualStyleBackColor = true;
            this.signUpButton.Click += new System.EventHandler(this.signUpButton_Click);
            // 
            // enterButton
            // 
            this.enterButton.Location = new System.Drawing.Point(360, 304);
            this.enterButton.Name = "enterButton";
            this.enterButton.Size = new System.Drawing.Size(90, 31);
            this.enterButton.TabIndex = 14;
            this.enterButton.Text = "Enter";
            this.enterButton.UseVisualStyleBackColor = true;
            this.enterButton.Click += new System.EventHandler(this.enterButton_Click);
            // 
            // passwordTextBox
            // 
            this.passwordTextBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.passwordTextBox.Location = new System.Drawing.Point(329, 206);
            this.passwordTextBox.Multiline = true;
            this.passwordTextBox.Name = "passwordTextBox";
            this.passwordTextBox.PasswordChar = '*';
            this.passwordTextBox.Size = new System.Drawing.Size(155, 25);
            this.passwordTextBox.TabIndex = 13;
            // 
            // userTextBox
            // 
            this.userTextBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.userTextBox.Location = new System.Drawing.Point(329, 155);
            this.userTextBox.Multiline = true;
            this.userTextBox.Name = "userTextBox";
            this.userTextBox.Size = new System.Drawing.Size(155, 25);
            this.userTextBox.TabIndex = 12;
            // 
            // loginLabel
            // 
            this.loginLabel.AutoSize = true;
            this.loginLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.loginLabel.Location = new System.Drawing.Point(342, 50);
            this.loginLabel.Name = "loginLabel";
            this.loginLabel.Size = new System.Drawing.Size(126, 20);
            this.loginLabel.TabIndex = 11;
            this.loginLabel.Text = "Account LogIn";
            // 
            // passwordLabel
            // 
            this.passwordLabel.AutoSize = true;
            this.passwordLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.passwordLabel.Location = new System.Drawing.Point(209, 209);
            this.passwordLabel.Name = "passwordLabel";
            this.passwordLabel.Size = new System.Drawing.Size(68, 16);
            this.passwordLabel.TabIndex = 10;
            this.passwordLabel.Text = "Password";
            // 
            // userNameLabel
            // 
            this.userNameLabel.AutoSize = true;
            this.userNameLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.userNameLabel.Location = new System.Drawing.Point(209, 158);
            this.userNameLabel.Name = "userNameLabel";
            this.userNameLabel.Size = new System.Drawing.Size(71, 16);
            this.userNameLabel.TabIndex = 9;
            this.userNameLabel.Text = "Username";
            // 
            // mainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(824, 441);
            this.Controls.Add(this.panel);
            this.Controls.Add(this.tabControl);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "mainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Student Attendance System ( Voice Recognized)";
            this.tabControl.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.excelPanel.ResumeLayout(false);
            this.excelPanel.PerformLayout();
            this.innerPanel.ResumeLayout(false);
            this.innerPanel.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.panel.ResumeLayout(false);
            this.panel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.TabPage tabPage4;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.Panel panel;
        private System.Windows.Forms.Button signUpButton;
        private System.Windows.Forms.Button enterButton;
        private System.Windows.Forms.TextBox passwordTextBox;
        private System.Windows.Forms.TextBox userTextBox;
        private System.Windows.Forms.Label loginLabel;
        private System.Windows.Forms.Label passwordLabel;
        private System.Windows.Forms.Label userNameLabel;
        private System.Windows.Forms.Label sIDGenerateLabel;
        private System.Windows.Forms.RadioButton automaticRadioButton;
        private System.Windows.Forms.RadioButton manualRadioButton;
        private System.Windows.Forms.CheckBox agreeCheckBox;
        private System.Windows.Forms.ComboBox courseCodeComboBox;
        private System.Windows.Forms.Label courseCodeLabel;
        private System.Windows.Forms.ComboBox semesterComboBox;
        private System.Windows.Forms.Label semesterLabel;
        private System.Windows.Forms.ComboBox departmentComboBox;
        private System.Windows.Forms.Label deptLabel;
        private System.Windows.Forms.Panel innerPanel;
        private System.Windows.Forms.CheckBox leftCheckBox;
        private System.Windows.Forms.TextBox leftTextBox;
        private System.Windows.Forms.Label toLabel;
        private System.Windows.Forms.TextBox maxTextBox;
        private System.Windows.Forms.TextBox minTextBox;
        private System.Windows.Forms.Label rangeLabel;
        private System.Windows.Forms.Button generateButton;
        private System.Windows.Forms.Button createButton;
        private System.Windows.Forms.RichTextBox studentIDRichTextBox;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.Button okButton;
        private System.Windows.Forms.ComboBox optionComboBox;
        private System.Windows.Forms.DataGridViewTextBoxColumn SchemaID_Column;
        private System.Windows.Forms.DataGridViewTextBoxColumn Course_Column;
        private System.Windows.Forms.DataGridViewTextBoxColumn Semester_Column;
        private System.Windows.Forms.DataGridViewTextBoxColumn Department_Column;
        private System.Windows.Forms.TextBox schemaIDTextBox;
        private System.Windows.Forms.Label schemaIDLabel;
        private System.Windows.Forms.RadioButton importRadioButton;
        private System.Windows.Forms.Panel excelPanel;
        private System.Windows.Forms.Label fileLabel;
        private System.Windows.Forms.Button importButton;
        private System.Windows.Forms.TextBox textBox;
        private System.Windows.Forms.Button openButton;
        private System.Windows.Forms.Button exportButton;
        private System.Windows.Forms.TextBox exportSchemaIDTextBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox exportCourseCodeTextBox;
        private System.Windows.Forms.TextBox exportSemesterTextBox;
        private System.Windows.Forms.TextBox exportDepartmentTextBox;
        private System.Windows.Forms.CheckBox agreeCheckBox2;
        private System.Windows.Forms.CheckBox agreeCheckBox1;
    }
}

