//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import Foundation

final class DeeplinkParser {

    static let shared = DeeplinkParser()
    
    private init() { }

    func parseDeepLink(_ url: URL) -> DeeplinkType? {
        return nil
    }

}

// MARK: - Private

private extension DeeplinkParser {

    func parseInviteCode(components: URLComponents) -> DeeplinkType? {
        return nil
    }

}
