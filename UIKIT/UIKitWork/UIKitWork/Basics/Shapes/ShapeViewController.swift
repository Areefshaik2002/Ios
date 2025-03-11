//
//  ShapeViewController.swift
//  UIKitWork
//
//  Created by Shaik Areef on 30/01/25.
//

import UIKit

class ShapeViewController: UIViewController {
    
    private var rectangle : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 12
        return view
    }()
    
    private var circle  = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rectangle)
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        rectangle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rectangle.heightAnchor.constraint(equalToConstant: 100).isActive = true
        rectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(circle)
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        circle.heightAnchor.constraint(equalToConstant: 100).isActive = true
        circle.topAnchor.constraint(equalTo: rectangle.bottomAnchor, constant: 10).isActive = true
        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circle.layer.cornerRadius = 50
        circle.backgroundColor = .systemBlue
    }
}

#Preview {
    ShapeViewController()
}
