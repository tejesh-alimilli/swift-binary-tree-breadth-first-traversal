let input = "10 20 L 10 30 R 20 40 L 20 50 R 40 60 L 40 70 R"

var tokens = input.split(separator: " ")

var nodeRelationsList = Array<NodeRelation>()

while tokens.count > 0 {
  if let p = tokens.first, let parentValue = Int(p) {
    tokens.removeFirst()
    if let c = tokens.first, let childValue = Int(c) {
      tokens.removeFirst()
      if let d = tokens.first {
        tokens.removeFirst()
        let direction = String(d)
        let relation = NodeRelation(parent: parentValue, child: childValue, direction: direction)
        nodeRelationsList.append(relation)
      }
    }
  }
}

let bTree = BinaryTree(Node(nodeRelationsList.first!.parent))
nodeRelationsList.forEach() { r in bTree.addNodeRelation(r) }

let nodes = bTree.getNodesBreadthFirst()

print("nodes in order")
for node in nodes {
  print("\(node.data)")
}
