//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import UIKit

extension SceneDelegate {

    static var shared: SceneDelegate {

        let scene = UIApplication.shared.connectedScenes.first
        guard let delegate: SceneDelegate = (scene?.delegate as? SceneDelegate) else {
            fatalError("Cant cast to SceneDelegate")
        }
        return delegate
    }

    var rootViewController: RootViewController {

        if let navController = self.window?.rootViewController as? UINavigationController, let rootViewController = navController.viewControllers.first as? RootViewController {
            return rootViewController
        }

        guard let rootController = self.window?.rootViewController as? RootViewController else {
            fatalError("Cant cast to RootViewController")
        }
        return rootController
    }

    var navigationViewController: UIViewController {
        if let navController = self.window?.rootViewController as? UINavigationController {
            return navController
        }

        guard let rootController = self.window?.rootViewController as? RootViewController else {
            fatalError("Cant cast to RootViewController")
        }
        return rootController
    }

}

class RootViewController: EKRootViewController<DeeplinkType> {

    private var resolver: DIResolver
    let templateController: UIViewController = UIViewController()

    internal init(resolver: DIResolver) {
        self.resolver = resolver
        super.init()

        shouldShowOnboardingBeforeMainScreen = true
        templateController.view.backgroundColor = .green
    }

    required init() {
        fatalError("init() has not been implemented")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit { }

    // may be shown on app launch as initial view controller
    override var splashScreen: UIViewController {
        return templateController
    }

    // where user will be moved on `showLoginScreen`
    override var loginScreen: UIViewController {
        return templateController
    }

    // where user will be moved on `switchToLogout`
    override var logoutScreen: UIViewController {
        return templateController
    }

    // means your main view controller for authorized users
    override var mainScreen: UIViewController {
        return templateController
    }

    // shows before main screen
    override var onboardingScreen: UIViewController? {
        // return something here to show it right after authorization
        return nil
    }

    // check authorization here and return proper screen
    override var initialScreen: UIViewController {
        return splashScreen
    }

}