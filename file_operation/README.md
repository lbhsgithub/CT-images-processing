#### structure of folders
- date
    - recipe1
        - 1 (specimen number)
            - 1p (raw photos, shows crack develop)
            - 1c (raw CT scan images, shows pore in 2D)
            - 1c-processed (processed images folders, build 3D image with *imageJ*)
                - binarized
                - allpore
                - majorpore
		- bubbles
                - ... (ohther processed images folder)
            - pore_data.xlsx (information excavated via image processing)
            - BP (backgroud picture on the bottom of *analysis frame*)
                - BP.BMP
                - 1st.jpg
                - end.jpg
                - BP.psd (processed with *photoshop*, like subtract and position correction)
        - ... (number of ohther specimens, like 23456)
        - tensile_data.xlsx (acquire from tesile test)
            - 1 (sheet name) 
                - rank A : time
                - rank B : strain
                - rank C : strength
                - ... (other information)
            - ... (number of ohther specimens)
    - ... (ohther recipes)

#### content of three global struct
- address
    - directory address (add new Key/value pair if need)
    - excel address
- Is_info (images' information)
    - namelist (namelist of images)
    - size (size of 2D images and number of images as another size in 3D image)
- Parameters (store all parameters and adjust in one function)
