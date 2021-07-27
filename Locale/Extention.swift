//
//  Extention.swift
//  Locale
//
//  Created by Mac Mini 2018 on 27.07.2021.
//

import Foundation

extension String {
    func localized(withComment comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
}
