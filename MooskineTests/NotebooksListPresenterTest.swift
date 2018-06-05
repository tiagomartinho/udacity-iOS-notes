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
