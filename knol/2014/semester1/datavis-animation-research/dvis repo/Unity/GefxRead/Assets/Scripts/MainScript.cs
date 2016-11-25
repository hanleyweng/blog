using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using System.Xml;

public class MainScript : MonoBehaviour 
{	
	public GameObject nodeGameObject;
	
	DynamicNetwork graph = new DynamicNetwork();
	
	// Use this for initialization
	void Start () {
		
		//
		
		
		
		
		
		
		
		//
		
		XmlDocument xml = new XmlDocument();
		xml.Load(UnityEngine.Application.dataPath+"/"+"TextFiles/"+"MEventsGephiExport_withDynamicDegree_OmmittedNamespace.xml");
		
		// NOTE - In translating GEFX to XML that is parseable in Unity, Namespaces have been ommited from the GEFX file.
		
		// NOTE - The conversion from XML to Objects could be handled instead via deserialization.
		
		// ---
		// Get Nodes
		var nodeList = xml.SelectSingleNode("gexf").SelectSingleNode("graph").SelectSingleNode("nodes").SelectNodes("node");
		
		for (int i=0; i<  nodeList.Count; i++) {
			var childNode = nodeList.Item(i);
			var id = childNode.Attributes.GetNamedItem("id").Value;
			
			float x = float.Parse(childNode.SelectSingleNode("vizposition").Attributes.GetNamedItem("x").Value);
			float y = float.Parse(childNode.SelectSingleNode("vizposition").Attributes.GetNamedItem("y").Value);
			float z = float.Parse(childNode.SelectSingleNode("vizposition").Attributes.GetNamedItem("z").Value);
			Vector3 xyz = new Vector3(x,y,z);
			
			// Create Node Representation - Note - It has to be created here as nodeGameObject is here and that variable can't be passed to the Node Class for instantiation without passing where to instantiate too (this) (class MainScript).
			Quaternion zeroRotation = Quaternion.identity; //no rotation
			GameObject nodeRepresentationObject = (GameObject)Instantiate(nodeGameObject, xyz, zeroRotation);
			
			// Create Node
			Node node = new Node(id, xyz, nodeRepresentationObject);
			
			// Initialize Dynamic Degree
			DynamicValue dynamicDegree = new DynamicValue();
			
			// Get Attributes of Node
			var attNodes = childNode.SelectSingleNode("attvalues").SelectNodes("attvalue"); 
			for (int j=0; j < attNodes.Count; j++) {
				
				var attNode = attNodes.Item(j);
				var attTitle = attNode.Attributes.GetNamedItem("for").Value;
				
				// Handle Dynamic Degree
				if (attTitle.Equals("dynamic_degree")) {
					int attValue = int.Parse(attNode.Attributes.GetNamedItem("value").Value);
					var attStart = attNode.Attributes.GetNamedItem("start").Value;
					var attEnd = attNode.Attributes.GetNamedItem("end").Value;
					
					// Get DynamicDegree_Instance of Node
					TimeRangedValue staticAtt = new TimeRangedValue(attValue, attStart, attEnd);
					dynamicDegree.values.Add(staticAtt);
				}
			}
			
			// Add DynamicDegree to Node
			node.dynamicDegree = dynamicDegree;
			
			// Add Node to Graph
			graph.nodes.Add(node);
		}
		
		//---
		// Get Edges
		var edgeList = xml.SelectSingleNode("gexf").SelectSingleNode("graph").SelectSingleNode("edges").SelectNodes("edge");
		for (int i=0; i<edgeList.Count; i++) {
			var childNode = edgeList.Item(i);
			
			var source = childNode.Attributes.GetNamedItem("source").Value;
			var target = childNode.Attributes.GetNamedItem("target").Value;
			
			
			// Check if an edge with this source and target exists yet
			// if it doesn't exist then create it
			Edge edge = graph.edgeWithNodes(graph.nodeWithId(source), graph.nodeWithId(target));
			if (edge == null) {
				edge = new Edge(graph.nodeWithId(source), graph.nodeWithId(target));
				graph.edges.Add(edge);
			}
			
			// Load Time Ranged Attributes
			//			var id = childNode.Attributes.GetNamedItem("id").Value;
			var eventTitle = childNode.Attributes.GetNamedItem("id").Value; // - this may change as the data changes
			
			float weight = 1.0f; //by default an edge with no weight attribute is assumed to have a weight of 1 during this timeRange
			try {
				weight = float.Parse(childNode.Attributes.GetNamedItem("weight").Value);
			} catch (Exception) {
			}
			var start = childNode.Attributes.GetNamedItem("start").Value;
			var end = childNode.Attributes.GetNamedItem("end").Value;
			
			
			// Create Time Ranged Edge Attribute
			TimeRangedEdgeAttribute trEdgeAtt = new TimeRangedEdgeAttribute();
			trEdgeAtt.eventTitle = eventTitle;
			trEdgeAtt.weight = weight;
			trEdgeAtt.start = start;
			trEdgeAtt.end = end;
			
			// Add TR_EdgeAttribute to the Edge's DynamicAttributes
			edge.dynamicAttributes.timeRangedAttributes.Add(trEdgeAtt);
			
		}
		
		
	}
	
	
	//-----------------------------------------------------------------------------------------------
	
	// Update is called once per frame
	void Update () {
		// step through time - in the format YYY-MM-DD, from 1984-01-01 to 2012-01-01
		// or i could do something easy and just step through years 1984-2012
		int yearStart = 1984;
		int yearRange = 2013-1984;
		int repYear = (int) (Time.frameCount/15)%yearRange + yearStart;
		string repDate = repYear+"-01-01";
		
		// DRAW
		graph.setNetworkTime(repDate);
		graph.Render_Update();
		
//		// Date Test
//		System.DateTime dtDateTime = new DateTime(1970,1,1,0,0,0);
//		print(dtDateTime);
//		dtDateTime = dtDateTime.AddDays(1);
//		print(dtDateTime);
//		
	}
	
	
	
	
}







