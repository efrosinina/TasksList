//
//  Extension+UIView.swift
//  TasksListRealm
//
//  Created by Елизавета Ефросинина on 09/07/2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
