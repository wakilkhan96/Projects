package automobile;

import java.awt.Color;
import java.awt.Font;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;
import javax.swing.*;


public class serviceAutomobileForm extends JFrame
{
    
    
    //username tracker
    String _user;
    //
    
    
    
    JLabel topLabel,tagLabel,daagLabel,brandLabel,modelLabel,engineLabel,chassisLabel;
    JTextField brandTextField,modelTextField,engineTextField,chassisTextField;
    JScrollPane ScrollPane,lowerScrollPane;
    JTable table,lowerTable;
    JButton addButton;
    
    
    ArrayList <String> container = new ArrayList <>();
    long total = 0;
    
    
    
    serviceAutomobileForm(String ss)
    {
        
        
        ///user track
        _user=ss;
        
        
        
        this.setSize(720,500);
        this.setLayout(null);
        this.setResizable(false);
        this.setTitle("Automobile Store and Service Centre");
        
        //top label
        topLabel = new JLabel("Automobile Service Centre");
        topLabel.setBounds(250, 8, 500, 30);
        Font font = new Font("Serif", Font.BOLD, 25);
        topLabel.setFont(font);
        topLabel.setForeground(new Color(120, 120, 110));
        
        
        
        //table work
        ScrollPane = new javax.swing.JScrollPane();
        table = new javax.swing.JTable();
        
        table.setModel(new javax.swing.table.DefaultTableModel(
                new Object [][] 
                {
                    
                },
                new String [] 
                {
                    "Client Name","Service ID", "Brand", "Model", "Engine", "Chassis"
                }
        ));
        
        ScrollPane.setViewportView(table);
        
        ScrollPane.setBounds(50,70,615,100);
        //table work
        
        
        
        
        
        //lower table work
        lowerScrollPane = new javax.swing.JScrollPane();
        lowerTable = new javax.swing.JTable();
        
        lowerTable.setModel(new javax.swing.table.DefaultTableModel(
                new Object [][] 
                {
                    
                },
                new String [] 
                {
                    "Service  Type ", "Cost"
                }
        ));
        
        lowerScrollPane.setViewportView(lowerTable);
        
        lowerScrollPane.setBounds(320,300,220,100);
        //table work
        
        
        //combo box
        JComboBox servicesComboBox = new JComboBox();
        servicesComboBox.setBounds(320, 260, 155, 22);
        servicesComboBox.addItem("");
        servicesComboBox.addItem("Engine Repair");
        servicesComboBox.addItem("Chassis Repair");
        servicesComboBox.addItem("Gearbox Repair");
        servicesComboBox.addItem("Body Repair");
        servicesComboBox.addItem("Tyre Repair");
        
        //add button beside combo box
        JButton addButton = new JButton("Add");
        addButton.setBounds(480, 260, 60, 22);
        
        
        
        
        
        
        
        
        
        //add button er kaj 
        addButton.addActionListener( (ActionEvent e)->
        {
            
            if( container.contains( servicesComboBox.getSelectedItem().toString() ) )
                JOptionPane.showMessageDialog(null, "Already in Service list");
            
            else
            {
                container.add( servicesComboBox.getSelectedItem().toString() );
                
                
                
            }
            
            
            
            
        });
        
        
        
        
        
        //back button
        JButton backButton = new JButton("Back");
        backButton.setBounds(0, 5, 90, 25);
        
        backButton.addActionListener((ActionEvent e) -> 
        { 
            
            clientMenuForm ob = new clientMenuForm(_user);
            ob.setVisible(true);
            this.dispose();
        });
        
        
        
        
        
        
        
        
        
        
        tagLabel = new JLabel("( your cars under maintenance )");
        tagLabel.setBounds(270,170,200,30);
        font = new Font("Verdana", Font.PLAIN, 11);
        tagLabel.setFont(font);
        
        //daag
        daagLabel = new JLabel();
        daagLabel.setBounds(20,200,1000,10);
        daagLabel.setText("------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
        
        
        
        
        brandLabel = new JLabel("Car  Brand");
        brandLabel.setBounds(50, 260, 70, 20);
        brandTextField = new JTextField();
        brandTextField.setBounds(130, 260, 130, 22);
        
        modelLabel = new JLabel("Model No.");
        modelLabel.setBounds(50, 300, 70, 20);
        modelTextField = new JTextField();
        modelTextField.setBounds(130, 300, 130, 22);
        
        engineLabel = new JLabel("Engine No.");
        engineLabel.setBounds(50, 340, 70, 20);
        engineTextField = new JTextField();
        engineTextField.setBounds(130, 340, 130, 22);
        
        chassisLabel = new JLabel("Chassis No.");
        chassisLabel.setBounds(50, 380, 70, 20);
        chassisTextField = new JTextField();
        chassisTextField.setBounds(130, 380, 130, 22);
        
        
        
        
        this.add(topLabel);
        this.add(ScrollPane);
        this.add(lowerScrollPane);
        this.add(daagLabel);
        this.add(tagLabel);
        this.add(brandLabel);
        this.add(brandTextField);
        this.add(modelLabel);
        this.add(modelTextField);
        this.add(engineLabel);
        this.add(engineTextField);
        this.add(chassisLabel);
        this.add(chassisTextField);
        this.add(servicesComboBox);
        this.add(addButton);
        this.add(backButton);
        
        
        this.setVisible(true);

        this.setLocationRelativeTo(null);



        this.setDefaultCloseOperation(WindowConstants.HIDE_ON_CLOSE);
        
        
        
    }
    
    
    
    
}
