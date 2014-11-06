using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

// ----------------- EDGE -------------------------


/**
* Note - at any one time, an edge can have multiple DynamicEdgeAttributes in operation.
* These are formed as a single instance here, rather than multiple TimeRangedValues as the original GEXF groups them together. 
*/
public class TimeRangedEdgeAttribute 
{
	public string eventTitle;
	public float weight;
	public string start, end;
	
	public TimeRangedEdgeAttribute()
	{
	}
}

public class DynamicEdgeAttributes
{
	public List<TimeRangedEdgeAttribute> timeRangedAttributes;
	
	public DynamicEdgeAttributes()
	{
		timeRangedAttributes = new List<TimeRangedEdgeAttribute>();
	}
	
	public List<TimeRangedEdgeAttribute> edgeAttributesAtTime (string time) {
		List<TimeRangedEdgeAttribute> list = new List<TimeRangedEdgeAttribute>();

		foreach (TimeRangedEdgeAttribute trAtt in timeRangedAttributes) {
			if ( (trAtt.start.CompareTo(time)==-1) || (trAtt.start.CompareTo(time)==0)) {
				if (trAtt.end.CompareTo(time)==1) {
					list.Add(trAtt);
				}
			}
		}
		
		return list;
	}
	
	public float edgeWeightAtTime(string time) {
		float totalWeight = 0.0f;
		List<TimeRangedEdgeAttribute> curAtts = this.edgeAttributesAtTime(time);
		foreach (TimeRangedEdgeAttribute trAtt in curAtts) {
			totalWeight += trAtt.weight;
		}
		return totalWeight;
	}
}

public class Edge 
{
	// Mathematical Values
	public DynamicEdgeAttributes dynamicAttributes;
	public Node source, target;
	
	// Render Values
	public LineRenderer lineRenderer;
	public float width = 1.0f;
	
	public ActionOnEdge_changeWidth actionChangeWidth;
	
	public Edge(Node source, Node target) 
	{
		this.source = source;
		this.target = target;
		dynamicAttributes = new DynamicEdgeAttributes();
		
		this.Render_Start();
	}
	public void Render_Start() {
		lineRenderer = new GameObject().AddComponent("LineRenderer") as LineRenderer;
		lineRenderer.material = new Material(Shader.Find("Particles/Additive"));
		lineRenderer.SetColors(Color.white, Color.white);
		lineRenderer.SetWidth(width, width);
	}
	public void Render_Update(string time = "0") {
//		// Update Position of Line
		lineRenderer.SetPosition(0, this.source.position );
		lineRenderer.SetPosition(1, this.target.position );
	}
}

public class ActionOnEdge_changeWidth
{
	public bool isFinished = false;
	
	Edge edge;
	float originalValue, targetValue;
	float elapsedTime = 0.0f;
	float duration;
	
	public ActionOnEdge_changeWidth(Edge edge, float targetValue, float duration = 1.0f, float delay = 0.0f) {
		this.edge = edge;
		this.originalValue = edge.width;
		this.targetValue = targetValue;
		this.duration = duration;
		
		// get current time - for now, let's pretend we're operating at 60 fps
	}
	public void update() {
		
		if (!isFinished) {
			elapsedTime += 1.0f/60; // pretending we're operating at 60 fps
			if (elapsedTime>duration) elapsedTime=duration;
			
			float newValue = elapsedTime/duration * (targetValue-originalValue) + originalValue;
			
			// treated edge value
			if (newValue == 1) newValue = 0.5f;
			newValue *= newValue;
			edge.lineRenderer.SetWidth(newValue, newValue);
			
			if (elapsedTime == duration) {
				isFinished = true;
			}
			
		}
		
	}
}
























