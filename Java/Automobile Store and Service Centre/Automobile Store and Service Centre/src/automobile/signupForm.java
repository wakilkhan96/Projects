
package automobile;

import java.awt.*;
import java.awt.event.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;



public class signupForm extends JFrame
{ 
    
    
    signupForm()
    {
        
        this.setSize(300,350);
        this.setLayout(null);
        this.setResizable(false);
        this.setTitle("Account SignUp");


        //login label
        JLabel topLabel = new JLabel("----Sign Up----");
        topLabel.setBounds(95, 10, 200, 30);
        Font font = new Font("Serif", Font.BOLD, 17);
        topLabel.setFont(font);
        topLabel.setForeground(new Color(120, 120, 110));
        
        
        
        //username label & textfield
        JLabel userLabel = new JLabel("Username");
        userLabel.setBounds(30, 60, 70, 20);
        JTextField userTextField = new JTextField();
        userTextField.setBounds(120, 60, 130, 20);

        //username label & passwordField
        JLabel passLabel = new JLabel("Password");
        passLabel.setBounds(30, 90, 70, 20);
        JPasswordField passwordField = new JPasswordField();
        passwordField.setBounds(120, 90, 130, 20);
        
        //another information field
        JLabel nameLabel = new JLabel("Name");
        nameLabel.setBounds(30, 140, 70, 20);
        JTextField nameTextField = new JTextField();
        nameTextField.setBounds(120, 140, 130, 20);
        
        JLabel addressLabel = new JLabel("Address");
        addressLabel.setBounds(30, 168, 70, 20);
        JTextField addressTextField = new JTextField();
        addressTextField.setBounds(120, 168, 130, 20);
        
        JLabel emailLabel = new JLabel("E-mail");
        emailLabel.setBounds(30, 196, 70, 20);
        JTextField emailTextField = new JTextField();
        emailTextField.setBounds(120, 196, 130, 20);
        
        JLabel cellLabel = new JLabel("Cell");
        cellLabel.setBounds(30, 224, 70, 20);
        JTextField cellTextField = new JTextField();
        cellTextField.setBounds(120, 224, 130, 20);
        
        
        
        
        
        
        
        // button
        JButton submitButton = new JButton("Submit");
        submitButton.setBounds(115, 266, 90, 25);


        
        
        
        // back button
        JButton backButton = new JButton("Back");
        backButton.setBounds(0, 300, 90, 20);
        
        backButton.addActionListener((ActionEvent e) -> 
        { 
            this.dispose();
            Automobile ob = new Automobile();
            ob.setVisible(true);
        });
        
         
        
        
        //submit button er kaj
        submitButton.addActionListener((ActionEvent e) -> 
        {  
            
        
            try 
            {
                
                        
                
                String u = userTextField.getText();
                String p = String.valueOf( passwordField.getPassword() );
                String a = addressTextField.getText();
                String em = emailTextField.getText();
                String c = cellTextField.getText();
                
                
                if(u.equals("") || p.equals("") || a.equals("") || e.equals("") || c.equals(""))
                    JOptionPane.showMessageDialog(new JFrame(), "Fill all empty places !", "Warning",JOptionPane.WARNING_MESSAGE);
                else store(u,p,a,em,c);
                
                
                //Automobile ob = new Automobile();
                //this.dispose();
                //ob.setVisible(true);
                
            } 
            catch (SQLException ex) {
                Logger.getLogger(signupForm.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(signupForm.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        });
        
        
        
        
        
        
        
        
        



        
        
        
        
        
        //this adds
        
        this.add(topLabel);
        this.add(userLabel);
        this.add(userTextField);
        this.add(passLabel);
        this.add(passwordField);
        this.add(nameLabel);
        this.add(nameTextField);
        this.add(addressLabel);
        this.add(addressTextField);
        this.add(emailLabel);
        this.add(emailTextField);
        this.add(cellLabel);
        this.add(cellTextField);
        this.add(submitButton);
        this.add(backButton);
        

        this.setVisible(true);

        this.setLocationRelativeTo(null);



        this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        
        
        ///frame
    }
    
    
    
    
    
    
    
    //store to database
    void store(String u,String p,String a,String e,String c) throws SQLException, ClassNotFoundException
    {
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automobiledata?useSSL=false","root","123456789");
        Statement st = con.createStatement();
        
        String query;
        
        query = "select * from logindata where Username='"+u+"' and Password='"+p+"' ";
        ResultSet rs = st.executeQuery(query);
        
        if(rs.next())
        {
            JOptionPane.showMessageDialog(new JFrame(), "User already exists !", "",JOptionPane.INFORMATION_MESSAGE);
        }
            
        else
        {
                query = "insert into logindata values ('"+u+"','"+p+"','"+a+"','"+e+"','"+c+"')";
                st.execute(query);
                JOptionPane.showMessageDialog(new JFrame(), "Account SignUp Succesfull !", "Succes",JOptionPane.INFORMATION_MESSAGE);
        
                
                
                
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
}
