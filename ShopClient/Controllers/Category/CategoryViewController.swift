//
//  CategoryViewController.swift
//  ShopClient
//
//  Created by Evgeniy Antonov on 9/20/17.
//  Copyright © 2017 Evgeniy Antonov. All rights reserved.
//

import UIKit

class CategoryViewController: GridCollectionViewController {
    var categoryId = String()
    var categoryTitle = String()
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        loadRemoteData()
    }
    
    // MARK: - setup
    private func setupViews() {
        title = categoryTitle
        addRightBarButton(with: ImageName.sort, action: #selector(CategoryViewController.sortTapHandler))
    }
    
    // MARK: - private
    private func updateData(category: Category) {
        self.category = category
        if let items = category.categoryDetails?.products {
            updateProducts(products: items)
            canLoadMore = products.count == kItemsPerPage
        }
    }
    
    private func updateProducts(products: [Product]) {
        if paginationValue == nil {
            self.products.removeAll()
        }
        self.products += products
    }
    
    // MARK: - private
    private func loadRemoteData() {
        ShopCoreAPI.shared.getCategoryDetails(id: categoryId, paginationValue: paginationValue) { [weak self] (result, error) in
            self?.stopLoadAnimating()
            if let category = result {
                self?.updateData(category: category)
                self?.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - actions
    func sortTapHandler() {
        
    }
    
    // MARK: - overriding
    override func pullToRefreshHandler() {
        paginationValue = nil
        loadRemoteData()
    }
    
    override func infinityScrollHandler() {
        paginationValue = products.last?.paginationValue
        loadRemoteData()
    }
}
