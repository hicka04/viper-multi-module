//
//  ArticleSearchViewController.swift
//  
//
//  Created by hicka04 on 2021/04/18.
//

import UIKit

protocol ArticleSearchView: AnyObject {
    
}

final class ArticleSearchViewController: UIViewController {
    var presenter: ArticleSearchPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
}

extension ArticleSearchViewController: ArticleSearchView {
    
}
