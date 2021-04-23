//
//  ArticleCell.swift
//  
//
//  Created by hicka04 on 2021/04/18.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    @IBOutlet private weak var label: UILabel!
    
    func setArticle(_ article: String) {
        label.text = article
    }
}
