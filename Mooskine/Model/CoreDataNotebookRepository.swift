import CoreData

class CoreDataNotebookRepository: NSObject, NotebookRepository {

    let dataController: DataController

    var delegate: NotebookRepositoryDelegate?

    init(dataController: DataController) {
        self.dataController = dataController
    }

    func save(notebook: Notebook) {
        let coreDataNotebook = CoreDataNotebook(context: dataController.viewContext)
        coreDataNotebook.name = notebook.name
        try? dataController.viewContext.save()
    }
}

extension CoreDataNotebookRepository: NSFetchedResultsControllerDelegate{

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        delegate?.updatedNotebooks()
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        delegate?.updatedNotebooks()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        delegate?.updatedNotebooks()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        delegate?.updatedNotebooks()
    }
}
