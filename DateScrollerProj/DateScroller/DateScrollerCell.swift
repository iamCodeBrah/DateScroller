//
//  DateScrollerCell.swift
//  DateScrollerProj
//
//  Created by YouTube on 2023-03-16.
//

import UIKit

class DateScrollerCell: UICollectionViewCell {
    
    static let identifier = "DateScrollerCell"
    
    // MARK: - Variables
    private(set) var date: Date!
    
    // MARK: - UI Components
    private(set) var dayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "-1"
        return label
    }()
    
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with date: Date) {
        self.date = date
        
        if let day = Calendar.current.dateComponents([.day], from: date).day {
            self.dayLabel.text = day.description
        }
    }
    
    public func setSelection(with selectedDate: Date) {
        let selected = DateHelpers.isSameDay(selectedDate, self.date)
        
        self.backgroundColor = selected ? .systemBlue : .systemBackground
        
        if DateHelpers.isToday(self.date) {
            self.dayLabel.textColor = selected ? .white : .systemBlue
        } else {
            self.dayLabel.textColor = selected ? .white : .label
        }
    }
    
    
    // MARK: - UI Setup
    private func setupUI() {
        self.layer.cornerRadius = self.frame.height/2
        
        self.addSubview(dayLabel)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: self.topAnchor),
            dayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dayLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
