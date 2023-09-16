//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import UIKit

protocol Scalable {

    var scale: Self { get }

}

extension CGFloat: Scalable {

    var scale: CGFloat {
        let designScreenWidth: CGFloat = 375
        let currentScreenWidth = UIScreen.main.bounds.size.width
        return self * currentScreenWidth / designScreenWidth
    }

    var safeScale: CGFloat {
        let designScreenWidth: CGFloat = 375
        let currentScreenWidth = UIScreen.main.bounds.size.width
        return CGFloat(roundf(Float(Double(self * currentScreenWidth / designScreenWidth))))
    }

    var unscale: CGFloat {
        let designScreenWidth: CGFloat = 375
        let currentScreenWidth = UIScreen.main.bounds.size.width
        return self / currentScreenWidth * designScreenWidth
    }

}

extension Int {

    var scale: CGFloat {
        return CGFloat(self).scale
    }

    var safeScale: CGFloat {
        return CGFloat(self).safeScale
    }

    var unscale: CGFloat {
        return CGFloat(self).unscale
    }

}

extension Double {

    var scale: CGFloat {
        return CGFloat(self).scale
    }

    var safeScale: CGFloat {
        return CGFloat(self).safeScale
    }

    var unscale: CGFloat {
        return CGFloat(self).unscale
    }

}

extension CGPoint: Scalable {

    var scale: CGPoint {
        return CGPoint(x: x.scale, y: y.scale)
    }

}

extension CGSize: Scalable {

    var scale: CGSize {
        return CGSize(width: width.scale, height: height.scale)
    }

}

extension CGRect: Scalable {

    var scale: CGRect {
        return CGRect(origin: origin.scale, size: size.scale)
    }

}

extension UIFont {

    var scale: UIFont {
        return UIFont(name: fontName, size: pointSize.scale) ?? UIFont.systemFont(ofSize: pointSize.scale)
    }

}

extension UIEdgeInsets: Scalable {

    var scale: UIEdgeInsets {
        return UIEdgeInsets(top: top.scale, left: left.scale, bottom: bottom.scale, right: right.scale)
    }

}
