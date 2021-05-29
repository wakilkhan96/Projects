
package automobile;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;



public class serviceStationForm extends JFrame
{
    
    
    //username tracker
    String _user;
    //
    
    
    JLabel topLabel,tagLabel,clientLabel,serviceIDLabel;
    JTextField serviceIDTextField,clientTextField;
    JButton deliverButton;
    JScrollPane ScrollPane;
    JTable table;
    String id,brand,model,engine,chassis,condition,price;
    String _id,_client,_address,_cell,_brand,_model,_engine,_chassis,_cost;
    
    serviceStationForm(String ss)
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
        
       
        
        tagLabel = new JLabel("Cars in Service Centre :");
        tagLabel.setBounds(50, 83, 500, 30);
        
        
        serviceIDLabel = new JLabel("Service ID ");
        serviceIDLabel.setBounds(50,350,120,30);
        serviceIDTextField = new JTextField();
        serviceIDTextField.setBounds(170, 350, 120, 25);
        
        clientLabel = new JLabel("Client User");
        clientLabel.setBounds(50,380,120,30);
        clientTextField = new JTextField();
        clientTextField.setBounds(170, 380, 120, 25);
        
        
        
        deliverButton = new JButton("Deliver to Client");
        deliverButton.setBounds(400, 360, 180, 30);
        

        
        
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
        
        ScrollPane.setBounds(50,110,615,200);
        
        
        
        
      
        
        
        //table mouse click
        table.addMouseListener(new java.awt.event.MouseAdapter() 
        {
            public void mouseClicked(java.awt.event.MouseEvent evt) 
            {
                
                DefaultTableModel tableModel = (DefaultTableModel) table.getModel();
                int selectedRow = table.getSelectedRow();
                
                clientTextField.setText( tableModel.getValueAt( selectedRow, 0).toString() );
                serviceIDTextField.setText( tableModel.getValueAt( selectedRow, 1).toString() );
               
                
            }
        });
        
        
        
        
        
        //back button
        JButton backButton = new JButton("Back");
        backButton.setBounds(0, 5, 90, 25);
        
        backButton.addActionListener((ActionEvent e) -> 
        { 
            
            adminMenuForm ob = new adminMenuForm(_user);
            ob.setVisible(true);
            
            this.dispose();
        });
        
        
        
        
        
        //deliver button
        deliverButton.addActionListener( (ActionEvent ex)->
        {
            
            if(serviceIDTextField.getText().equals("") || clientTextField.getText().equals(""))
            {
                JOptionPane.showMessageDialog(new JFrame(), "Please select a record from the list !", "Warning",JOptionPane.WARNING_MESSAGE);
            }
            
            else
            {
                
                try 
                {
                    DefaultTableModel tableModel = (DefaultTableModel) table.getModel();


                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automobiledata?useSSL=false","root","123456789");
                    Statement st = con.createStatement();
                    String query = "select * from servicecentredata where ID='"+serviceIDTextField.getText()+"' ";
                    ResultSet rs = st.executeQuery(query);

                    tableModel.setRowCount(0);


                    //String _id,_client,_address,_cell,_brand,_model,_engine,_chassis,_cost;


                    while(rs.next())
                    {
                        //"Client Name","Service ID", "Brand", "Model", "Engine", "Chassis"
                        _id = rs.getString("ID");
                        _client = rs.getString("clientUsername");
                        _address = rs.getString("clientAddress");
                        _cell = rs.getString("Cell");
                        _brand = rs.getString("carBrand");
                        _model = rs.getString("carModel");
                        _engine = rs.getString("Engine");
                        _chassis = rs.getString("Chassis");
                        _cost = rs.getString("Cost");


                    }

                    //removing from srevicelist
                    query = "delete from servicecentredata where ID='"+serviceIDTextField.getText()+"' ";
                    st.executeUpdate(query);



                    //addind to serviced
                    query = "insert into servicedcardata values ( '"+_id+"', '"+_client+"', '"+_address+"', '"+_cell+"', '"+_brand+"', '"+_model+"', '"+_engine+"', '"+_chassis+"', '"+_cost+"' ) " ;
                    st.executeUpdate(query);


                    JOptionPane.showMessageDialog(new JFrame(), "Delivered to Client !", "Done",JOptionPane.INFORMATION_MESSAGE);


                    serviceIDTextField.setText("");
                    clientTextField.setText("");

                    showTable();


                } 

                catch (Exception e) 
                {
                    Logger.getLogger(storeUpdateForm.class.getName()).log(Level.SEVERE, null, ex);
                }
            
                
            }
            
            
            
            
        });
        
        
        
        
        
        
        this.add(topLabel);
        this.add(tagLabel);
        this.add(serviceIDLabel);
        this.add(serviceIDTextField);
        this.add(clientLabel);
        this.add(clientTextField);
        this.add(deliverButton);
        this.add(backButton);
        
        this.add(ScrollPane);
        
        this.setVisible(true);

        this.setLocationRelativeTo(null);



        this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        
        
        
        showTable();
        
        //kaj sesh
    }
    
    
    
    
    
    
    //table show
    void showTable()
    {
        
        try 
        {
            DefaultTableModel tableModel = (DefaultTableModel) table.getModel();
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automobiledata?useSSL=false","root","123456789");
            Statement st = con.createStatement();
            String query = "select * from servicecentredata order by ID ";
            ResultSet rs = st.executeQuery(query);
            
            tableModel.setRowCount(0);
            
            while(rs.next())
            {
                //"Client Name","Service ID", "Brand", "Model", "Engine", "Chassis"
                String __id = rs.getString("ID");
                String __client = rs.getString("clientUsername");
                String __brand = rs.getString("carBrand");
                String __model = rs.getString("carModel");
                String __engine = rs.getString("Engine");
                String __chassis = rs.getString("Chassis");
                
                
                
                tableModel.addRow(new Object[]{__client,__id,__brand,__model,__engine,__chassis});
                
            }
        } 
        
        catch (Exception ex) 
        {
            Logger.getLogger(storeUpdateForm.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //table er kaj sesh
    
    
    
    
    
    
}
