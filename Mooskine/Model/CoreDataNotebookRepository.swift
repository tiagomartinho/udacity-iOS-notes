class CoreDataNotebookRepository: NotebookRepository {

    let dataController: DataController

    init(dataController: DataController) {
        self.dataController = dataController
    }

    func save(notebook: Notebook) {
        let coreDataNotebook = CoreDataNotebook(context: dataController.viewContext)
        coreDataNotebook.name = notebook.name
        try? dataController.viewContext.save()
    }
}
