struct NodeRelation: CustomStringConvertible {
    let parent: Int
    let child: Int
    let direction: String

    init(parent p: Int, child c: Int, direction d: String) {
        parent = p
        child = c
        direction = d
    }

    var description: String {
        return "p \(parent) c \(child) d \(direction)"
    }
}
