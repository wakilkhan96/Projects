
package automobile;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JLabel;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;


public class storeUpdateForm extends JFrame
{
    JLabel topLabel, idLabel,brandLabel,modelLabel,engineLabel,chassisLabel,priceLabel,conditionLabel;
    JTextField idTextField,brandTextField,modelTextField,engineTextField,chassisTextField,priceTextField,conditionTextField;
    JScrollPane ScrollPane;
    JTable table;
    String id,brand,model,engine,chassis,condition,price;
    
    
    //username tracker
    String _user;
    //
    
    
    storeUpdateForm(String ss)
    {
        
        ///user track
        _user=ss;
        
        
        this.setSize(720,550);
        this.setLayout(null);
        this.setResizable(false);
        this.setTitle("Automobile Store and Service Centre");


        //login label
        topLabel = new JLabel("Automobile Store");
        topLabel.setBounds(250, 8, 500, 30);
        Font font = new Font("Serif", Font.BOLD, 25);
        topLabel.setFont(font);
        topLabel.setForeground(new Color(120, 120, 110));
        
        
        
        idLabel = new JLabel("Car  ID");
        idLabel.setBounds(50, 80, 70, 20);
        idTextField = new JTextField();
        idTextField.setBounds(130, 80, 130, 22);
        
        brandLabel = new JLabel("Car  Brand");
        brandLabel.setBounds(50, 120, 70, 20);
        brandTextField = new JTextField();
        brandTextField.setBounds(130, 120, 130, 22);
        
        modelLabel = new JLabel("Model No.");
        modelLabel.setBounds(50, 160, 70, 20);
        modelTextField = new JTextField();
        modelTextField.setBounds(130, 160, 130, 22);
        
        conditionLabel = new JLabel("Condition");
        conditionLabel.setBounds(50, 200, 70, 20);
        conditionTextField = new JTextField();
        conditionTextField.setBounds(130, 200, 130, 22);
        
        
        priceLabel = new JLabel("Price");
        priceLabel.setBounds(50, 240, 70, 20);
        priceTextField = new JTextField();
        priceTextField.setBounds(130, 240, 130, 22);
        
        
        //right
        
        engineLabel = new JLabel("Engine No.");
        engineLabel.setBounds(400, 200, 70, 20);
        engineTextField = new JTextField();
        engineTextField.setBounds(480, 200, 130, 22);
        
        chassisLabel = new JLabel("Chassis No.");
        chassisLabel.setBounds(400, 240, 70, 20);
        chassisTextField = new JTextField();
        chassisTextField.setBounds(480, 240, 130, 22);
        
        //right
        
        
        
        // button
        JButton addButton = new JButton("Add");
        addButton.setBounds(120, 300, 130, 25);

        JButton updateButton = new JButton("Update");
        updateButton.setBounds(280, 300, 130, 25);
        
        JButton deleteButton = new JButton("Delete");
        deleteButton.setBounds(440, 300, 130, 25);
        
        
        
        //back button
        JButton backButton = new JButton("Back");
        backButton.setBounds(0, 5, 90, 25);
        
        backButton.addActionListener((ActionEvent e) -> 
        { 
            this.dispose();
            adminMenuForm ob = new adminMenuForm(_user);
            ob.setVisible(true);
        });
        
        
        
        
        //table work
        ScrollPane = new javax.swing.JScrollPane();
        table = new javax.swing.JTable();

        table.setModel(new javax.swing.table.DefaultTableModel(
                new Object [][] 
                {
                    
                },
                new String [] 
                {
                    "Car ID", "Brand", "Model", "Engine", "Chassis", "Condition", "Price"
                }
        ));
        
        

        ScrollPane.setViewportView(table);
        
        ScrollPane.setBounds(50,350,615,150);
        
        
        
        
        
        //table mouse click
        table.addMouseListener(new java.awt.event.MouseAdapter() 
        {
            public void mouseClicked(java.awt.event.MouseEvent evt) 
            {
                
                DefaultTableModel tableModel = (DefaultTableModel) table.getModel();
                int selectedRow = table.getSelectedRow();
                
                idTextField.setText( tableModel.getValueAt( selectedRow, 0).toString() );
                brandTextField.setText( tableModel.getValueAt( selectedRow, 1).toString() );
                modelTextField.setText( tableModel.getValueAt( selectedRow, 2).toString() );
                engineTextField.setText( tableModel.getValueAt( selectedRow, 3).toString() );
                chassisTextField.setText( tableModel.getValueAt( selectedRow, 4).toString() );
                conditionTextField.setText( tableModel.getValueAt( selectedRow, 5).toString() );
                priceTextField.setText( tableModel.getValueAt( selectedRow, 6).toString() );
                
            }
        });
        
        
        
        //button works
        addButton.addActionListener( (ActionEvent e)->
        {
            
            id = idTextField.getText();
            brand = brandTextField.getText();
            model = modelTextField.getText();
            engine = engineTextField.getText();
            chassis = chassisTextField.getText();
            condition = conditionTextField.getText();
            price = priceTextField.getText();
            
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automobiledata?useSSL=false","root","123456789");
                Statement st = con.createStatement();
                
                String query;
                
                query = "select * from storedata where ID='"+id+"' ";
                ResultSet rs = st.executeQuery(query);
                
                if(rs.next())
                {
                    JOptionPane.showMessageDialog(new JFrame(), "Car ID exists already !", "",JOptionPane.INFORMATION_MESSAGE);
                }
                
                else if(id.equals("")||brand.equals("")||model.equals("")||engine.equals("")||chassis.equals("")||condition.equals("")||price.equals("") )
                    JOptionPane.showMessageDialog(new JFrame(), "Fill all empty places !", "Warning",JOptionPane.WARNING_MESSAGE);                
                
                
                else
                {
                    query = "insert into storedata values ('"+id+"','"+brand+"','"+model+"','"+engine+"','"+chassis+"','"+condition+"','"+price+"')";
                    st.execute(query);
                    JOptionPane.showMessageDialog(new JFrame(), "Car Added to store Succesfully !", "Succes",JOptionPane.INFORMATION_MESSAGE);
                    
                    idTextField.setText("");
                    brandTextField.setText("");
                    modelTextField.setText("");
                    engineTextField.setText("");
                    chassisTextField.setText("");
                    priceTextField.setText("");
                    conditionTextField.setText("");
                    
                    
                    
                }
            }
            
            catch (Exception ex) 
            {
                Logger.getLogger(storeUpdateForm.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        
         
            showTable();
            
            //kaj sesh
        });
        
        
        
        
        
        
        
        
        
        
        
        //update button
        updateButton.addActionListener( (ActionEvent e)->
        {
            
            id = idTextField.getText();
            brand = brandTextField.getText();
            model = modelTextField.getText();
            engine = engineTextField.getText();
            chassis = chassisTextField.getText();
            condition = conditionTextField.getText();
            price = priceTextField.getText();
            
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automobiledata?useSSL=false","root","123456789");
                Statement st = con.createStatement();
                
                String query;
                
                
                if(id.equals("")||brand.equals("")||model.equals("")||engine.equals("")||chassis.equals("")||condition.equals("")||price.equals("") )
                    JOptionPane.showMessageDialog(new JFrame(), "Fill all empty places !", "Warning",JOptionPane.WARNING_MESSAGE);                
                
                else
                {
                    query = "update storedata set Brand='"+brand+"', Model='"+model+"', Engine='"+engine+"', Chassis='"+chassis+"', cCondition='"+condition+"', Price='"+price+"' where ID='"+id+"'  ";
                    st.executeUpdate(query);
                    JOptionPane.showMessageDialog(new JFrame(), "Data updated Succesfully !", "Succes",JOptionPane.INFORMATION_MESSAGE);
                    
                    idTextField.setText("");
                    brandTextField.setText("");
                    modelTextField.setText("");
                    engineTextField.setText("");
                    chassisTextField.setText("");
                    priceTextField.setText("");
                    conditionTextField.setText("");
                    
                    
                    
                    
                    
                }
            }
            
            catch (Exception ex) 
            {
                Logger.getLogger(storeUpdateForm.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        
         
            showTable();
            
            //kaj sesh
        });
        
        
        
        
        
        
        
        
        //delete button
        deleteButton.addActionListener( (ActionEvent e)->
        {
            
            id = idTextField.getText();
            brand = brandTextField.getText();
            model = modelTextField.getText();
            engine = engineTextField.getText();
            chassis = chassisTextField.getText();
            condition = conditionTextField.getText();
            price = priceTextField.getText();
            
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automobiledata?useSSL=false","root","123456789");
                Statement st = con.createStatement();
                
                String query;
                
                
                if(id.equals(""))
                    JOptionPane.showMessageDialog(new JFrame(), "ID field  must be Filled to Delete!", "Warning",JOptionPane.INFORMATION_MESSAGE);
   
                else    
                {
                    query = "delete from storedata where ID='"+id+"'  ";
                    st.executeUpdate(query);
                    JOptionPane.showMessageDialog(new JFrame(), "Data deleted Succesfully !", "Succes",JOptionPane.INFORMATION_MESSAGE);
                    
                    idTextField.setText("");
                    brandTextField.setText("");
                    modelTextField.setText("");
                    engineTextField.setText("");
                    chassisTextField.setText("");
                    priceTextField.setText("");
                    conditionTextField.setText("");
                    
                    
                    
                    
                }
            }
            
            catch (Exception ex) 
            {
                Logger.getLogger(storeUpdateForm.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        
         
            showTable();
            
            //kaj sesh
        });
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        this.add(topLabel);
        this.add(idLabel);
        this.add(idTextField);
        this.add(brandLabel);
        this.add(brandTextField);
        this.add(modelLabel);
        this.add(modelTextField);
        this.add(engineLabel);
        this.add(engineTextField);
        this.add(chassisLabel);
        this.add(chassisTextField);
        this.add(priceLabel);
        this.add(priceTextField);
        this.add(conditionLabel);
        this.add(conditionTextField);
        this.add(addButton);
        this.add(updateButton);
        this.add(deleteButton);
        this.add(backButton);
        
        this.add(ScrollPane);
        
        this.setVisible(true);

        this.setLocationRelativeTo(null);



        this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        
        
        
        
        
        /////
        showTable();
        
        
        
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
            String query = "select * from storedata order by ID ";
            ResultSet rs = st.executeQuery(query);
            
            tableModel.setRowCount(0);
            
            while(rs.next())
            {
                String _id = rs.getString("ID");
                String _brand = rs.getString("Brand");
                String _model = rs.getString("Model");
                String _engine = rs.getString("Engine");
                String _chassis = rs.getString("Chassis");
                String _condition = rs.getString("cCondition");
                String _price = rs.getString("Price");
                
                
                tableModel.addRow(new Object[]{_id,_brand,_model,_engine,_chassis,_condition,_price});
                
            }
        } 
        
        catch (Exception ex) 
        {
            Logger.getLogger(storeUpdateForm.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //table er kaj sesh
    
    
    
    
    
    
    
}
