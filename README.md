# Aerospace-Structures

The Finite Element Analysis (FEA) program was coded in MATLAB to analyze the stress concentration around an elliptical hole in a steel plate. The problem was defined by considering a steel plate of 2 m square and 1 mm thick with an elliptical hole in the center. The steel plate has Young’s Modulus of 210 GPa and Poisson’s ratio of 0.3. The plate was subjected to a far-field stress of 200 MPa. 

The stress is applied in the y-direction of plate keeping x-direction fixed. The stress at location C was monitored which expected to experience maximum stress concentration. The major axis 2a was kept the same with a = 0.1 m. The initial case was run with a=b scenario and further varied the minor axis b from 0.2 m to 0.01 m.  

A mesh convergence study was performed to determine the mesh size which is shown in figure. Based on the study 930 mesh nodes were considered in total. The deformed mesh for the initial case is shown below. The quarter of the plate is shown below as it has symmetry. 

It was observed that the lesser the value of minor axis compared to major axis, the more the stress concentration is there at the location C due to the sharper edge. 






