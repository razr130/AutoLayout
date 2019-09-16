//
//  SwipeController.swift
//  AutoLayout_practice
//
//  Created by Johanes Vincent Fernando on 13/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit

class SwipeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if(self.PageControl.currentPage == 0){
                self.collectionView.contentOffset = .zero
            }
            else{
                let indexpath = IndexPath(item: self.PageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
            }
           
        }) { (_) in
        }
    }
    
    let guidelist: [GuideModel] = [
        GuideModel(imagename: "forest", title: "Join us in a journey to the New World", description: "Our journey will be fun yet hard. But in the end, you'll feel the true meaning of finding the New World. For the sake of human future, let's take your stick and catch up!"),
        GuideModel(imagename: "fields", title: "Grow your family with us", description: "Make a happy horde of new human in a new world. Keep your tree of descendant growing and growing. Make a child already!"),
        GuideModel(imagename: "mountains", title: "Create your own world of future", description: "Build a land. Dig a river. Grow a mountain. Create your own world with your friends and family.")
    ]
    
    private let BtnPrev: UIButton =  {
        let btnprev = UIButton(type: .system)
        btnprev.setTitle("PREV", for: .normal)
        btnprev.translatesAutoresizingMaskIntoConstraints = false
        btnprev.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        btnprev.setTitleColor(.gray, for: .normal)
        btnprev.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return btnprev
    }()
    
    private let BtnNext: UIButton =  {
        let btnnext = UIButton(type: .system)
        btnnext.setTitle("NEXT", for: .normal)
        btnnext.translatesAutoresizingMaskIntoConstraints = false
        btnnext.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        btnnext.tintColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        btnnext.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return btnnext
    }()
    
    @objc private func handlePrev(){
        let previndex = max(PageControl.currentPage - 1,0)
        let indexpath = IndexPath(item: previndex, section: 0)
        PageControl.currentPage = previndex
        collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handleNext() {
        let nextindex = min(PageControl.currentPage + 1, guidelist.count - 1)
        let indexpath = IndexPath(item: nextindex, section: 0)
        PageControl.currentPage = nextindex
        collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
    }
    
    fileprivate lazy var PageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = guidelist.count
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        pc.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return pc
    }()
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        PageControl.currentPage = Int(x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupbottomcontrol()
        collectionView.backgroundColor = .white
        collectionView.register(GuideCell.self, forCellWithReuseIdentifier: "CellID")
        collectionView.isPagingEnabled = true
    }
    
    fileprivate func setupbottomcontrol() {
    
        let bottomStackView = UIStackView(arrangedSubviews: [BtnPrev, PageControl, BtnNext])
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return guidelist.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! GuideCell
//        cell.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        let guide = guidelist[indexPath.item]
        cell.guide = guide
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
