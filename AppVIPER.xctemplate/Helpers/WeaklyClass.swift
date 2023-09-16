//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

class Weak<T> {

    weak private var value: AnyObject?
    var weak: T? {
        return value as? T
    }

    init<T: AnyObject>(_ value: T) {
        self.value = value
    }

}
