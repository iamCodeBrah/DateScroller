//
//  DateHelpers.swift
//  DateScrollerProj
//
//  Created by YouTube on 2023-03-16.
//

import Foundation

class DateHelpers {
    
    /// Returns the weekday component for given date.
    /// Example: Sunday = 1, Monday = 2, etc...
    public static func getWeekdayNumber(for date: Date) -> Int {
        
        if let weekdayNumber = Calendar.current.dateComponents([.weekday], from: date).weekday {
            return weekdayNumber
        } else {
            return -1
        }
    }
    
    /// Adds or removes days from a given date
    /// - Parameters:
    ///   - date: The given date you want to add or remove days from
    ///   - offset: The offset in days
    public static func addDays(_ date: Date, offset: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: offset, to: date)!
    }
    
    /// Returns the past sunday for any given date
    public static func getSunday(for date: Date) -> Date {
        var date = date
        var weekday = self.getWeekdayNumber(for: date)
        
        while (weekday != 1) {
            date = self.addDays(date, offset: -1)
            weekday = self.getWeekdayNumber(for: date)
        }
        
        return date
    }
    
    
    public static func getMonthAndDayString(for date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "MMMM d, yyyy"
        return df.string(from: date)
    }
    
    /// Checks if a given date is today
    public static func isToday(_ date: Date) -> Bool {
        let df = DateFormatter()
        df.dateFormat = "MMM d, yyyy"
        
        if df.string(from: Date()) == df.string(from: date) {
            return true
        }
        
        return false
    }
    
    /// Checks if two dates are the same day, month and year.
    public static func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        let df = DateFormatter()
        df.dateFormat = "MMM d, yyyy"
        
        if df.string(from: date1) == df.string(from: date2) {
            return true
        }
        
        return false
    }
    
}
