### CT-images-processing
MATLAB program to mine pore information of specimens by CT scan images.  
start at 2019.01  
Reason: A part of master project (civil Engineering & material), need pore information for further analysis.
![2 image sequences](https://github.com/lbhsgithub/CT-images-processing/blob/master/archived/images/2_image_sequences.png)
![3 3D rebuild image](https://github.com/lbhsgithub/CT-images-processing/blob/master/archived/images/3_3D_rebuild_image.png)  
(Z is sort order of image sequences)
### objective information
- porosity and pore distribution of 2D images
    - easy to accomplish by  *bwconncomp* in 2D images
- porosity and pore distribution of 3D image
    - easy to accomplish by  *bwconncomp* in 3D image
- Maximum sectional area(Amax) of 3D pore in Z axis (forced direction). 
    - idea
        - use *bwconncomp* in specimen model(3D matrix) to obtain coordinate vector(coords) of every 3D pore
        - use coords to find Amax of 3D pore
    - realize
        - index conversion and sum amount of coords for every Z (slow)
        - create function *slice_sum* (faster)
            - create empty 3D matrix Ve (size equals to 3D rebuild image)
            - get coords of one pore, set 1 in Ve.(Equivalent to isolating this hole)
            - slice Ve and sum along Z axis.
            - compare and get Amax along with its Z value(location in Z)
### other problem
 - In this process air identification is an important part. 
 Generally air is the maximum connected components in every images or 3D rebuild image.
Base on this identify method, such error will happen:
 - In order to identify **boundary pore**, function *shape_filter* is create to seal boundary pore. *shape_filter* means filtrating connected components by shape.  
![7 repair](https://github.com/lbhsgithub/shape_filter/blob/master/archived/images/repair.png)
     - Idea 
        - Shape of a pore in continuous images along Z changes gradually. Find the images before and after the appearance of a **boundary pore** ,then subtract to get a number of connected components, which contains objective **boundary pore** and other interferential parts.
        - The shape of connected components would be long strip, diagonal strip, diagonal semicircle, perpendicular simicircle, ellipse or circle, in which perpendicular simicircle, ellipse and circle are **boundary pore** and should be identified.
        - use *shape_filter* to filter out interferential parts.
        - easy to outline **boundary pore** by *bwboundaries*. Then **boundary pore** is sealed.
    - realize
        - subtract every adjacent images in order
        - judge every connected components in subtracted result by *shape_filter*()
            - function parameter : coordinates of a connected component
            - because this project aims to mark major pore rather than all pore, small pore can be excluded for sealing but interferential parts can't exsit.
            - Shape characteristic parameter in *shape_filter*
                - perimeter, abs(Δx-Δy), Δx/Δy, area, pi/4*(Δx*Δy)/S
            - advantage: Only need to modify this function to adjust existing parameters or create new characteristic parameter.
### program structure
use *global struct* for possible item addition due to possible funciton addition.
- file operation
    - record folder and images information as *global struct*
    - see [structure of folders](https://github.com/lbhsgithub/CT-images-processing/blob/master/file_operation/README.md)
- parameters
    - set all parameters in one function, create *global struct*
- mark_bubbles(unfinished)
    - mark bubbles added in material which show different grayscale
- binarize and repair
    - binarize
    - repair
    - **shape_filter**
- pore_data and 3Dimage
    - voxel
    - **slice_sum**
    - get_poreinfo
    - cut_record
    - cut
