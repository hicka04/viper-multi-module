//
//  ArticleSearchViewController.swift
//  
//
//  Created by hicka04 on 2021/04/18.
//

import UIKit
import Combine

final class ArticleSearchViewController: UICollectionViewController {
    var presenter: ArticleSearchPresentation!
    
    private var cancellables: Set<AnyCancellable> = []
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<Int, String> = {
        let dataSource = UICollectionViewDiffableDataSource<Int, String>(collectionView: collectionView) { (collectionView, indexPath, article) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
            cell.setArticle(article)
            return cell
        }
        return dataSource
    }()
    
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
        
        presenter.articles
            .sink { [self] articles in
                var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
                snapshot.appendSections([0])
                snapshot.appendItems(articles)
                dataSource.apply(snapshot)
            }.store(in: &cancellables)
        
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
