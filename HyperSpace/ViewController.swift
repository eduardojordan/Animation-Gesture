//
//  ViewController.swift
//  HyperSpace
//
//  Created by Eduardo on 9/10/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {

    @IBOutlet weak var enterpriseView: UIImageView!
    
    
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // 1 añadimos el gesture
        view.addGestureRecognizer(tapGestureRecognizer)

        
 // 3  Ejemplo Por codigo hiperspace
       let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector (jumpToHyperSpace))
        swipeGestureRecognizer.direction = .left
        view.addGestureRecognizer(swipeGestureRecognizer)
    }
    @objc func jumpToHyperSpace(){
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: .curveEaseIn,
                           animations: {
                            self.enterpriseView.center.x += 1000
                            self.enterpriseView.center.y += 50
                            },
                           completion: nil)
        }
        
        
    
// 2 Agregamos
    
    @IBAction func userDidTap(_ sender: UITapGestureRecognizer) {
        let newCenter = tapGestureRecognizer.location(in: self.view)
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveEaseOut, .beginFromCurrentState],
                       animations: {
                        self.enterpriseView.center = newCenter
                       },
                       completion: nil
        )
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveEaseInOut,.beginFromCurrentState],
            animations: {
                self.enterpriseView.transform = CGAffineTransform(rotationAngle: CGFloat(M_2_PI))
        },
            completion : {_ in
                UIView.animate(withDuration: 0.6,
                               delay: 0,
                               options: [.curveEaseInOut, .beginFromCurrentState],
                               animations: {
                    self.enterpriseView.transform = CGAffineTransform.identity },
                               completion: nil
                )
        })
    }
    
}


