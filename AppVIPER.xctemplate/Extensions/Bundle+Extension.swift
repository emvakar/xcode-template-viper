//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import UIKit

extension Bundle {

    static func version() -> String {
        let dictionary = Bundle.main.infoDictionary
        return (dictionary?["CFBundleShortVersionString"] as? String) ?? "1.0.0"
    }

    static func build() -> String {
        let dictionary = Bundle.main.infoDictionary
        return (dictionary?["CFBundleVersion"] as? String) ?? "1"
    }

}

