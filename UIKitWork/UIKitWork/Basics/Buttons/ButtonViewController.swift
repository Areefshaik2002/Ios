//
//  ButtonViewController.swift
//  UIKitWork
//
//  Created by Shaik Areef on 30/01/25.
//

import UIKit

class ButtonViewController: UIViewController {
    
    private var clickButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View name", for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var aboveLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "I am Shaik Areef"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clickButton.addTarget(self, action: #selector(showName), for: .touchUpInside)
        
        view.addSubview(clickButton)
        clickButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        clickButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        clickButton.layer.cornerRadius = 15
        clickButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        clickButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(aboveLabel)
        aboveLabel.bottomAnchor.constraint(equalTo: clickButton.topAnchor, constant: -50).isActive = true
        aboveLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    @objc func showName() {
        aboveLabel.isHidden.toggle()
        let title = aboveLabel.isHidden ? "view name" : "Hide name"
        clickButton.setTitle(title, for: .normal)
    }
}

#Preview {
    ButtonViewController()
}


