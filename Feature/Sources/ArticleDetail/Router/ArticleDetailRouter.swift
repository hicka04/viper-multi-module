//
//  ArticleDetailRouter.swift
//  
//
//  Created by hicka04 on 2021/04/18.
//

import UIKit

enum ArticleDetailDestination {}

protocol ArticleDetailWireframe: AnyObject {
    func navigate(to destination: ArticleDetailDestination)
}

public final class ArticleDetailRouter {
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public static func assembleModules() -> UIViewController {
        let view = ArticleDetailViewController()
        let router = ArticleDetailRouter(viewController: view)
        let presenter = ArticleDetailPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

extension ArticleDetailRouter: ArticleDetailWireframe {
    func navigate(to destination: ArticleDetailDestination) {
        
    }
}
