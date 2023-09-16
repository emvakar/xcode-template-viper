//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import Foundation

class NotificationParser {

    static let shared = NotificationParser()

    private init() { }

    func handleNotification(_ userInfo: [AnyHashable: Any]) -> DeeplinkType? {
        if let main = userInfo["main"] as? String {
            return DeeplinkType.main
        }
        return nil
    }

}
