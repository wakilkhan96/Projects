# -*- coding: utf-8 -*-
"""
Created on Fri Feb 14 11:58:26 2021

@author: Wakil
"""
from tkinter import *
from PIL import ImageTk, Image
from tkinter import filedialog
import os
import numpy as np
import random

global source_image
global source_file_location 
global source_file_name 
global filename_sample_output
global starting_file_number
global ending_file_number
global output_images_width_range


def generate_file_names():
    
    #next_files_naming: 
    generated_file_names = [] #all generated file names will be stored here
    
    file_naming_list = filename_sample_output
    file_naming_list = filename_sample_output.split("_")
    
    file_naming_prefix = ""
    file_naming_suffix = ""
    new_file_name = ""
    
    list_length = len(file_naming_list)
    for i in range(0, list_length-1):
        file_naming_prefix += file_naming_list[i]
        file_naming_prefix += "_"
    
    #print(file_naming_prefix)
    
    list_element_length = len( file_naming_list[0] )
    #print("length -> ", list_element_length)
    file_naming_suffix_length = list_element_length
    
    
    start = int(starting_file_number)
    end = int(ending_file_number)
    if(start>end):
        start, end = end, start
    
    for file_number in range(start, end+1):
        
        next_file_number = file_number
        next_file_number_toString = str(next_file_number)
        next_file_number_toString_length = len(next_file_number_toString)
        
        file_naming_suffix = ""
        for i in range (0, file_naming_suffix_length-next_file_number_toString_length):
            file_naming_suffix += "0"
        
        file_naming_suffix += next_file_number_toString
        new_file_name = file_naming_prefix + file_naming_suffix
        
        generated_file_names.append( new_file_name )
        
        #print( file_naming_suffix, new_file_name)
    """ (end of)-> for file_number in range(start, end+1): """
    
    
    start = int(starting_file_number)
    end = int(ending_file_number)
    if(start>end):
        generated_file_names.reverse()
    
    return generated_file_names
    


def generate_images():
    
    file_names = generate_file_names()
    total_file = len(file_names)
    print(file_names)
    print(output_images_width_range)
    main_image = Image.open(source_image)
    
    width_range_list = output_images_width_range.split("-")      
    min_width = int(width_range_list[0])
    max_width = int(width_range_list[1])
    del_width = (max_width - min_width) / total_file
    print(del_width)
    
    width = min_width
    for fn in file_names:
        image_width = round(width)
        
        img = main_image
        wpercent = (image_width/float(img.size[0]))
        image_height = int((float(img.size[1])*float(wpercent)))
        image_height = random.randint(image_height-5, image_height+5) #optional
        img = img.resize((image_width, image_height), Image.ANTIALIAS)
        str_image_name = source_file_location + "\\" + fn + ".png"
        img.save(str_image_name)
        
        #print(image_width)
        width += del_width
        
        

        


def GUI(): 
    root = Tk()
    root.title('Image Dataset Generator')
    root.geometry("550x500")
    root.resizable(width=True, height=True)
    
    def set_default_values():
        filename_sample_entry.delete(0, END)
        filename_sample_entry.insert(0, source_file_name)
        generated_image_width_range_entry.delete(0, END)
        range_str = "30-180"
        generated_image_width_range_entry.insert(0, range_str)
        file_number_start_entry.delete(0, END)
        file_number_start_entry.insert(0, "0")
        file_number_end_entry.delete(0, END)
        file_number_end_entry.insert(0, "0")
        
    
    def open_file_location():
        filename = filedialog.askopenfilename(title='open')
        return filename
    
    def open_image():
        global source_image
        global source_file_name
        global source_file_location
        source_image = open_file_location()
        source_file_name = os.path.basename( source_image )  
        source_file_location = os.path.dirname( source_image )    
        # print(source_file_name)
        # print(source_file_location)
        
        img = Image.open(source_image)
        img = img.resize((200, 200), Image.ANTIALIAS)
        img = ImageTk.PhotoImage(img)
        
        panel = Label(root, image=img)
        panel.image = img
        #panel.pack()
        panel.grid(row=0, column=1)
        set_default_values()
        
    def generate(event):
        
        global filename_sample_output
        global starting_file_number
        global ending_file_number
        global output_images_width_range
        
        filename_sample_output = filename_sample_entry.get()
        #print(filename_sample_output)
        starting_file_number = file_number_start_entry.get()
        #print(starting_file_number)
        ending_file_number = file_number_end_entry.get()
        #print(ending_file_number)
        output_images_width_range = generated_image_width_range_entry.get()
        #print(output_images_width_range)
        generate_images()
        
        
        
    #btn = Button(root, text='Browse Image', command=open_image).pack()
    openBtn = Button( root, text='Browse Image', command=open_image )
    openBtn.grid(row=0, column=0)
    
    dummy_label1 = Label(root, text=" ").grid(row=3, column=0)
    generated_image_width_range_label1 = Label(root, text="Output Images Width range").grid(row=4, column=0)
    generated_image_width_range_entry = Entry(root,width=20, borderwidth=2)
    generated_image_width_range_entry.grid(row=4, column=1,sticky=W)
    
    dummy_label1 = Label(root, text=" ").grid(row=5, column=0)
    filename_sample_label = Label(root, text="Output Sample of Filename ").grid(row=6, column=0)
    filename_sample_entry = Entry( root, width=35, borderwidth=2 )
    filename_sample_entry.grid(row=6, column=1)
    
    dummy_label1 = Label(root, text=" ").grid(row=7, column=0)
    generated_image_numbers = Label(root, text="Output Start-End Number").grid(row=8, column=0)
    file_number_start_entry = Entry(root,width=20, borderwidth=2)
    file_number_start_entry.grid(row=9, column=0,sticky=W)
    file_number_end_entry = Entry(root,width=20, borderwidth=2)
    file_number_end_entry.grid(row=9, column=1,sticky=W)
    
    dummy_label1 = Label(root, text=" ").grid(row=10, column=0)
    generate_btn = Button(root, text="Generate Images")
    generate_btn.grid(row=11, column=1)
    generate_btn.bind('<Button-1>', generate)
    
    
    
    root.mainloop()
    
     
     
     
if __name__ == "__main__":
    GUI()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
"""
working code
    entryBox1=Entry(root,width=10)
    entryBox1.grid(row=7, column=0,sticky=W)
    
    entryBox2=Entry(root,width=10)
    entryBox2.grid(row=7, column=2,sticky=W)
    
    grabBtn = Button(root, text="Generate Images")
    grabBtn.grid(row=8, column=1)
    grabBtn.bind('<Button-1>', generate)

"""
    
    
    
    
    
    
    