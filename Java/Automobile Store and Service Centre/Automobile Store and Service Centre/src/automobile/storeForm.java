
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
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.WindowConstants;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;


public class storeForm extends JFrame
{
    
    //username tracker
    String _user;
    //
    
    
    JLabel topLabel,tagLabel;
    JScrollPane ScrollPane;
    JTable table;
    String id,brand,model,engine,chassis,condition,price;
    
    storeForm(String ss)
    {
        
        ///user track
        _user=ss;
        
        
        
        System.out.println(_user);
        
        this.setSize(720,500);
        this.setLayout(null);
        this.setResizable(false);
        this.setTitle("Automobile Store and Service Centre");


        //login label
        topLabel = new JLabel("Automobile Store");
        topLabel.setBounds(250, 8, 500, 30);
        Font font = new Font("Serif", Font.BOLD, 25);
        topLabel.setFont(font);
        topLabel.setForeground(new Color(120, 120, 110));
        
        
        
        tagLabel = new JLabel("Cars in Stock :");
        tagLabel.setBounds(50, 83, 500, 30);
        
        
        
        //back button
        JButton backButton = new JButton("Back");
        backButton.setBounds(0, 5, 90, 25);
        
        backButton.addActionListener((ActionEvent e) -> 
        { 
            
            if(_user.equals("admin") )
            {
                adminMenuForm ob = new adminMenuForm(_user);
                ob.setVisible(true);
            }
            else
            {
               clientMenuForm ob = new clientMenuForm(_user);
               ob.setVisible(true);
            }
                
            this.dispose();
            
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
        
        ScrollPane.setBounds(50,110,615,320);
        
        
        
        
      
        
        
        
        
        this.add(topLabel);
        this.add(tagLabel);
        this.add(backButton);
        
        this.add(ScrollPane);
        
        this.setVisible(true);

        this.setLocationRelativeTo(null);



        this.setDefaultCloseOperation(WindowConstants.HIDE_ON_CLOSE);
        
        
        
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
