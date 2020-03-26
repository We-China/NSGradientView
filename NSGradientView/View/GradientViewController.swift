//
//  GradientViewController.swift
//  NSGradientView
//
//  Created by zuolin on 2020/3/26.
//  Copyright © 2020 zuolin. All rights reserved.
//

import Cocoa

class GradientViewController: NSViewController {

    @IBOutlet private weak var collectionView: NSCollectionView!
    
    private let itemIdentifier = NSUserInterfaceItemIdentifier(rawValue: GradientCollectionViewItem.identifier)
    
    private let viewModel = GradientViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        bindingCollectionView()
        bindingViewModel()
    }
    
    private func bindingViewModel() {
        viewModel.upateClosure = { [weak self] in
            guard let self = self else {
                return
            }
            
            self.collectionView.reloadData()
        }
    }
    
    private func bindingCollectionView() {
        collectionView.isSelectable = true
        collectionView.allowsEmptySelection = false
        collectionView.allowsMultipleSelection  = false
        
        collectionView.register(GradientCollectionViewItem.self, forItemWithIdentifier: itemIdentifier)
    }
}

extension GradientViewController: NSCollectionViewDelegate {
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        
    }
}

extension GradientViewController: NSCollectionViewDataSource {
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: itemIdentifier, for: indexPath)
        
        guard let gradientItem = item as? GradientCollectionViewItem else {
            return item
        }
        
        let itemModel = viewModel.dataSource[indexPath.item]
        gradientItem.bindingItemModel(itemModel)
        
        return gradientItem
    }
    
    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
        return NSView()
    }
}

extension GradientViewController: NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: collectionView.frame.width, height: 160.0)
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        return .zero
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForFooterInSection section: Int) -> NSSize {
        return .zero
    }
}
