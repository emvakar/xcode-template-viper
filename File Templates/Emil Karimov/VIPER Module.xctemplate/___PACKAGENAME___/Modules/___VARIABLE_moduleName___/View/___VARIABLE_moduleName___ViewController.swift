//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

class ___VARIABLE_moduleName___ViewController: BaseViewController {

    var presenter: ___VARIABLE_moduleName___PresenterProtocol!

    private lazy var containerView = makeContainerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

        let label = UILabel()
        label.numberOfLines = 0
        label.text = "___VARIABLE_moduleName___"
        label.textAlignment = .center
        containerView.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(24)
        }
    }

    private func makeConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func makeContainerView() -> UIView {
        let containerView = UIView()
        view.addSubview(containerView)
        return containerView
    }
}

extension ___VARIABLE_moduleName___ViewController: ___VARIABLE_moduleName___ViewProtocol {
    func setupInitialState() {
        makeConstraints()
    }
}