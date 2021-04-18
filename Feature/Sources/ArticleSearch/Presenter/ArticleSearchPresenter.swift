//
//  ArticleSearchPresenter.swift
//  
//
//  Created by hicka04 on 2021/04/18.
//

import Foundation

protocol ArticleSearchPresentation: AnyObject {
    func viewDidLoad()
    func didSelectItem()
}

final class ArticleSearchPresenter {
    private weak var view: ArticleSearchView?
    private let router: ArticleSearchWireframe
    
    init(view: ArticleSearchView,
         router: ArticleSearchWireframe) {
        self.view = view
        self.router = router
    }
}

extension ArticleSearchPresenter: ArticleSearchPresentation {
    func viewDidLoad() {
//        router.navigate(to: .articleDetail)
    }
    
    func didSelectItem() {
        router.navigate(to: .articleDetail)
    }
}
