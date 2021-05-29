
package automobile;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import java.sql.DriverManager;
import javax.swing.*;




public class Automobile extends JFrame
{
   
    
    Automobile()
    {
        
        this.setSize(300,325);
        this.setLayout(null);
        this.setResizable(false);
        this.setTitle("Account LogIn");



        //login label
        JLabel loginLabel = new JLabel("----Log In----");
        loginLabel.setBounds(95, 23, 200, 30);
        Font font = new Font("Serif", Font.BOLD, 17);
        loginLabel.setFont(font);
        loginLabel.setForeground(new Color(120, 120, 110));
        
        
        //signup button
        JButton signupButton = new JButton("Sign Up");
        signupButton.setBounds(200, 1, 100, 22);
        
        //username label & textfield
        JLabel userLabel = new JLabel("Username");
        userLabel.setBounds(40, 95, 70, 20);
        JTextField userTextField = new JTextField();
        userTextField.setBounds(130, 95, 110, 20);

        //username label & passwordField
        JLabel passLabel = new JLabel("Password");
        passLabel.setBounds(40, 130, 70, 20);
        JPasswordField passwordField = new JPasswordField();
        passwordField.setBounds(130, 130, 110, 20);
        
        //radio button
        JRadioButton administratorRadioButton = new JRadioButton("Administrator");
        administratorRadioButton.setBounds(50, 190, 110, 20);
        
        JRadioButton clientRadioButton = new JRadioButton("Client");
        clientRadioButton.setBounds(170, 190, 110, 20);
        
        
        //enter button
        JButton enterButton = new JButton("Enter");
        enterButton.setBounds(115, 250, 70, 25);


        
        
        
        
        
        
        //signup button er kaj
        signupButton.addActionListener((ActionEvent e) -> 
        {  

            signupForm ob = new signupForm();
            this.dispose();
            ob.setVisible(true);
            
        });  
        
        
        //enter button er kaj
        enterButton.addActionListener((ActionEvent e) -> 
        {  
            
            
            
            try 
            {
                String u = userTextField.getText();
                String p = String.valueOf( passwordField.getText() );
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automobiledata?useSSL=false","root","123456789");
                Statement st = con.createStatement();
                String query = "select * from logindata";
                ResultSet rs = st.executeQuery(query);

                
                boolean succes = false;
                while(rs.next())
                {
                    String uu = rs.getString("Username");
                    String pp = rs.getString("Password");
                    
                    //System.out.println("t "+u+" "+p);
                    //System.out.println("d "+uu+" "+pp);
                    //administratorRadioButton.isSelected()^ u.equals("admin")
                    
                    if( (administratorRadioButton.isSelected() && !u.equals("admin")) )continue;
                    if( (clientRadioButton.isSelected() && u.equals("admin")) )continue;
                    
                    if( u.equals(uu) && p.equals(pp) )
                    {
                        
                        JOptionPane.showMessageDialog(new JFrame(), "LogIn Succesfull !", "Succes",JOptionPane.INFORMATION_MESSAGE);

                        succes = true;    
                        
                        if(u.equals("admin"))
                        {
                            adminMenuForm ob = new adminMenuForm( u );
                            ob.setVisible(true);
                            this.dispose();
                            
                        }
                        
                        else
                        {
                            clientMenuForm ob = new clientMenuForm( u );
                            ob.setVisible(true);
                            this.dispose();
                        }
                            
                        

                    }
                    
                    
                }
                
                if(!succes)JOptionPane.showMessageDialog(new JFrame(), "Incorrect User or Password !", "Error",JOptionPane.ERROR_MESSAGE);

                
            }
            catch(Exception ex)
            {
                ////
            }
                
            
            //signupForm ob = new signupForm();
            //this.dispose();
            //ob.setVisible(true);
            
            
           
        
        });
        
        
        
        
        //radio button click
        administratorRadioButton.addActionListener((ActionEvent e)->
        {
            if( administratorRadioButton.isSelected() )clientRadioButton.setSelected(false);
            signupButton.setVisible(false);
            
            userTextField.setText("admin");
            
        });
        
        clientRadioButton.addActionListener((ActionEvent e)->
        {
            if( clientRadioButton.isSelected() )administratorRadioButton.setSelected(false);
            signupButton.setVisible(true);
            
            userTextField.setText("user_2");
            
        });



        //initial settings
        administratorRadioButton.setSelected(true);
        signupButton.setVisible(false);
        
        userTextField.setText("admin");
        passwordField.setText("12345");
        //initial settings
        
        
        
        
        //this adds
        this.add(signupButton);
        this.add(loginLabel);
        this.add(userLabel);
        this.add(userTextField);
        this.add(passLabel);
        this.add(passwordField);
        this.add(administratorRadioButton);
        this.add(clientRadioButton);
        this.add(enterButton);

        this.setVisible(true);

        this.setLocationRelativeTo(null);



        this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        
    }

   
    public static void main(String[] args) 
    {
        
        Automobile ob = new Automobile();
        ob.setVisible(true);
        
    }
    
}
