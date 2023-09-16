//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import Foundation

class SearchBuffer: NSObject {

    private var delay = 0.8
    private var minSearchCount = 3

    private let queue: DispatchQueue
    private var workItem: DispatchWorkItem?

    init(queue: DispatchQueue, delay: Double = 0.8, minSearchCount: Int = 3) {
        self.queue = queue
        self.minSearchCount = minSearchCount
        self.delay = delay
    }

    func searchBy(text: String?, _ closure: @escaping (String?) -> Void) {
        workItem?.cancel()

        guard let text = text, !text.isEmpty else {
            closure(nil)
            return
        }

        if text.count < minSearchCount {
            return
        }

        workItem = DispatchWorkItem {
            closure(text)
        }

        if let workItem = workItem {
            queue.asyncAfter(deadline: .now() + delay, execute: workItem)
        }
    }
}
