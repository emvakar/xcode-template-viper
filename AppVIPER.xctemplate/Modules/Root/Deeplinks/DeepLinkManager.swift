//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import UIKit

let Deeplinker = DeepLinkManager()

class DeepLinkManager {

    fileprivate init() { }

    private var deeplinkType: DeeplinkType?

    @discardableResult
    func handleShortcut(item: UIApplicationShortcutItem) -> Bool {
        deeplinkType = ShortcutParser.shared.handleShortcut(item)
        return deeplinkType != nil
    }

    @discardableResult
    func handleDeeplink(url: URL) -> Bool {
        deeplinkType = DeeplinkParser.shared.parseDeepLink(url)
        if deeplinkType != nil {
            checkDeepLink()
            return true
        }
        return deeplinkType != nil
    }

    func handleRemoteNotification(_ notification: [AnyHashable: Any]) {
        deeplinkType = NotificationParser.shared.handleNotification(notification)
    }

    // check existing deepling and perform action
    func checkDeepLink() {
        SceneDelegate.shared.rootViewController.deeplink = deeplinkType
        // reset deeplink after handling
        self.deeplinkType = nil
    }

}
