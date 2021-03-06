//
//  String+Localization.swift
//  PefFinder
//
//  Created by Kane on 2022/07/17.
//

import Foundation

extension String {

  var localized: String {
    return NSLocalizedString(self, comment: "\(self)_comment")
  }
  
//  func localized(_ args: [CVarArg]) -> String {
//    return localized(args)
//  }
//  
//  func localized(_ args: CVarArg...) -> String {
//    return String(format: localized, args)
//  }
}
