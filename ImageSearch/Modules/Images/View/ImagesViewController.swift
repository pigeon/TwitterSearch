//
//  ImagesImagesViewController.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import UIKit

class ImageFlowLayout: UICollectionViewFlowLayout {
    let cellsPerRow: Int
    override var itemSize: CGSize {
        get {
            guard let collectionView = collectionView else { return super.itemSize }
            let marginsAndInsets = sectionInset.left + sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
            let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
            return CGSize(width: itemWidth, height: itemWidth)
        }
        set {
            super.itemSize = newValue
        }
    }

    init(cellsPerRow: Int, minimumInteritemSpacing: CGFloat = 0, minimumLineSpacing: CGFloat = 0, sectionInset: UIEdgeInsets = .zero) {
        self.cellsPerRow = cellsPerRow
        super.init()

        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
        return context
    }
}

class ImagesViewController: UIViewController, ImagesViewInput {
    var output: ImagesViewOutput!

    @IBOutlet var collectionView: UICollectionView!

    let columnLayout = ImageFlowLayout(
        cellsPerRow: 3,
        minimumInteritemSpacing: 20,
        minimumLineSpacing: 20,
        sectionInset: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    )

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = columnLayout
        collectionView.contentInsetAdjustmentBehavior = .always
        output.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    func reload() {
        collectionView.reloadData()
    }

    // MARK: ImagesViewInput

    func setupInitialState() {
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        output.prepare(for: segue)
    }
}

extension ImagesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return output.numberOfItemsInSection()
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchImage", for: indexPath)
        if let cell = cell as? SearchImageCell {
            cell.configure(output.dataModel(with: indexPath))
        }

        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.imageSelected(at: indexPath)
        performSegue(withIdentifier: "FullScreenViewController", sender: self)
    }
}
