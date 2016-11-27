Keyboard-keys-determination algorithm (pseudocode):

enum Attribute {
	// Attributes are used to describe a Word

	// Each CandidateKey for the Keyboard is an Attribute
	// Not all Attributes are a Candidate Key

	// these are candidate-keys for the keyboard
    // attributes can be a specific SignWriting symbol, the rotation of a hand, indication that the word has ‘1+’ hand symbols

    attribute1, 
    attribute2, 
    …
}

// SignWritten Word
class Word {
	uniqueIdentifier (can be ‘symbolRepresentation’)
	symbolRepresentation
	attributes[Attribute]

	// It is possible for a Word to cosnist of a single attribute
	~ wordEqualsAttribute(attribute)
	~ weight = 1 // scales with 'Static' word-use-frequency
}

// Path Node
class Node(id, unassignedWords) {
	id = attribute, ~bool:container
	childNodes[node]

	unassignedWords[Word] = []
	assignedWords[Word] = []

	~ getChildNodesWithOneCharacter()
}

// PRE-DEFINED
let candidateAttributes[Attribute] //keyboard-keys-candidates
let wordDictionary[Word] //

// TREE CREATION
let rootNode = node(nil, wordDictionary)

let remainingCandidateAttributes = candidateAttributes
let trackedNodes = [rootNode]

let outputAttributePath:[Attribute] = []
let outputUniqueWordsByLevel:[[Word]] = []

//
let curLevelUniqueWords = []

// PER LEVEL

// Continue until no more trackedNodes or 
while !trackedNodes.isEmpty && !remainingCandidateAttributes.isEmpty {

	// DETERMINE FAIREST ATTRIBUTE (by looking at All Tracked-Nodes)
	let lowestTrackedInequality = infinity // this is the % point difference away from 50%. Smaller better.
	let fairestAttribute = nil
	for attribute in remainingCandidateAttributes {
		// Determine Inequality Score For Current Attribute
		let lowestAttributeInequality = infinity
		for node in trackedNodes {
			// Determine Inequality Score For Current Node/Cluster
			var matchedWordCount = 0
			for word in node.unassignedWords {
				if word.hasAttribute(attribute) { matchedWordCount++ }
			}
			let inequality = abs(50%-matchedWordCount/node.unassignedWords.count)
			if inequality < lowestAttributeInequality {
				lowestAttributeInequality = inequality
			}
		}
		// Update Overall Inequality Score
		if lowestAttributeInequality < lowestTrackedInequality {
			lowestTrackedInequality = lowestAttributeInequality
			fairestAttribute = attribute
		}
	}

	// CREATE NEW NODES FROM FAIREST ATTRIBUTE (and optionally update their words assignment-status)
	for node in trackedNodes {
		// Go through each word
		// unassign words that match fairest-attribute
		// create a list of words to be added to the new child
		// create child
		let childNodeWords[Word] = []
		for word in node.unassignedWords {
			if word.hasAttribute(fairestAttribute) {
				childNodeWords.add(word)
				node.unassignedWords.remove(word) //index-- check
			}
		}
		let childNode:Node = Node(fairestAttribute, childNodeWords)
		// Add ChildNode to TrackedNodes
		trackedNodes.add(childNode)
		// in this version of the algorithm, this tree structure is actually unnecessary
	}

	// Update Candidate Attribute
	outputAttributePath.add(fairestAttribute) // + print
	remainingCandidateAttributes.remove(fairestAttribute) // important to be removed prior to 'Untracking-check' below

	// UNTRACKING
	// (Optional) Check if Any Nodes should be marked Untracked (including previously tracked nodes, and new child nodes)
	// Determined, with Big-O, that this step is fairly expensive - if it is causing problems, then shift this algorithm to being done in post, yes it seems to be more efficient to track ALL NODES until complete.
	for node in trackedNodes {
		// HANDLE INDEPENDENT WORDS
		// Determine Independent Words
		for word in rootNode.unassignedWords {
			for attribute in remainingCandidateAttributes {
				if word.hasAttribute(attribute) {
					continue
				}
			}
			// Mark Independent Word as Assigned
			rootNode.unassignedWords.remove(word) //index-- check
			rootNode.assignedWords.add(word)
			curLevelUniqueWords.add(word) //~
		}

		// UNTRACK EMPTY NODE
		if rootNode.unassignedWords.isEmpty {
			trackedNodes.remove(rootNode) //index-- check
		}
	}
	outputUniqueWordsByLevel.add(curLevelUniqueWords)
	print(curLevelUniqueWords) // + (optional) track and print all 'assigned words' whilst the algorithm runs

}

// outer
print(outputAttributePath)
print(outputUniqueWordsByLevel)



// Continue until no more candidateAttributes or no more words

// Print Favoured Attribute at each step.

// Optimization Opportunities Notes:
	- refine: word.hasAttribute(attribute)
		- e.g. attributes not part of candidateKeys could be initially removed from words
		- words could progressively remove attributes as the algorithm runs…
	- moving the 'node-tracking' to being done in 'post' (in order to recognised words assigned at a particular level)

// Algorithm Note:
	- In One Sentence:
		- Continuously attempts to halve a set of attributed-words by slicing all previously-cut-slices along the existence of an attribute.
		- OR: Creating a balanced decision tree to select an item with boolean-attributes, where each Decision is defined by the Level of the Tree.
	- This is solely used to help evaluate candidate-key-attributes.
		- the Tree, nor the algorithm is intended for Search!


// From the Tree:
	- Words Associated with Root Node = Special-Keyboard-Keys
	- Words Associated with First few levels = Candidate-Special-Keyboard-Keys
	
	- Words at any Node should ideally not exceed ~5 (AutoCompletion space)
	- Only a limited number of Special-Keyboard-Keys can be assigned ~3-20

	- If Words go beyond limit, consider removing some special words or reconsidering the keyboardCandidateAttributes.

// With WordFrequency
	- Words are simply weighted proportional to frequency, rather than equally.

