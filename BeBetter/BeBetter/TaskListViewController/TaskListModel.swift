import Foundation

protocol TaskListModelType {
    var tasks: [Task] { get set }
}

class TaskListModel: TaskListModelType {
    var tasks: [Task]

    init(tasks: [Task]) {
        self.tasks = tasks
    }
}
