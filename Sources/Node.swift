class Node {
    let data: Int
    var left: Node? = nil
    var right: Node? = nil

    init(_ d: Int) {
        data = d
    }

    @discardableResult func addNodeRelation(_ relation: NodeRelation) -> Bool {
        let child = Node(relation.child)
        if data == relation.parent {
            if relation.direction == "L" {
                left = child
                return true
            } else if relation.direction == "R" {
                right = child
                return true
            }
        }

        if let left = left {
            let success = left.addNodeRelation(relation)
            if success {
                return true
            }
        }
        if let right = right {
            return right.addNodeRelation(relation)
        }
        return false
    }

    func getChildrenDepthFirst() -> Array<Node> {
        var nodes = Array<Node>()
        if let left = left {
            nodes.append(left)
            nodes.append(contentsOf: left.getChildrenDepthFirst())
        }
        if let right = right {
            nodes.append(right)
            nodes.append(contentsOf: right.getChildrenDepthFirst())
        }
        return nodes
    }

    func getChildrenBreadthFirst(list listOfArrays: inout Array<Array<Node>>, currentDepth: Int) {
        if listOfArrays.count < currentDepth {
            listOfArrays.append(Array<Node>())
        }
        listOfArrays[currentDepth - 1].append(self)
        if let left = left {
            left.getChildrenBreadthFirst(list: &listOfArrays, currentDepth: currentDepth + 1)
        }
        if let right = right {
            right.getChildrenBreadthFirst(list: &listOfArrays, currentDepth: currentDepth + 1)
        }
    }
}
