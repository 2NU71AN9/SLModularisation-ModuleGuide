//
//  AppDelegate.swift
//  ModuleGuide
//
//  Created by 孙梁 on 2021/2/27.
//

import UIKit
import CTMediator
import ModuleComm
import IQKeyboardManagerSwift
import PKHUD
import SVProgressHUD
import SLEmptyPage

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        config(launchOptions)
        whetherLoged()
        return true
    }
}

extension AppDelegate {

    private func whetherLoged() {
        window = UIWindow(frame: UIScreen.main.bounds)
        AccountServicer.service.isLogin ? goMainPage() : goLoginPage()
//        goMainPage()
    }
    private func goMainPage() {
        window?.rootViewController = SLTabBar.customStyle()
        window?.makeKeyAndVisible()
//        whetherGuide()
    }
    private func goLoginPage() {
        guard let login = CTMediator.sharedInstance().login() else { return }
        window?.rootViewController = BaseNavigationController(rootViewController: login)
        window?.makeKeyAndVisible()
//        whetherGuide()
    }
    private func whetherGuide() {
        guard let infoDictionary = Bundle.main.infoDictionary,
            let app_Version = infoDictionary["CFBundleShortVersionString"] as? String else {
                return
        }
        if let version = UserDefaults.standard.value(forKey: "version") as? String,
            version == app_Version {
            return
        }
        UserDefaults.standard.set(app_Version, forKey: "version")
//        window?.rootViewController?.present(GuideViewController(), animated: false, completion: nil)
    }
    
    private func config(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        SLNetworkListenManager.shared.listen()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        HUD.allowsInteraction = true
        HUD.dimsBackground = false
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setBackgroundColor(.clear)
        SLEmptyPageManager.enable = true
        SLEmptyPageManager.defaultEmptyViewBgColor = .clear
    }
}
