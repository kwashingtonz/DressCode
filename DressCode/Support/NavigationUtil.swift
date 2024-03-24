//
//  NavigationUtil.swift
//  DressCode
//
//  Created by Kalindu Washington on 2024-03-24.
//

import Foundation
import UIKit

struct NavigationUtil {
    static func popToRootView() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            findNavigationController(viewController:
            UIApplication.shared.windows.filter { 
                $0.isKeyWindow
            }
                .first?
                .rootViewController)?
                .popToRootViewController(animated: true)
        }
    }
    
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UINavigationController
        {
            return navigationController
        }
        
        for childViewController in viewController.children {
            return findNavigationController(viewController:childViewController)
        }
        
        return nil
        
    }
}
