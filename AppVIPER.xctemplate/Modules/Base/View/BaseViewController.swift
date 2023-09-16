//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    deinit { }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func showLoading(message: String?) {

    }

    func hideLoading() {

    }

    @objc
    func hideKeyboard() {
        view.endEditing(true)
    }

}

// MARK: - BaseViewProtocol

extension BaseViewController: BaseViewProtocol {

}

// MARK: - Private

extension BaseViewController {

}
