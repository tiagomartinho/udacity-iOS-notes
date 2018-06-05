struct NotebooksListPresenter {

    var repository: NotebookRepository!

    init(repository: NotebookRepository) {
        self.repository = repository
        repository.delegate = self
    }

    func add(notebookName: String) {
        repository.save(notebook: Notebook(name: notebookName))
    }
}

extension NotebooksListPresenter: NotebookRepositoryDelegate {
    func updatedNotebooks() {
//        view.updateNotebooks()
    }
}
