// ----------------------------
// DATA SPECIFIC VARIABLES

// NCBI-MAY DATA - SUGIYAMA
String fileName = "4c ncbi sugiyama-layout (edges=startopen).gexf";

// - DIRECTION
boolean distanceGraphIsDirected = true;

// - TIME BOUNDS
boolean timeIsUnixTime = false;
float numberOfDays = 0;
double timeStepLength = 1; // X days // TimeStep defines the period in which a snapshot of the network is taken.
double timeStepIncrementPctgOfTimeStepLength = 1;
double[] timeRangeOfData = { 0, 7 };

// - PROCESS PROPAGATION
int processProp_hopMaximum = 9;
int processProp_hopMaximumToRender = 7; // should be less than processProp_hopMaximum

// - DATA MAPPING
// NOTE - exported file changes the xyz position, so note positions in this file instead of original
float dataXmidpoint = 0;
float dataYmidpoint = 0;
float dataZmidpoint = 0;
float dataBoundsFromMidpoint = 1500f;

// - METRIC BOUNDS
int[] valueRange_degree = { 0, 13 };
int[] valueRange_betweenness = { 0, 300 };
int[] valueRange_kcoreMax = { 0, 6 + 1 };

int[] valueRange_staticModularity = { 0, 16 + 1 };
int[] displayRange_size = { 4, 40 };