# Resilient Networks: Network Design with IBM ILOG CPLEX Optimization Studio: Exercise Sheet 2

## Instructors
- Prof. Dr. Mathias Fischer
- August See

## Overview
This exercise provides practical experience with an optimization tool, specifically the IBM ILOG CPLEX Optimization Studio. The goal is to solve various network design problems, applying optimization techniques covered in the lecture.

## Tool
IBM ILOG CPLEX Optimization Studio

## Tasks Overview
### 1. Loading an Example Project
Load the provided example project "min-link-cost" into the OPL-IDE. Familiarize yourself with the IDE and study the provided example. The example represents a network optimization problem aiming to find a minimum link capacity assignment given a fixed set of demands and paths.

### 2. Adding a Path
Modify the presented example to include an additional path (P12) for the first demand. Recompute the solution to the optimization problem.

### 3. Path Diversity (PD)
Enhance the example to satisfy every demand by splitting the demand flow evenly between two paths (diversity factor nd = 2). Enhance the given optimization problem accordingly and compute the result.

### 4. Unrestricted Demand Reconfiguration (DR-U)
Implement unrestricted demand reconfiguration (DR-U) for the network from Task 3. Compute the dimensioning of link capacities and a demand flow assignment for the given paths.
1. Identify missing elements in the current model for DR-U and explain changes for implementation.
2. Interpret your results, explaining how your solution satisfies DR-U.

### 5. Optional: Expert Tasks
To strengthen your practical experience, solve the following optional tasks.
#### 5.1 Cube Network
Revisit the path diversity problem from Task 3, replacing the network with the cube network. Compute a path diversity solution with a diversity factor nd = 3.
1. Describe how your δedp (delta) is constructed for the cube network. Any modifications to the model or data?
2. Interpret your results with respect to the network design problem.

#### 5.2 A Design Problem of Your Choice
Take another protection or restoration (LP) design problem from the lecture, implement it, and compute a solution.

## Resources
- [IBM ILOG CPLEX Optimization Studio](https://www.ibm.com/products/ilog-cplex-optimization-studio)
- [OPL Video Tutorials](#)
- [IBM Knowledge Center](#)
- [OPL Language Reference Manual](#)

## Deadline
The deadline for submitting Exercise Sheet 2 is [10.11.2023]. 
