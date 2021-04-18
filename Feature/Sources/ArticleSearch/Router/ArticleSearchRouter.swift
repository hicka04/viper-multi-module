//
//  ArticleSearchRouter.swift
//  
//
//  Created by hicka04 on 2021/04/18.
//

import UIKit
import ArticleDetail

enum ArticleSearchDestination {
    case articleDetail
}

protocol ArticleSearchWireframe: AnyObject {
    func navigate(to destination: ArticleSearchDestination)
}

public final class ArticleSearchRouter {
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public static func assembleModules() -> UIViewController {
        let view = ArticleSearchViewController()
        let router = ArticleSearchRouter(viewController: view)
        let presenter = ArticleSearchPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

extension ArticleSearchRouter: ArticleSearchWireframe {
    func navigate(to destination: ArticleSearchDestination) {
        switch destination {
        case .articleDetail:
            let articleDetailView = ArticleDetailRouter.assembleModules()
            viewController.navigationController?.pushViewController(articleDetailView, animated: true)
        }
    }
}
