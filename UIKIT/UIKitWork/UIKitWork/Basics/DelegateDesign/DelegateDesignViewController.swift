//
//  DelegateDesignViewController.swift
//  UIKitWork
//
//  Created by Shaik Areef on 30/01/25.
//

import UIKit

class DelegateDesignViewController: UIViewController {
    
    private var actionButtonView = ActionButtonView()
    private var textLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(actionButtonView)
        actionButtonView.translatesAutoresizingMaskIntoConstraints = false
        actionButtonView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        actionButtonView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        actionButtonView.layer.shadowColor = UIColor.black.cgColor
        actionButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        actionButtonView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        actionButtonView.delegate = self
        
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: actionButtonView.bottomAnchor, constant: 20).isActive = true
        textLabel.text = "Primary action button tapped."
        textLabel.isHidden = true
    }
}
extension DelegateDesignViewController: ActionButtonViewDelegate {
    func onPrimaryTap() {
        print("DEBUG:Primary action button tapped in view controller.")
        textLabel.isHidden = false
    }
    func onSecondaryTap() {
        print("DEBUG:Secondary action button tapped in view controller.")
        textLabel.isHidden = true
    }
}
