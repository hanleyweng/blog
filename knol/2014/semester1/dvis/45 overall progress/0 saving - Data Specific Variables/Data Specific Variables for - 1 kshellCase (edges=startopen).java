// ----------------------------
// DATA SPECIFIC VARIABLES
String fileName = "1 kshellCase (edges=startopen).gexf";

// - DIRECTION
boolean distanceGraphIsDirected = false;

// - TIME BOUNDS
boolean timeIsUnixTime = false;
float numberOfDays = 0;
double timeStepLength = 1; // X days // TimeStep defines the period in which a snapshot of the network is taken.
double timeStepIncrementPctgOfTimeStepLength = 1;
double[] timeRangeOfData = { 0, 3 + 1 }; // actually; for kshellCase, timestamps only exist at 1,2,3 - an extended timeRange-end is required (as the last timestamp is treated as a null point -
											// where everything ceases to exist)

// - PROCESS PROPAGATION
int processProp_hopMaximum = -1; // -1 = not yet calculated
int processProp_hopMaximumToRender = 5 + 1; // should be less than processProp_hopMaximum

// - DATA MAPPING
// NOTE - exported file changes the xyz position, so note positions in this file instead of original
float dataXmidpoint = 0;
float dataYmidpoint = 0;
float dataZmidpoint = 0;
// float dataBoundsFromMidpoint = 0.5f;
float dataBoundsFromMidpoint = 100f;
// float dataBoundsFromMidpoint = 1500f;

// - METRIC BOUNDS
int[] valueRange_degree = { 0, 4 };
int[] valueRange_betweenness = { 0, 36 };
int[] valueRange_kcoreMax = { 0, 3 + 1 };
int[] valueRange_staticModularity = { 0, 16 + 1 };
int[] displayRange_size = { 4, 40 };