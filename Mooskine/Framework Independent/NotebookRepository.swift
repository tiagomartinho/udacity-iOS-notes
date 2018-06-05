protocol NotebookRepository {
    var delegate: NotebookRepositoryDelegate? { get set }
    func save(notebook: Notebook)
}

protocol NotebookRepositoryDelegate {
    func updatedNotebooks()
}
