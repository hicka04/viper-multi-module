//
//  ArticleDetailPresenter.swift
//  
//
//  Created by hicka04 on 2021/04/18.
//

import Foundation

protocol ArticleDetailPresentation: AnyObject {
    
}

final class ArticleDetailPresenter {
    private weak var view: ArticleDetailView?
    private let router: ArticleDetailWireframe
    
    init(view: ArticleDetailView,
         router: ArticleDetailWireframe) {
        self.view = view
        self.router = router
    }
}

extension ArticleDetailPresenter: ArticleDetailPresentation {
    
}
