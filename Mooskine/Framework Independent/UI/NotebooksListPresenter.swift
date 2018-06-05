struct NotebooksListPresenter {

    let repository: NotebookRepository

    init(repository: NotebookRepository) {
        self.repository = repository
    }

    func add(notebookName: String) {
        repository.save(notebook: Notebook(name: notebookName))
    }
}
