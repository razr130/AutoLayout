//
//  GuideCell.swift
//  AutoLayout_practice
//
//  Created by Johanes Vincent Fernando on 13/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit

class GuideCell: UICollectionViewCell {
    
    var guide: GuideModel? {
        didSet {
            guard let unwrappedGuide = guide else { return }
            ImgGuide.image = UIImage(named: unwrappedGuide.imagename)
            TxtTitle.text = unwrappedGuide.title
            TxtDescription.text = unwrappedGuide.description
        }
    }
    
    let imgcontainer = UIView()
    private let ImgGuide: UIImageView = {
        let imageview = UIImageView(image: #imageLiteral(resourceName: "river"))
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    private let TxtTitle: UITextView = {
        let txttitle = UITextView()
        txttitle.font = UIFont.boldSystemFont(ofSize: 16)
        txttitle.translatesAutoresizingMaskIntoConstraints = false
        txttitle.textAlignment = .center
        txttitle.isEditable = false
        txttitle.isScrollEnabled = false
        return txttitle
    }()
    
    private let TxtDescription: UITextView = {
        let txtdesc = UITextView()
        txtdesc.textColor = UIColor.gray
        txtdesc.translatesAutoresizingMaskIntoConstraints = false
        txtdesc.textAlignment = .center
        txtdesc.isEditable = false
        txtdesc.isScrollEnabled = false
        return txtdesc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(TxtTitle)
        addSubview(TxtDescription)
        addingsubcontainer()
        SubViewConstraint()
        
    }
    
    private func addingsubcontainer() {
        imgcontainer.backgroundColor = .none
        addSubview(imgcontainer)
        imgcontainer.translatesAutoresizingMaskIntoConstraints = false
        imgcontainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imgcontainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imgcontainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgcontainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        imgcontainer.addSubview(ImgGuide)
    }
    
    private func SubViewConstraint(){
        
        //imageview
        ImgGuide.centerXAnchor.constraint(equalTo: imgcontainer.centerXAnchor).isActive = true
        ImgGuide.centerYAnchor.constraint(equalTo: imgcontainer.centerYAnchor).isActive = true
        ImgGuide.widthAnchor.constraint(equalTo: imgcontainer.widthAnchor, multiplier: 0.5).isActive = true
        ImgGuide.heightAnchor.constraint(equalTo: imgcontainer.heightAnchor, multiplier: 0.5).isActive = true
        
        //title
        TxtTitle.topAnchor.constraint(equalTo: imgcontainer.bottomAnchor).isActive = true
        TxtTitle.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        TxtTitle.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        //desc
        TxtDescription.topAnchor.constraint(equalTo: TxtTitle.bottomAnchor, constant: 5).isActive = true
        TxtDescription.leftAnchor.constraint(equalTo: leftAnchor, constant: 25).isActive = true
        TxtDescription.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
