//
//  UILabel+Extensions.swift
//  DateScrollerProj
//
//  Created by YouTube on 2023-03-16.
//

import UIKit


extension UILabel {
    static func createDateScrollerSubLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        return label
    }
}
