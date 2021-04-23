//
//  ArticleSearchPresenter.swift
//  
//
//  Created by hicka04 on 2021/04/18.
//

import Foundation
import Combine
import Domain

protocol ArticleSearchPresentation: AnyObject {
    var articles: CurrentValueSubject<[String], Never> { get }
    
    func viewDidLoad()
    func didSelectItem()
}

final class ArticleSearchPresenter {
    private var cancellables: Set<AnyCancellable> = []
    
    private(set) var articles = CurrentValueSubject<[String], Never>([])
    
    private let viewDidLoadSubject = PassthroughSubject<Void, Never>()
    private let didSelectItemSubject = PassthroughSubject<Void, Never>()
    
    init(router: ArticleSearchWireframe,
         articleSearchInteractor: ArticleSearchUsecase) {
        viewDidLoadSubject
            .flatMap {
                articleSearchInteractor
                    .execute("Swift")
            }.subscribe(articles)
            .store(in: &cancellables)
        
        didSelectItemSubject
            .sink {
                router.navigate(to: .articleDetail)
            }.store(in: &cancellables)
    }
}

extension ArticleSearchPresenter: ArticleSearchPresentation {
    func viewDidLoad() {
        viewDidLoadSubject.send()
    }
    
    func didSelectItem() {
        didSelectItemSubject.send()
    }
}
