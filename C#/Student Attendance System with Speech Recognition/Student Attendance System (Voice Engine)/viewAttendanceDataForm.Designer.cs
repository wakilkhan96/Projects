namespace Student_Attendance_System__Voice_Engine_
{
    partial class viewAttendanceDataForm
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(viewAttendanceDataForm));
            this.backPanel = new System.Windows.Forms.Panel();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.StudentID_Column = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TotalLecture_Column = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TotalPresent_Column = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TotalAbsent_Column = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.AttendancePercentage_Column = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.backPanel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // backPanel
            // 
            this.backPanel.BackColor = System.Drawing.Color.Silver;
            this.backPanel.Controls.Add(this.dataGridView);
            this.backPanel.Location = new System.Drawing.Point(24, 44);
            this.backPanel.Name = "backPanel";
            this.backPanel.Size = new System.Drawing.Size(753, 335);
            this.backPanel.TabIndex = 1;
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
            this.StudentID_Column,
            this.TotalLecture_Column,
            this.TotalPresent_Column,
            this.TotalAbsent_Column,
            this.AttendancePercentage_Column});
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle7.BackColor = System.Drawing.Color.Gainsboro;
            dataGridViewCellStyle7.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle7.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle7.SelectionBackColor = System.Drawing.Color.OldLace;
            dataGridViewCellStyle7.SelectionForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle7.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dataGridView.DefaultCellStyle = dataGridViewCellStyle7;
            this.dataGridView.EnableHeadersVisualStyles = false;
            this.dataGridView.Location = new System.Drawing.Point(8, 10);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.dataGridView.RowHeadersVisible = false;
            this.dataGridView.RowHeadersWidth = 10;
            this.dataGridView.RowTemplate.DefaultCellStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dataGridView.RowTemplate.Height = 50;
            this.dataGridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView.Size = new System.Drawing.Size(745, 324);
            this.dataGridView.TabIndex = 5;
            // 
            // StudentID_Column
            // 
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.Silver;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.StudentID_Column.DefaultCellStyle = dataGridViewCellStyle2;
            this.StudentID_Column.HeaderText = "     Student ID";
            this.StudentID_Column.Name = "StudentID_Column";
            this.StudentID_Column.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.StudentID_Column.Width = 150;
            // 
            // TotalLecture_Column
            // 
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.TotalLecture_Column.DefaultCellStyle = dataGridViewCellStyle3;
            this.TotalLecture_Column.HeaderText = "Total Lecture";
            this.TotalLecture_Column.Name = "TotalLecture_Column";
            this.TotalLecture_Column.Width = 124;
            // 
            // TotalPresent_Column
            // 
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.TotalPresent_Column.DefaultCellStyle = dataGridViewCellStyle4;
            this.TotalPresent_Column.HeaderText = "Total Present";
            this.TotalPresent_Column.Name = "TotalPresent_Column";
            this.TotalPresent_Column.Width = 125;
            // 
            // TotalAbsent_Column
            // 
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.TotalAbsent_Column.DefaultCellStyle = dataGridViewCellStyle5;
            this.TotalAbsent_Column.HeaderText = "Total Absent";
            this.TotalAbsent_Column.Name = "TotalAbsent_Column";
            this.TotalAbsent_Column.Width = 120;
            // 
            // AttendancePercentage_Column
            // 
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.AttendancePercentage_Column.DefaultCellStyle = dataGridViewCellStyle6;
            this.AttendancePercentage_Column.HeaderText = "Attendance Percentage";
            this.AttendancePercentage_Column.Name = "AttendancePercentage_Column";
            this.AttendancePercentage_Column.Width = 195;
            // 
            // viewAttendanceDataForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(804, 426);
            this.Controls.Add(this.backPanel);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "viewAttendanceDataForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "viewAttendanceDataForm";
            this.backPanel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel backPanel;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.DataGridViewTextBoxColumn StudentID_Column;
        private System.Windows.Forms.DataGridViewTextBoxColumn TotalLecture_Column;
        private System.Windows.Forms.DataGridViewTextBoxColumn TotalPresent_Column;
        private System.Windows.Forms.DataGridViewTextBoxColumn TotalAbsent_Column;
        private System.Windows.Forms.DataGridViewTextBoxColumn AttendancePercentage_Column;
    }
}