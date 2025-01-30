//
//  StackViewController.swift
//  UIKitWork
//
//  Created by Shaik Areef on 30/01/25.
//

import UIKit

class StackViewController: UIViewController {
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect1 = createRectange()
        let rect2 = createRectange()
        let rect3 = createRectange()
        rect1.backgroundColor = .systemBlue
        rect2.backgroundColor = .systemRed
        rect3.backgroundColor = .systemGreen
        
        stackView.addArrangedSubview(rect1)
        stackView.addArrangedSubview(rect2)
        stackView.addArrangedSubview(rect3)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func createRectange() -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
        view.layer.cornerRadius = 14
        return view
    }
}
#Preview {
    StackViewController()
}
