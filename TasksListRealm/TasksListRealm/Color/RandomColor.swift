//
//  RandomColor.swift
//  TasksListRealm
//
//  Created by Елизавета Ефросинина on 09/07/2023.
//

import UIKit

struct RandomColor {
    private let colors: [UIColor] = [.red, .blue, .brown, .magenta, .orange, .purple, .systemBlue]
    private var currentColor = UIColor()
    
    public var color: UIColor {
        return currentColor
    }
    
    init() {
        currentColor = colorRandom()
    }
    
    private func colorRandom() -> UIColor {
        let index = Int.random(in: 0..<colors.count)
        return colors[index]
    }
}
