//
//  DateScrollerViewModel.swift
//  DateScrollerProj
//
//  Created by YouTube on 2023-03-16.
//

import Foundation

class DateScrollerViewModel {
    
    enum SwipeDirection {
        case left
        case right
    }
    
    var onUpdate: (() -> Void)?
    
    // MARK: - Variables
    private(set) var selectedDate: Date = Date()
    private(set) var currentSunday: Date
    
    // MARK: - Initializers
    init() {
        currentSunday = DateHelpers.getSunday(for: selectedDate)
    }
    
    
    // MARK: - Setters
    public func setSelectedDate(with selectedDate: Date) {
        self.selectedDate = selectedDate
    }
    
    public func updateSunday(direction: SwipeDirection) {
        let newDate = DateHelpers.addDays(currentSunday, offset: direction == .right ? -7 : 7)
        currentSunday = DateHelpers.getSunday(for: newDate)
        self.onUpdate?()
    }
    
}
