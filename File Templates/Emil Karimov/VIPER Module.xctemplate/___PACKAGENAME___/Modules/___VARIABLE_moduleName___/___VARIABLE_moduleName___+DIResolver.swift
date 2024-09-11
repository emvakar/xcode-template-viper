//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

protocol ___VARIABLE_moduleName___Protocol {
    func present___VARIABLE_moduleName___ViewController() -> UIViewController
}

extension DIResolver: ___VARIABLE_moduleName___Protocol {
    func present___VARIABLE_moduleName___ViewController() -> UIViewController {
        let viewController = ___VARIABLE_moduleName___ViewController()
        let interactor = ___VARIABLE_moduleName___Interactor()
        let wireFrame = ___VARIABLE_moduleName___WireFrame(resolver: self)
        let presenter = ___VARIABLE_moduleName___Presenter(view: viewController, wireFrame: wireFrame, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}