//
//  ArticleDetailViewController.swift
//  
//
//  Created by hicka04 on 2021/04/18.
//

import UIKit

protocol ArticleDetailView: AnyObject {
    
}

final class ArticleDetailViewController: UIViewController {
    var presenter: ArticleDetailPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }
}

extension ArticleDetailViewController: ArticleDetailView {
    
}
