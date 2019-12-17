//
//  String Extension.swift
//  FavoritePodcasts
//
//  Created by Gregory Keeley on 12/17/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

extension String {
  static func getISOFormatter() -> ISO8601DateFormatter {
    let isoDateFormatter = ISO8601DateFormatter()
      isoDateFormatter.timeZone = .current
      isoDateFormatter.formatOptions = [
        .withInternetDateTime,
        .withFullDate,
        .withFullTime,
        .withFractionalSeconds,
        .withColonSeparatorInTimeZone
      ]
    return isoDateFormatter
  }
  static func getISOTimestamp() -> String {
    let isoDateFormatter = getISOFormatter()
    let timestamp = isoDateFormatter.string(from: Date())
    return timestamp
  }
    
  func convertISODate() -> String {
    let isoDateFormatter = String.getISOFormatter()
    guard let date = isoDateFormatter.date(from: self) else {
      return self
    }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    let dateString = dateFormatter.string(from: date)
    return dateString
  }
  func isoStringToDate() -> Date {
    let isoDateFormatter = String.getISOFormatter()
    guard let date = isoDateFormatter.date(from: self) else {
      return Date()
    }
    return date
  }
}
