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
}
