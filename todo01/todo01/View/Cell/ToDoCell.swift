//
//  ToDoCell.swift
//  todo01
//
//  Created by SR on 2023/08/10.
//

import UIKit

protocol ToDoCellDelegate: AnyObject {
    func ToDoCell(_ cell: ToDoCell, didChagneCheckedState checked: Bool)
}

class ToDoCell: UITableViewCell {
    @IBOutlet var checkbox: CheckBox!
    @IBOutlet var label: UILabel!

    weak var delegate: ToDoCellDelegate?

    // 체크박스 클릭 시 중간 실선
    @IBAction func checked(_ sender: CheckBox) {
        updateChecked()
        delegate?.ToDoCell(self, didChagneCheckedState: checkbox.checked)
    }

    func set(title: String, checked: Bool) {
        label.text = title
        set(checked: checked)
    }

    func set(checked: Bool) {
        checkbox.checked = checked
        updateChecked()
    }

    private func updateChecked() {
        let attributedString = NSMutableAttributedString(string: label.text!)

        if checkbox.checked {
            attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length-1))

        } else {
            attributedString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributedString.length-1))
        }
        label.attributedText = attributedString
    }
}
