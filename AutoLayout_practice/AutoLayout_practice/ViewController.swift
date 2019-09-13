//
//  ViewController.swift
//  AutoLayout_practice
//
//  Created by Johanes Vincent Fernando on 13/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let imgcontainer = UIView()
    let mountainimg: UIImageView = {
        let imageview = UIImageView(image: #imageLiteral(resourceName: "river"))
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    let TxtTitle: UITextView = {
        let txttitle = UITextView()
        txttitle.text = "Join us in a journey to the New World"
        txttitle.font = UIFont.boldSystemFont(ofSize: 16)
        txttitle.translatesAutoresizingMaskIntoConstraints = false
        txttitle.textAlignment = .center
        txttitle.isEditable = false
        txttitle.isScrollEnabled = false
        return txttitle
    }()
    
    let TxtDescription: UITextView = {
        let txtdesc = UITextView()
        txtdesc.text = "Our journey will be fun yet hard. But in the end, you'll feel the true meaning of finding the New World. For the sake of human future, let's take your stick and catch up!"
        txtdesc.textColor = UIColor.gray
        txtdesc.translatesAutoresizingMaskIntoConstraints = false
        txtdesc.textAlignment = .center
        txtdesc.isEditable = false
        txtdesc.isScrollEnabled = false
        return txtdesc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(TxtTitle)
        view.addSubview(TxtDescription)
        addingsubcontainer()
        SubViewConstraint()
    
        
    }
    
    private func addingsubcontainer() {
        imgcontainer.backgroundColor = .none
        view.addSubview(imgcontainer)
        imgcontainer.translatesAutoresizingMaskIntoConstraints = false
        imgcontainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imgcontainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imgcontainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imgcontainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        imgcontainer.addSubview(mountainimg)
    }

    private func SubViewConstraint(){
        
        //imageview
        mountainimg.centerXAnchor.constraint(equalTo: imgcontainer.centerXAnchor).isActive = true
        mountainimg.centerYAnchor.constraint(equalTo: imgcontainer.centerYAnchor).isActive = true
        mountainimg.widthAnchor.constraint(equalTo: imgcontainer.widthAnchor, multiplier: 0.5).isActive = true
        mountainimg.heightAnchor.constraint(equalTo: imgcontainer.heightAnchor, multiplier: 0.5).isActive = true
        
        //title
        TxtTitle.topAnchor.constraint(equalTo: imgcontainer.bottomAnchor).isActive = true
        TxtTitle.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        TxtTitle.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        //desc
        TxtDescription.topAnchor.constraint(equalTo: TxtTitle.bottomAnchor, constant: 5).isActive = true
        TxtDescription.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        TxtDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true

    }
    
    
}

