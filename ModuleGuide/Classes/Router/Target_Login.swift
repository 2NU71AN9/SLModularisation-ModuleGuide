//
//  Target_Login.swift
//  SLProjectModuleComm
//
//  Created by 孙梁 on 2021/2/4.
//

import UIKit

@objc(Target_Login)
class Target_Login: NSObject {
    @objc func Action_LoginViewController(_ params: [NSString: AnyObject]?) -> UIViewController {
        SLLoginViewController()
    }
}
