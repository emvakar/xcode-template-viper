//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//

import UIKit

public protocol EKRootViewControllerable {
    var splashScreen: UIViewController { get }
    var loginScreen: UIViewController { get }
    var logoutScreen: UIViewController { get }
    var mainScreen: UIViewController { get }
    var onboardingScreen: UIViewController? { get }

    func showLoginScreen(onboarding complete: Bool)
    func showOnboardingScreen(_ trainsition: TransitionAnimation) -> Bool
    func switchToLogout(_ trainsition: TransitionAnimation, onboarding complete: Bool)
    func switchToMainScreen(onboarding complete: Bool)
    func `switch`(to: UIViewController, as: ScreenType, animation: TransitionAnimation)
}

public enum ScreenType {
    case splash, login, logout, main, onboarding, nothing
}

public enum TransitionAnimation {
    case none, fade
}

typealias EKRootViewControllerSimple = EKRootViewController<Never>

open class EKRootViewController<DeeplinkType>: UIViewController, EKRootViewControllerable {

    public internal(set) var current: UIViewController = UIViewController()

    var currentType: ScreenType = .nothing

    public var deeplink: DeeplinkType? {
        didSet {
            if let deeplink = deeplink {
                handleDeepLink(type: deeplink)
            }
        }
    }

    open var splashScreen: UIViewController { print("a splashScreen"); return UIViewController() }
    open var loginScreen: UIViewController { print("a loginScreen"); return UIViewController() }
    open var logoutScreen: UIViewController { print("a logoutScreen"); return UIViewController() }
    open var mainScreen: UIViewController { print("a mainScreen"); return UIViewController() }
    open var onboardingScreen: UIViewController? { return nil }

    open var initialScreen: UIViewController { print("a initialScreen"); return splashScreen }

    open var shouldShowOnboardingBeforeMainScreen: Bool = true

    required public init() {
        super.init(nibName: nil, bundle: nil)

        current = initialScreen
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }

    open func showLoginScreen(onboarding complete: Bool = false) {
        if currentType == .onboarding, !complete {
            print("⚠️ onboarding is opened, cant show login")
            return
        }
        if currentType == .login {
            print("⚠️ Don't show login twice")
            return
        }
        currentType = .login
        replaceWithoutAnimation(loginScreen)
    }

    @discardableResult
    open func showOnboardingScreen(_ trainsition: TransitionAnimation = .none) -> Bool {
        guard let new = onboardingScreen else { return false }
        if currentType == .onboarding {
            print("⚠️ Don't show onboarding twice")
            return false
        }
        currentType = .onboarding
        switch trainsition {
        case .fade:
            animateFadeTransition(to: new)
        case .none:
            replaceWithoutAnimation(new)
        }
        return true
    }

    open func switchToLogout(_ trainsition: TransitionAnimation, onboarding complete: Bool = false) {
        if currentType == .onboarding, !complete {
            print("⚠️ onboarding is opened, cant show login")
            return
        }
        if currentType == .logout {
            print("⚠️ Don't call switch to logout twice")
            return
        }
        currentType = .logout
        switch trainsition {
        case .fade:
            animateFadeTransition(to: logoutScreen)
        case .none:
            animateDismissTransition(to: logoutScreen) {
                self.currentType = .login
            }
        }
    }

    open func switchToMainScreen(onboarding complete: Bool = false) {
        if currentType == .onboarding, !complete {
            print("⚠️ onboarding is opened, cant show main screen")
            return
        }
        if currentType == .main {
            print("⚠️ Don't call switch to main screen twice")
            return
        }
        if shouldShowOnboardingBeforeMainScreen, showOnboardingScreen() { print("wrong"); return }
        currentType = .main
        animateFadeTransition(to: mainScreen) { [weak self] in
            if let deeplink = self?.deeplink {
                self?.handleDeepLink(type: deeplink)
            }
        }
    }

    public func `switch`(to: UIViewController, as: ScreenType, animation: TransitionAnimation) {
        currentType = `as`
        switch animation {
        case .none:
            replaceWithoutAnimation(to)
            proceedDeeplink()
        case .fade:
            animateFadeTransition(to: to, completion: proceedDeeplink)
        }
    }

    private func proceedDeeplink() {
        if let deeplink = self.deeplink {
            handleDeepLink(type: deeplink)
        }
    }

    private func replaceWithoutAnimation(_ new: UIViewController) {
        addChild(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParent: self)

        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()

        current = new

        setNeedsStatusBarAppearanceUpdate()
    }

    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParent: nil)
        addChild(new)
        new.willMove(toParent: self)
        transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {}) { _ in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        let initialFrame = CGRect(x: -view.bounds.width, y: 0, width: view.bounds.width, height: view.bounds.height)
        current.willMove(toParent: nil)
        addChild(new)
        new.view.frame = initialFrame

        transition(from: current, to: new, duration: 0.3, options: [], animations: {
            new.view.frame = self.view.bounds
        }) { _ in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    open func handleDeepLink(type: DeeplinkType) { }

    public func attach(to window: UIWindow?) {
        window?.rootViewController = self
        window?.makeKeyAndVisible()
    }
    
}
