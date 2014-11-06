using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;


// ----------------- DYNAMIC NETWORK -------------------------

/**
* This dynamic network, or graph, contains Static/Dynamic Nodes and Edges.
*/
public class DynamicNetwork 
{
	public List<Node> nodes;
	
	public List<Edge> edges;
	
	string networkTime = "0";
	
	public DynamicNetwork()
	{
		nodes = new List<Node>();
		edges = new List<Edge>();
		
		// should initialize networkTime to the startTime of this dynamicNetwork
	}
	
	public void setNetworkTime(string newNetworkTime) {
	
		// Process Animation Triggers
		foreach (Node node in nodes) {
			int curDegree = node.dynamicDegree.valueAtTime(networkTime);
			int nxtDegree = node.dynamicDegree.valueAtTime(newNetworkTime);
			
			if (nxtDegree != curDegree) {
				// change the z-position of the node - trigger animation
				node.actionMoveZ = new ActionOnNode_moveZTo(node, nxtDegree*30, 0.25f);
			}
		}
		foreach (Edge edge in edges) {
			float curWeight = edge.dynamicAttributes.edgeWeightAtTime(networkTime);
			float nxtWeight = edge.dynamicAttributes.edgeWeightAtTime(newNetworkTime);
			if (nxtWeight != curWeight) {
				// change the line-width of the edge - trigger animation
				edge.actionChangeWidth = new ActionOnEdge_changeWidth(edge, nxtWeight, 0);
			}
		}
	}
	
	public void Render_Update() {
	
		// Basic Position Updates
		foreach(Node node in nodes) {
			if (node.actionMoveZ != null) {
				node.actionMoveZ.update();
				if (node.actionMoveZ.isFinished) node.actionMoveZ = null;
			}
			node.Render_Update();
		}
		foreach(Edge edge in edges) {
			if (edge.actionChangeWidth != null) {
				edge.actionChangeWidth.update();
				if (edge.actionChangeWidth.isFinished) edge.actionChangeWidth = null;
			}
			edge.Render_Update();
		}
	}
	
	
	
	
	
	
	
	
	public Node nodeWithId(string id) {
		foreach (Node node in nodes) {
			if (node.id.Equals(id)) {
				return node;
			}
		}
		Debug.LogError("Error: nodeWithId "+id+" not found.");
		return null;
	}
	
	public Edge edgeWithNodes(Node source, Node target) {
		foreach (Edge edge in edges) {
			if (edge.source.Equals(source) && edge.target.Equals(target)) {
				return edge;
			}
			// if (edge.source.Equals(target) && edge.target.Equals(source)) { return edge; }
		}
		return null;
	}
}