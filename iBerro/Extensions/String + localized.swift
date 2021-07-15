//
//  LocalizedFunc.swift
//  iBerro
//
//  Created by Pedro Henrique Spínola de Assis on 05/07/21.
//

import Foundation

extension String {
    func localized() -> String{
        return NSLocalizedString(
            self,
            tableName: "LanguageStrings",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
