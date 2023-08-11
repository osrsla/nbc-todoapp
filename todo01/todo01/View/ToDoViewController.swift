//
//  ViewController.swift
//  todo01
//
//  Created by SR on 2023/08/10.
//

import UIKit

class ToDoViewController: UIViewController {
    var tasks = [
        Task(title: "꿀잠!!"),
        Task(title: "맛점!!"),
        Task(title: "드라마 시청!!")
    ]
    @IBOutlet var ToDotableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ToDoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Completed") { _, _, complete in

            let task = self.tasks[indexPath.row].completeToggled()
            self.tasks[indexPath.row] = task

            let cell = tableView.cellForRow(at: indexPath) as! ToDoCell
            cell.set(checked: task.isCompleted)

            complete(true)

            print("completed")
        }

        return UISwipeActionsConfiguration(actions: [action])
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
}

extension ToDoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checked cell", for: indexPath) as! ToDoCell

        cell.delegate = self

        let task = tasks[indexPath.row]

        cell.set(title: task.title, checked: task.isCompleted)

        return cell
    }
}

extension ToDoViewController: ToDoCellDelegate {
    func ToDoCell(_ cell: ToDoCell, didChagneCheckedState checked: Bool) {
        guard let indexPath = ToDotableView.indexPath(for: cell) else {
            return
        }
        let task = tasks[indexPath.row]
        let newTask = Task(title: task.title, isCompleted: checked)

        tasks[indexPath.row] = newTask
    }
}
