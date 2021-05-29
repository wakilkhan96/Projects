namespace Student_Attendance_System__Voice_Engine_
{
    partial class takeAttendanceForm
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(takeAttendanceForm));
            this.backPanel = new System.Windows.Forms.Panel();
            this.schemaIDTextBox = new System.Windows.Forms.TextBox();
            this.schemaIDLabel = new System.Windows.Forms.Label();
            this.submitButton = new System.Windows.Forms.Button();
            this.startButton = new System.Windows.Forms.Button();
            this.modeLabel = new System.Windows.Forms.Label();
            this.automaticRadioButton = new System.Windows.Forms.RadioButton();
            this.manualRadioButton = new System.Windows.Forms.RadioButton();
            this.dateTextBox = new System.Windows.Forms.TextBox();
            this.dateLabel = new System.Windows.Forms.Label();
            this.lectureTextBox = new System.Windows.Forms.TextBox();
            this.lectureLabel = new System.Windows.Forms.Label();
            this.frontPanel = new System.Windows.Forms.Panel();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.Course_Column = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Semester_Column = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.departmentTextBox = new System.Windows.Forms.TextBox();
            this.semesterTextBox = new System.Windows.Forms.TextBox();
            this.courseCodeTextBox = new System.Windows.Forms.TextBox();
            this.courseCodeLabel = new System.Windows.Forms.Label();
            this.semesterLabel = new System.Windows.Forms.Label();
            this.deptLabel = new System.Windows.Forms.Label();
            this.backPanel.SuspendLayout();
            this.frontPanel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // backPanel
            // 
            this.backPanel.Controls.Add(this.schemaIDTextBox);
            this.backPanel.Controls.Add(this.schemaIDLabel);
            this.backPanel.Controls.Add(this.submitButton);
            this.backPanel.Controls.Add(this.startButton);
            this.backPanel.Controls.Add(this.modeLabel);
            this.backPanel.Controls.Add(this.automaticRadioButton);
            this.backPanel.Controls.Add(this.manualRadioButton);
            this.backPanel.Controls.Add(this.dateTextBox);
            this.backPanel.Controls.Add(this.dateLabel);
            this.backPanel.Controls.Add(this.lectureTextBox);
            this.backPanel.Controls.Add(this.lectureLabel);
            this.backPanel.Controls.Add(this.frontPanel);
            this.backPanel.Controls.Add(this.departmentTextBox);
            this.backPanel.Controls.Add(this.semesterTextBox);
            this.backPanel.Controls.Add(this.courseCodeTextBox);
            this.backPanel.Controls.Add(this.courseCodeLabel);
            this.backPanel.Controls.Add(this.semesterLabel);
            this.backPanel.Controls.Add(this.deptLabel);
            this.backPanel.Location = new System.Drawing.Point(12, 12);
            this.backPanel.Name = "backPanel";
            this.backPanel.Size = new System.Drawing.Size(780, 402);
            this.backPanel.TabIndex = 0;
            // 
            // schemaIDTextBox
            // 
            this.schemaIDTextBox.Location = new System.Drawing.Point(147, 42);
            this.schemaIDTextBox.Name = "schemaIDTextBox";
            this.schemaIDTextBox.ReadOnly = true;
            this.schemaIDTextBox.Size = new System.Drawing.Size(141, 20);
            this.schemaIDTextBox.TabIndex = 25;
            // 
            // schemaIDLabel
            // 
            this.schemaIDLabel.AutoSize = true;
            this.schemaIDLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.schemaIDLabel.Location = new System.Drawing.Point(54, 43);
            this.schemaIDLabel.Name = "schemaIDLabel";
            this.schemaIDLabel.Size = new System.Drawing.Size(74, 16);
            this.schemaIDLabel.TabIndex = 24;
            this.schemaIDLabel.Text = "Schema ID";
            // 
            // submitButton
            // 
            this.submitButton.BackColor = System.Drawing.Color.Silver;
            this.submitButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.submitButton.Location = new System.Drawing.Point(626, 351);
            this.submitButton.Name = "submitButton";
            this.submitButton.Size = new System.Drawing.Size(100, 29);
            this.submitButton.TabIndex = 23;
            this.submitButton.Text = "Submit";
            this.submitButton.UseVisualStyleBackColor = false;
            this.submitButton.Click += new System.EventHandler(this.submitButton_Click);
            // 
            // startButton
            // 
            this.startButton.BackColor = System.Drawing.Color.Silver;
            this.startButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.startButton.Location = new System.Drawing.Point(126, 351);
            this.startButton.Name = "startButton";
            this.startButton.Size = new System.Drawing.Size(153, 29);
            this.startButton.TabIndex = 22;
            this.startButton.Text = "Start Voice Attendance";
            this.startButton.UseVisualStyleBackColor = false;
            this.startButton.Visible = false;
            this.startButton.Click += new System.EventHandler(this.startButton_Click);
            // 
            // modeLabel
            // 
            this.modeLabel.AutoSize = true;
            this.modeLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.modeLabel.Location = new System.Drawing.Point(54, 299);
            this.modeLabel.Name = "modeLabel";
            this.modeLabel.Size = new System.Drawing.Size(43, 16);
            this.modeLabel.TabIndex = 21;
            this.modeLabel.Text = "Mode";
            // 
            // automaticRadioButton
            // 
            this.automaticRadioButton.AutoSize = true;
            this.automaticRadioButton.Location = new System.Drawing.Point(207, 299);
            this.automaticRadioButton.Name = "automaticRadioButton";
            this.automaticRadioButton.Size = new System.Drawing.Size(72, 17);
            this.automaticRadioButton.TabIndex = 20;
            this.automaticRadioButton.Text = "Automatic";
            this.automaticRadioButton.UseVisualStyleBackColor = true;
            this.automaticRadioButton.CheckedChanged += new System.EventHandler(this.automaticRadioButton_CheckedChanged);
            // 
            // manualRadioButton
            // 
            this.manualRadioButton.AutoSize = true;
            this.manualRadioButton.Checked = true;
            this.manualRadioButton.Location = new System.Drawing.Point(147, 299);
            this.manualRadioButton.Name = "manualRadioButton";
            this.manualRadioButton.Size = new System.Drawing.Size(60, 17);
            this.manualRadioButton.TabIndex = 19;
            this.manualRadioButton.TabStop = true;
            this.manualRadioButton.Text = "Manual";
            this.manualRadioButton.UseVisualStyleBackColor = true;
            this.manualRadioButton.CheckedChanged += new System.EventHandler(this.manualRadioButton_CheckedChanged);
            // 
            // dateTextBox
            // 
            this.dateTextBox.Location = new System.Drawing.Point(147, 247);
            this.dateTextBox.Name = "dateTextBox";
            this.dateTextBox.Size = new System.Drawing.Size(141, 20);
            this.dateTextBox.TabIndex = 18;
            // 
            // dateLabel
            // 
            this.dateLabel.AutoSize = true;
            this.dateLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dateLabel.Location = new System.Drawing.Point(54, 248);
            this.dateLabel.Name = "dateLabel";
            this.dateLabel.Size = new System.Drawing.Size(37, 16);
            this.dateLabel.TabIndex = 17;
            this.dateLabel.Text = "Date";
            // 
            // lectureTextBox
            // 
            this.lectureTextBox.Location = new System.Drawing.Point(147, 207);
            this.lectureTextBox.Name = "lectureTextBox";
            this.lectureTextBox.ReadOnly = true;
            this.lectureTextBox.Size = new System.Drawing.Size(141, 20);
            this.lectureTextBox.TabIndex = 16;
            // 
            // lectureLabel
            // 
            this.lectureLabel.AutoSize = true;
            this.lectureLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lectureLabel.Location = new System.Drawing.Point(54, 208);
            this.lectureLabel.Name = "lectureLabel";
            this.lectureLabel.Size = new System.Drawing.Size(52, 16);
            this.lectureLabel.TabIndex = 15;
            this.lectureLabel.Text = "Lecture";
            // 
            // frontPanel
            // 
            this.frontPanel.AutoScrollMargin = new System.Drawing.Size(0, 50);
            this.frontPanel.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.frontPanel.Controls.Add(this.dataGridView);
            this.frontPanel.Location = new System.Drawing.Point(337, 38);
            this.frontPanel.Name = "frontPanel";
            this.frontPanel.Size = new System.Drawing.Size(389, 298);
            this.frontPanel.TabIndex = 14;
            // 
            // dataGridView
            // 
            this.dataGridView.AllowUserToAddRows = false;
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
            this.Course_Column,
            this.Semester_Column});
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.Gainsboro;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.OldLace;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dataGridView.DefaultCellStyle = dataGridViewCellStyle3;
            this.dataGridView.EnableHeadersVisualStyles = false;
            this.dataGridView.Location = new System.Drawing.Point(3, 4);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.ReadOnly = true;
            this.dataGridView.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.dataGridView.RowHeadersVisible = false;
            this.dataGridView.RowHeadersWidth = 10;
            this.dataGridView.RowTemplate.DefaultCellStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dataGridView.RowTemplate.Height = 50;
            this.dataGridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView.Size = new System.Drawing.Size(378, 289);
            this.dataGridView.TabIndex = 5;
            this.dataGridView.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellClick);
            // 
            // Course_Column
            // 
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Course_Column.DefaultCellStyle = dataGridViewCellStyle2;
            this.Course_Column.HeaderText = "Student ID";
            this.Course_Column.Name = "Course_Column";
            this.Course_Column.ReadOnly = true;
            this.Course_Column.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Course_Column.Width = 202;
            // 
            // Semester_Column
            // 
            this.Semester_Column.HeaderText = "Present/Absent";
            this.Semester_Column.Name = "Semester_Column";
            this.Semester_Column.ReadOnly = true;
            this.Semester_Column.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Semester_Column.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.Semester_Column.Width = 155;
            // 
            // departmentTextBox
            // 
            this.departmentTextBox.Location = new System.Drawing.Point(147, 83);
            this.departmentTextBox.Name = "departmentTextBox";
            this.departmentTextBox.ReadOnly = true;
            this.departmentTextBox.Size = new System.Drawing.Size(141, 20);
            this.departmentTextBox.TabIndex = 13;
            // 
            // semesterTextBox
            // 
            this.semesterTextBox.Location = new System.Drawing.Point(147, 124);
            this.semesterTextBox.Name = "semesterTextBox";
            this.semesterTextBox.ReadOnly = true;
            this.semesterTextBox.Size = new System.Drawing.Size(141, 20);
            this.semesterTextBox.TabIndex = 12;
            // 
            // courseCodeTextBox
            // 
            this.courseCodeTextBox.Location = new System.Drawing.Point(147, 166);
            this.courseCodeTextBox.Name = "courseCodeTextBox";
            this.courseCodeTextBox.ReadOnly = true;
            this.courseCodeTextBox.Size = new System.Drawing.Size(141, 20);
            this.courseCodeTextBox.TabIndex = 11;
            // 
            // courseCodeLabel
            // 
            this.courseCodeLabel.AutoSize = true;
            this.courseCodeLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.courseCodeLabel.Location = new System.Drawing.Point(54, 167);
            this.courseCodeLabel.Name = "courseCodeLabel";
            this.courseCodeLabel.Size = new System.Drawing.Size(87, 16);
            this.courseCodeLabel.TabIndex = 10;
            this.courseCodeLabel.Text = "Course Code";
            // 
            // semesterLabel
            // 
            this.semesterLabel.AutoSize = true;
            this.semesterLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.semesterLabel.Location = new System.Drawing.Point(54, 125);
            this.semesterLabel.Name = "semesterLabel";
            this.semesterLabel.Size = new System.Drawing.Size(66, 16);
            this.semesterLabel.TabIndex = 8;
            this.semesterLabel.Text = "Semester";
            // 
            // deptLabel
            // 
            this.deptLabel.AutoSize = true;
            this.deptLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deptLabel.Location = new System.Drawing.Point(54, 84);
            this.deptLabel.Name = "deptLabel";
            this.deptLabel.Size = new System.Drawing.Size(78, 16);
            this.deptLabel.TabIndex = 6;
            this.deptLabel.Text = "Department";
            // 
            // takeAttendanceForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(804, 426);
            this.Controls.Add(this.backPanel);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "takeAttendanceForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "takeAttendanceForm";
            this.backPanel.ResumeLayout(false);
            this.backPanel.PerformLayout();
            this.frontPanel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel backPanel;
        private System.Windows.Forms.TextBox departmentTextBox;
        private System.Windows.Forms.TextBox semesterTextBox;
        private System.Windows.Forms.TextBox courseCodeTextBox;
        private System.Windows.Forms.Label courseCodeLabel;
        private System.Windows.Forms.Label semesterLabel;
        private System.Windows.Forms.Label deptLabel;
        private System.Windows.Forms.Panel frontPanel;
        private System.Windows.Forms.TextBox dateTextBox;
        private System.Windows.Forms.Label dateLabel;
        private System.Windows.Forms.TextBox lectureTextBox;
        private System.Windows.Forms.Label lectureLabel;
        private System.Windows.Forms.Button startButton;
        private System.Windows.Forms.Label modeLabel;
        private System.Windows.Forms.RadioButton automaticRadioButton;
        private System.Windows.Forms.RadioButton manualRadioButton;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.Button submitButton;
        private System.Windows.Forms.TextBox schemaIDTextBox;
        private System.Windows.Forms.Label schemaIDLabel;
        private System.Windows.Forms.DataGridViewTextBoxColumn Course_Column;
        private System.Windows.Forms.DataGridViewCheckBoxColumn Semester_Column;
    }
}