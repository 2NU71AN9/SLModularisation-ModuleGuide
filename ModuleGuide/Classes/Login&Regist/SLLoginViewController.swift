//
//  SLLoginViewController.swift
//  SLCommProject
//
//  Created by 孙梁 on 2020/12/12.
//

import UIKit
import ModuleComm

class SLLoginViewController: BaseViewController {
    private lazy var loginBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        btn.center = view.center
        btn.setTitle("点击登录", for: .normal)
        btn.backgroundColor = R.color.prime()
        btn.addTarget(self, action: #selector(loginSuccess), for: .touchUpInside)
        btn.kCornerRadius = 5
        return btn
    }()
}

extension SLLoginViewController {
    
    override func setMasterView() {
        super.setMasterView()
        title = "登录"
        view.addSubview(loginBtn)
    }
    
    override func setVisitorPage() {
        setMasterView()
    }
}

// MARK: - private methods
extension SLLoginViewController {
    
    @objc private func loginSuccess() {
        // 保存用户信息或token
        AccountServicer.service.saveToken("123")
        // 一定要调这句
        AccountServicer.service.loginSuccess()
        dismiss()
    }
    
    private func dismiss() {
        if navigationController?.presentingViewController != nil && presentingViewController != nil {
            dismiss(animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController = SLTabBar.customStyle()
        }
    }
}
