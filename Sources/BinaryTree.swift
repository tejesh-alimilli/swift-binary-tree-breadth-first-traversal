class BinaryTree {
    let root: Node

    init(_ r: Node) {
        root = r
    }

    func addNodeRelation(_ relation: NodeRelation) {
        root.addNodeRelation(relation)
    }

    func getNodesDepthFirst() -> Array<Node> {
        var nodes = [root]
        nodes.append(contentsOf: root.getChildrenDepthFirst())
        return nodes
    }

    func getNodesBreadthFirst() -> Array<Node> {
        var listOfArrays = Array<Array<Node>>()
        root.getChildrenBreadthFirst(list: &listOfArrays, currentDepth: 1)
        
        var nodes = [Node]()
        for i in 0..<listOfArrays.count {
            let list = i.isMultiple(of: 2) ? listOfArrays[i].reversed() : listOfArrays[i]
            nodes.append(contentsOf: list)
        }
        return nodes
    }
}
