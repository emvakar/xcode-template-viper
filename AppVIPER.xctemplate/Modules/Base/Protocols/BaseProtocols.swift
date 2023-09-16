//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import UIKit

// MARK: - BaseViewProtocol

protocol BaseViewProtocol: AnyObject {

    func showLoading(message: String?)
    func hideLoading()

}

// MARK: - BasePresenterProtocol

protocol BasePresenterProtocol: AnyObject {

}

// MARK: - BaseInteractorProtocol

protocol BaseInteractorProtocol: AnyObject {

}

// MARK: - BaseWireFrameProtocol

protocol BaseWireFrameProtocol: AnyObject {

}
