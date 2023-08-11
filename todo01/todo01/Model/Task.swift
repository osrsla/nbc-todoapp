//
//  File.swift
//  todo01
//
//  Created by SR on 2023/08/10.
//

import Foundation
import UIKit

struct Task {
    var title: String
    var isCompleted: Bool = false

    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }

    func completeToggled() -> Task {
        return Task(title: title, isCompleted: !isCompleted)
    }
}
