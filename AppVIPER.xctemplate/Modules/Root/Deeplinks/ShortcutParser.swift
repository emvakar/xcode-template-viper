//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import UIKit

enum ShortcutKey: String {
    case tmp = "com.emvakar.ios.___PACKAGENAME___.tmp"
}

class ShortcutParser {

    static let shared = ShortcutParser()
    private init() { }

    func registerShortcuts() {

    }

    func handleShortcut(_ shortcut: UIApplicationShortcutItem) -> DeeplinkType? {
        if shortcut == .tmp {
            return DeeplinkType.main
        }
        return nil
    }
}
