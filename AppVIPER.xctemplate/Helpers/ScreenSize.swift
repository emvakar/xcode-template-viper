//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import UIKit

enum ScreenSize {

    static let bounds: CGRect = (UIScreen.main.bounds)
    static let width: CGFloat = (bounds.width)
    static let height: CGFloat = (bounds.height)
    static let maxLength: CGFloat = (max(width, height))
    static let minLength: CGFloat = (min(width, height))

    static let isIpad = (UIDevice.current.userInterfaceIdiom == .pad)
    static let isIphone = (UIDevice.current.userInterfaceIdiom == .phone)
    static let isRetina = (UIScreen.main.scale >= 2.0)
    static let isIphone4 = (isIphone && maxLength < 568.0)
    static let isIphone5 = (isIphone && maxLength == 568.0)
    static let isIphone6 = (isIphone && maxLength == 667.0)
    static let isIphone6Plus = (isIphone && maxLength == 736.0)
    static let isIphoneX = (isIphone && maxLength == 812.0)
    static let isIphoneXMax = (isIphone && maxLength == 896.0)
    static let isIphoneXFamily = (isIphone && maxLength / minLength > 2.0)

    static let topOffset: CGFloat = isIphoneXFamily ? 24.0 : 0.0
    static let bottomOffset: CGFloat = isIphoneXFamily ? 34.0 : 0.0

    static var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
        .filter({ $0.activationState == .foregroundActive })
        .compactMap({ $0 as? UIWindowScene })
        .first?.windows
        .filter({ $0.isKeyWindow }).first
    }

    static let statusBarSize = keyWindow?.windowScene?.statusBarManager?.statusBarFrame.size ?? .zero

    static let statusBarHeight = statusBarSize.height

    static let tabBarHeight: CGFloat = 49
    static let customTabBarHeight: CGFloat = 61.scale

}

extension CGRect {

    func bounds() -> CGRect {
        var rect = self
        rect.origin = CGPoint.zero
        return rect
    }

}
