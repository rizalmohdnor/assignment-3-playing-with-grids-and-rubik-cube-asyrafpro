[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/6l4sY1d2)
# 2x2 Rubik's Cube Application

**NAME: Muhammad Amirul Asyraf bin Mohd Kamal**
**Matric ID: 2115565**  

## Objective  
This project is a simple 2x2 Rubik’s Cube application built using Flutter. The application allows users to visualize and interact with a digital Rubik’s Cube by rotating its faces through button controls.

## Implementation Details  
- ✅ **1. Completed the Cube Representation**  
  Defined six faces of the 2x2 Rubik’s Cube with appropriate colors:  
  - Front (Red)  
  - Left (Blue)  
  - Right (Green)  
  - Back (Yellow)  
  - Top (Orange)  
  - Bottom (White)  

- ✅ **2. Implemented Face Rotation Logic**  
  Created a `rotateFaceClockwise(int faceIndex)` function to rotate any given face clockwise.  
  Implemented `rotateTop()` and `rotateBottom()` to modify the cube’s state when the user interacts with the buttons.

- ✅ **3. Added UI Components for Visualizing the Cube**  
  Used GridView to display each face as a 2x2 grid of colored squares.  
  Arranged the cube in a logical format to simulate a real Rubik's Cube view.

- ✅ **4. Implemented Interactive Buttons for Rotation**  
  Added two buttons to allow the user to rotate the cube:  
  - **Rotate Top** → Rotates the top face clockwise and updates the adjacent edges.  
  - **Rotate Bottom** → Rotates the bottom face clockwise and updates the adjacent edges.
