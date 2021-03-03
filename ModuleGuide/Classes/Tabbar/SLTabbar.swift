//
//  SLTabbar.swift
//  SLCommProject
//
//  Created by 孙梁 on 2020/12/12.
//

import UIKit
import ESTabBarController_swift
import ModuleComm
import RxSwift
import pop
import SLSupportLibrary
import CTMediator

public class SLESTabBarController: ESTabBarController {
    private let bag = DisposeBag()
    
    /// 监听登录状态跳转登录页面
    public required init() {
        super.init(nibName: nil, bundle: nil)
        AccountServicer.service.haveToLogoutSubject
            .flatMap { $0 }
            .subscribe(onNext: { [weak self] (_) in
                if let login = CTMediator.sharedInstance().login() {
                    let vc = BaseNavigationController(rootViewController: login)
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true) {
                        AccountServicer.service.haveToLogoutSubject.accept(PublishSubject<Bool>())
                    }
                }
            }).disposed(by: bag)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

open class SLTabBar {
    public static func customStyle() -> ESTabBarController {
        let tabBarController = SLESTabBarController()
//        tabBarController.tabBar.isTranslucent = false
//        tabBarController.tabBar.shadowImage = UIImage()
//        tabBarController.tabBar.backgroundImage = UIImage() // 会失去毛玻璃效果

        guard let vc1 = CTMediator.sharedInstance().home(),
              let vc2 = CTMediator.sharedInstance().second(),
              let vc3 = CTMediator.sharedInstance().profile() else {
            return tabBarController
        }

        let navi1 = BaseNavigationController(rootViewController: vc1)
        let navi2 = BaseNavigationController(rootViewController: vc2)
        let navi3 = BaseNavigationController(rootViewController: vc3)

        vc1.tabBarItem = ESTabBarItem(CustomBasicContentView(), title: "首页", image: R.image.tab1_normal(), selectedImage: R.image.tab1_selected())
        vc2.tabBarItem = ESTabBarItem(CustomBasicContentView(), title: "页面2", image: R.image.tab2_normal(), selectedImage: R.image.tab2_selected())
        vc3.tabBarItem = ESTabBarItem(CustomBasicContentView(), title: "我的", image: R.image.tab3_normal(), selectedImage: R.image.tab3_selected())
        tabBarController.viewControllers = [navi1, navi2, navi3]
        return tabBarController
    }
}

class CustomBasicContentView: ESTabBarItemContentView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        highlightTextColor = .systemRed
        textColor = .systemYellow
        renderingMode = .automatic
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
