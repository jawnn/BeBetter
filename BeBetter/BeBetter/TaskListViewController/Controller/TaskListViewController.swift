import UIKit

class TaskListViewController: UIViewController {

    @IBOutlet var addTaskButton: UIButton!
    @IBOutlet var tableView: UITableView!

    var presenter: TaskListPresenterType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGray5
        addTaskButton.layer.cornerRadius = 3

        tableView.dataSource = presenter
        tableView.delegate = self
    }

}

extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.updateTaskToComplete(index: indexPath.row)
    }
}

extension TaskListViewController: TaskListType {
    func reloadUI() {
        tableView.reloadData()
    }
}
