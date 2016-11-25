using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

// ----------------- NODE -------------------------

/**
* This is a node of a graph/network.
*/
public class Node 
{
	// Math Values
	public string id;
	public Vector3 position;
	public DynamicValue dynamicDegree;
	
	// Render Values
	public GameObject nodeObject;
	
	public ActionOnNode_moveZTo actionMoveZ;
	
	public Node(string id, Vector3 position, GameObject nodeObject) 
	{
		this.id = id;
		this.position = position;
		dynamicDegree = new DynamicValue();
		
		this.Render_Start (nodeObject);
	}
	public void Render_Start(GameObject nodeObject) {
		this.nodeObject = nodeObject;
	}
	public void Render_Update() {
		nodeObject.transform.position = position;
	}
}

public class ActionOnNode_moveZTo
{
	public bool isFinished = false;
	
	Node node;
	float originalz, targetz;
	float elapsedTime = 0.0f;
	float duration;
	
	public ActionOnNode_moveZTo(Node node, float targetz, float duration = 1.0f, float delay = 0.0f) {
		this.node = node;
		this.originalz = node.position.z;
		this.targetz = targetz;
		this.duration = duration;
		
		// get current time - for now, let's pretend we're operating at 60 fps
	}
	public void update() {
		
		if (!isFinished) {
			elapsedTime += 1.0f/60; // pretending we're operating at 60 fps
			if (elapsedTime>duration) elapsedTime=duration;
			
			float newz = elapsedTime/duration * (targetz-originalz) + originalz;
			Vector3 newNodePosition = new Vector3(node.position.x,node.position.y, newz);
			node.position = newNodePosition;
			
			if (elapsedTime == duration) {
				isFinished = true;
			}
			
		}
		
	}
}















/**
* This is a dynamic attribute which is  composed of time-based values.
*/ 
public class DynamicValue 
{
	public List<TimeRangedValue> values;
	public DynamicValue()
	{
		values = new List<TimeRangedValue>();
	}
	/*
	* Time in the format YYYY-MM-DD
	*/
	public int valueAtTime(string time) {
		// Assumption: GEFX stores dynamic attributes in ascending increments of time.
		
		// Note - outliers at start and end of this time sequence are not currently treated
		
		// for each ascending timestamped_value, if endtime is greater than the current time, return the timestamped_value's value.
		foreach (TimeRangedValue tsvalue in values) {
			if (tsvalue.end.CompareTo(time)==1) {
				return tsvalue.value;
			}
		}
		
		return 0;
	}
}
/**
* This is a time-ranged-value which has a value and can have a start and end time.
*/
public class TimeRangedValue 
{
	public int value;
	public string start, end;
	public TimeRangedValue (int value, string start, string end)
	{
		this.value = value;
		this.start = start;
		this.end = end;
	}
}