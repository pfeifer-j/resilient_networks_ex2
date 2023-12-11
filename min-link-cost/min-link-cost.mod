/*********************************************
 * OPL 12.6.3.0 Model
 * Author: Mathias Fischer
 * Creation Date: 26.11.2016
 *********************************************/
using CPLEX; // Simplex-Solver

execute {
	writeln("Optimization problem: calculation of minimum link costs");
}

//----------------------------------
// Indices
//----------------------------------

// number of links
int nblinks = ...; 
// link indices
range link_range = 1 .. nblinks; 

// number of demands
int nbdemands = ...;
// demand indices
range demand_range = 1 .. nbdemands;

/**
 * Please note:
 * The indices of candidate paths per demand is given here in a slightly 
 * different format than in the design problems treated in the lecture:
 * We establish one ordered list starting with all paths for demand 1 and
 * ending with all paths for demand d.s
 */
// number of all paths for all demands
int nbpaths = ...;
// p = 1,2,..., P_d link or node disjoint candidate paths for demand d
// Concatenation of all these paths for all demands  1, 2, ..., P_1, 1, 2, ..., P_2, ... 
range path_range = 1 .. nbpaths;
// number of candidate paths per demand (to map path_range to demands again)
int candidate_paths[demand_range] = ...;
// we need the index of the first path for a certain demand in the list of all 
// paths so that we know which paths from the path range belong to which demands
int cpaths[demand_range];
int counter = 1;
execute {
	for(var i in demand_range) {
		cpaths[i] = counter;
		//writeln("demand " + i + ", counter " + counter);
		counter = counter + candidate_paths[i];
	}
}

//----------------------------------
// Constants
//----------------------------------

// Delta_edp  = 1 if link e belongs to path p for demand d
int delta[link_range][path_range] = ...;

// Demand volume h
int h[demand_range] = ...; 

// Marginal (unit) cost of link e (theta_e)
int theta[link_range] = ...;

// constant that limits the search space for variables
int maxSize = ...;
range maxRange = 0 .. maxSize;

//----------------------------------
// Variables
// dvar = decision variable
//----------------------------------
// Path flow variables
dvar int+ x_dp[path_range] in maxRange;
// Capacity per link variables
dvar int+ y[link_range] in maxRange;

//----------------------------------
// Objective
//----------------------------------
minimize sum(e in link_range) theta[e] * y[e];

//----------------------------------
// Constraints
//----------------------------------
subject to {
	// Path flow constraints
	forall(d in demand_range)
		sum(p in (1 .. candidate_paths[d])) x_dp[cpaths[d]+p-1] == h[d];
	
	// Capacity constraints
	forall(e in link_range) {
		sum(d in demand_range) sum(p in (1 .. candidate_paths[d])) delta[e][cpaths[d]+p-1] * x_dp[cpaths[d]+p-1] <= y[e];
	}
}