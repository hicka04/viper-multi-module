//
//  ArticleSearchViewController.swift
//  
//
//  Created by hicka04 on 2021/04/18.
//

import UIKit

protocol ArticleSearchView: AnyObject {
    
}

final class ArticleSearchViewController: UICollectionViewController {
    var presenter: ArticleSearchPresentation!
    
    init() {
        let layout: UICollectionViewCompositionalLayout = {
            let item = NSCollectionLayoutItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(44)
                )
            )
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(44)
                ),
                subitems: [item]
            )
            let section = NSCollectionLayoutSection(group: group)
            return UICollectionViewCompositionalLayout(section: section)
        }()
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(UINib(nibName: "ArticleCell", bundle: .module), forCellWithReuseIdentifier: "ArticleCell")
        
        presenter.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem()
    }
}

extension ArticleSearchViewController: ArticleSearchView {
    
}
