import XCTest
@testable import Mooskine

class NotebooksListPresenterTest: XCTestCase {


    func testCreateNotebookOnRepositoryWhensAdding() {
        let repository = SpyNotebookRepository()
        let presenter = NotebooksListPresenter(repository: repository)

        presenter.add(notebookName: "Name")

        XCTAssert(repository.saveWasCalled)
        XCTAssertEqual(Notebook(name: "Name"), repository.lastSavedNotebook)
    }

    class SpyNotebookRepository: NotebookRepository {

        var saveWasCalled = false
        var lastSavedNotebook: Notebook!

        func save(notebook: Notebook) {
            saveWasCalled = true
            lastSavedNotebook = notebook
        }
    }
}

struct Notebook {
    let name: String
}

extension Notebook: Equatable {
    static func == (lhs: Notebook, rhs: Notebook) -> Bool {
        return lhs.name == rhs.name
    }
}

protocol NotebookRepository {
    func save(notebook: Notebook)
}

struct NotebooksListPresenter {

    let repository: NotebookRepository

    init(repository: NotebookRepository) {
        self.repository = repository
    }

    func add(notebookName: String) {
        repository.save(notebook: Notebook(name: notebookName))
    }
}
