struct Notebook {
    let name: String
}

extension Notebook: Equatable {
    static func == (lhs: Notebook, rhs: Notebook) -> Bool {
        return lhs.name == rhs.name
    }
}
