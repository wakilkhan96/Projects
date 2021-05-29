package automobile;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import javax.swing.*;




public class clientMenuForm extends JFrame
{
    
    //username tracker
    String _user;
    //
    
    clientMenuForm(String ss)
    {
        
        
        
        ///user track
        _user=ss;
        
        
        this.setSize(720,500);
        this.setLayout(null);
        this.setResizable(false);
        this.setTitle("Automobile Store and Service Centre");


        //login label
        JLabel topLabel = new JLabel("Automobile Store and Service Centre");
        topLabel.setBounds(153, 20, 500, 30);
        Font font = new Font("Serif", Font.BOLD, 25);
        topLabel.setFont(font);
        topLabel.setForeground(new Color(120, 120, 110));
        
        
        
        //username label & textfield
        JLabel userTypeLabel = new JLabel("User  Type");
        userTypeLabel.setBounds(50, 105, 70, 20);
        JLabel _userTypeLabel = new JLabel();
        _userTypeLabel.setBounds(170, 105, 130, 20);
        font = new Font("Serif", Font.PLAIN, 18);
        _userTypeLabel.setFont(font);
        _userTypeLabel.setForeground(new Color(120, 180, 110));
        
        
        if(ss.equals("admin"))_userTypeLabel.setText(":           Administrator");
        else _userTypeLabel.setText(":           Client");
       
        
        
        
        //username label & textfield
        JLabel userProfileLabel = new JLabel("User  Profile");
        userProfileLabel.setBounds(50, 135, 70, 20);
        JLabel _userProfileLabel = new JLabel();
        _userProfileLabel.setBounds(170, 135, 130, 20);
        _userProfileLabel.setText(":           "+ss);
        font = new Font("Serif", Font.PLAIN, 18);
        _userProfileLabel.setFont(font);
        _userProfileLabel.setForeground(new Color(120, 180, 110));
        
        
        
        
        //daag
        JLabel daagLabel = new JLabel();
        daagLabel.setBounds(20,180,1000,10);
        daagLabel.setText("------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
        
        
        
        // button
        JButton storeButton = new JButton("Automobile Store");
        storeButton.setBounds(80, 250, 150, 40);

        JButton buyButton = new JButton("Buy Automobile");
        buyButton.setBounds(280, 250, 150, 40);
        
        JButton serviceButton = new JButton("Service Automobile");
        serviceButton.setBounds(480, 250, 150, 40);

        
        // back button
        JButton logOutButton = new JButton("Log Out");
        logOutButton.setBounds(620, 440, 90, 25);
        
        logOutButton.addActionListener((ActionEvent e) -> 
        { 
            this.dispose();
            Automobile ob = new Automobile();
            ob.setVisible(true);
        });
        
         
        
        
        //store button er kaj
        storeButton.addActionListener((ActionEvent e) -> 
        {  
            storeForm ob = new storeForm(_user);
            ob.setVisible(true);
            this.dispose();
            
        
        });
        
        
        //service button er kaj
        serviceButton.addActionListener((ActionEvent e) -> 
        {  
            serviceAutomobileForm ob = new serviceAutomobileForm(_user);
            ob.setVisible(true);
            
            this.dispose();
        
        });

        
        
        
        
        
        
        



        
        
        
        
        
        //this adds
        
        this.add(topLabel);
        this.add(userTypeLabel);
        this.add(_userTypeLabel);
        this.add(userProfileLabel);
        this.add(_userProfileLabel);
        this.add(daagLabel);
        
        
        this.add(storeButton);
        this.add(buyButton);
        this.add(serviceButton);
        this.add(logOutButton);
        

        this.setVisible(true);

        this.setLocationRelativeTo(null);



        this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        
        
        ///frame
    }
    
    
    
    
}
