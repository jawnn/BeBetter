import UIKit

protocol TaskListPresenterType: AnyObject, UITableViewDataSource {
    func updateTaskToComplete(index: Int)
}

protocol TaskListType: AnyObject {
    func reloadUI()
}

class TaskListPresenter: NSObject, TaskListPresenterType {

    var model: TaskListModelType
    var view: TaskListType

    init(model: TaskListModelType, view: TaskListType) {
        self.model = model
        self.view = view
    }

    func updateTaskToComplete(index: Int) {
        model.tasks[index].isDone.toggle()
        view.reloadUI()
    }

}

extension TaskListPresenter {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        let task = model.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        cell.accessoryType = task.isDone ? .checkmark : .none
        return cell
    }

}
