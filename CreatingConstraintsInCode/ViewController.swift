//
//  ViewController.swift
//  CreatingConstraintsInCode
//
//  Created by Лилия Левина on 12/04/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let v1 = UIView(frame:CGRect(x:100, y:111, width:132, height:194))
    let v2 = UIView()
    let v3 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(v1)
        v1.addSubview(v2)
        v1.addSubview(v3)
        v2.translatesAutoresizingMaskIntoConstraints = false
        v3.translatesAutoresizingMaskIntoConstraints = false
        
       // addConstraintsWithStandartNotation()
       // addConstraintsWithAnchorNotation()
        addConstaintsWithVisualFormatNotation()
    }
    
    func addConstraintsWithStandartNotation() {
        v1.addConstraint(
            NSLayoutConstraint(item: v2,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: v1,
                               attribute: .leading,
                               multiplier: 1, constant: 0)
        )
        v1.addConstraint(
            NSLayoutConstraint(item: v2,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: v1,
                               attribute: .trailing,
                               multiplier: 1, constant: 0)
        )
        v1.addConstraint(
            NSLayoutConstraint(item: v2,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: v1,
                               attribute: .top,
                               multiplier: 1, constant: 0)
        )
        v2.addConstraint(
            NSLayoutConstraint(item: v2,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1, constant: 10)
        )
        v3.addConstraint(
            NSLayoutConstraint(item: v3,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1, constant: 20)
        )
        v3.addConstraint(
            NSLayoutConstraint(item: v3,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1, constant: 20)
        )
        v1.addConstraint(
            NSLayoutConstraint(item: v3,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: v1,
                               attribute: .trailing,
                               multiplier: 1, constant: 0)
        )
        v1.addConstraint(
            NSLayoutConstraint(item: v3,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: v1,
                               attribute: .bottom,
                               multiplier: 1, constant: 0)
        )
    }
    
    func addConstraintsWithAnchorNotation() {
        NSLayoutConstraint.activate([
            v2.leadingAnchor.constraint(equalTo:v1.leadingAnchor),
            v2.trailingAnchor.constraint(equalTo:v1.trailingAnchor),
            v2.topAnchor.constraint(equalTo:v1.topAnchor),
            v2.heightAnchor.constraint(equalToConstant:10),
            v3.widthAnchor.constraint(equalToConstant:20),
            v3.heightAnchor.constraint(equalToConstant:20),
            v3.trailingAnchor.constraint(equalTo:v1.trailingAnchor),
            v3.bottomAnchor.constraint(equalTo:v1.bottomAnchor)
            ])
        //It isn’t strictly necessary to activate all one’s constraints at once,
        //but it’s best to try to do so, as this allows the autolayout engine to respond more efficiently.
    }
    
    func addConstaintsWithVisualFormatNotation() {
        let d = ["v2":v2,"v3":v3]
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat:
                "H:|[v2]|", metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat:
                "V:|[v2(10)]", metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat:
                "H:[v3(20)]|", metrics: nil, views: d),
            NSLayoutConstraint.constraints(withVisualFormat:
                "V:[v3(20)]|", metrics: nil, views: d)
            ].flatMap{$0})
        //The visual format syntax shows itself to best advantage when multiple views are laid out in relation
        //to one another along the same dimension; in that situation, you can get many constraints generated
        //by a single compact visual format string. However, it hasn’t been updated for recent iOS versions,
        //so there are some important types of constraint that visual format syntax can’t express
        //(such as pinning a view to the safe area).
    }
    


}

