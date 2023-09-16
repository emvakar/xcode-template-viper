//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import Foundation

class SuffixFormatter {

    var strOne: String
    var strFew: String
    var strMany: String

    init(one: String, few: String, many: String) {
        self.strOne = one
        self.strFew = few
        self.strMany = many
    }

    func formatWithNumber(number: Int) -> String {
        let number = number % 100

        let firstDigit = number / 10
        let lastDigit = number % 10

        if firstDigit == 1 {
            return self.strMany
        } else if lastDigit == 1 {
            return self.strOne
        } else if (lastDigit >= 2) && (lastDigit <= 4) {
            return self.strFew
        }

        return self.strMany
    }
}
