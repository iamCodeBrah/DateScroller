//
//  ViewController.swift
//  DateScrollerProj
//
//  Created by YouTube on 2023-03-16.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    let dateScroller: DateScroller
    
    // MARK: - Lifecycle
    init() {
        self.dateScroller = DateScroller()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.dateScroller.delegate = self
    }

    // MARK: - Setup UI
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = DateHelpers.getMonthAndDayString(for: Date())
        
        self.view.addSubview(dateScroller)
        dateScroller.translatesAutoresizingMaskIntoConstraints = false
//
        NSLayoutConstraint.activate([
            dateScroller.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            dateScroller.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            dateScroller.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            dateScroller.heightAnchor.constraint(equalToConstant: 88),
        ])
    }

}

extension ViewController: DateScrollerDelegate {
    
    func didChangeDate(with date: Date) {
        self.navigationItem.title = DateHelpers.getMonthAndDayString(for: date)
    }
}
