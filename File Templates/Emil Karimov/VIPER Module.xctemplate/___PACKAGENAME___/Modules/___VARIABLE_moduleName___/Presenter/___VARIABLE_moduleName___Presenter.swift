//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

class ___VARIABLE_moduleName___Presenter: BasePresenter {

    weak var view: ___VARIABLE_moduleName___ViewProtocol?
    var wireFrame: ___VARIABLE_moduleName___WireFrameProtocol
    var interactor: ___VARIABLE_moduleName___InteractorProtocol

    init(view: ___VARIABLE_moduleName___ViewProtocol, wireFrame: ___VARIABLE_moduleName___WireFrameProtocol, interactor: ___VARIABLE_moduleName___InteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
}

extension ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___PresenterProtocol {
    func viewDidLoad() {
        view?.setupInitialState()
    }
}