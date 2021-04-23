//
//  ArticleSearchInteractor.swift
//  
//
//  Created by hicka04 on 2021/04/20.
//

import Foundation
import Combine

public protocol ArticleSearchUsecase: AnyObject {
    func execute(_ input: String) -> AnyPublisher<[String], Never>
}

public final class ArticleSearchInteractor: ArticleSearchUsecase {
    public init() {}
    
    public func execute(_ input: String) -> AnyPublisher<[String], Never> {
        Just(["hoge", "fuga", "piyo"]).eraseToAnyPublisher()
    }
}
