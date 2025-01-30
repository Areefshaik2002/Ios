//
//  ActionButtonView.swift
//  UIKitWork
//
//  Created by Shaik Areef on 30/01/25.
//

import UIKit

protocol ActionButtonViewDelegate: AnyObject {
    func onPrimaryTap()
    func onSecondaryTap()
}

class ActionButtonView: UIView {
    
    weak var delegate: ActionButtonViewDelegate?
    
    private var primaryActionButton: UIButton = {
        let button = UIButton()
        button.setTitle("primary button", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        return button
    }()
    
    private var secondaryActionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("secondary button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        primaryActionButton.addTarget(self, action: #selector(handlePrimaryButton), for: .touchUpInside)
        secondaryActionButton.addTarget(self, action: #selector(handleSecondaryButton), for: .touchUpInside)
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        addSubview(primaryActionButton)
        primaryActionButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        primaryActionButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        primaryActionButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        primaryActionButton.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        
        addSubview(secondaryActionButton)
        secondaryActionButton.topAnchor.constraint(equalTo: primaryActionButton.bottomAnchor, constant: 18).isActive = true
        secondaryActionButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handlePrimaryButton(){
        print("DEBUG: Primary button tapped in view.")
        delegate?.onPrimaryTap()
    
    }
    
    @objc func handleSecondaryButton(){
        print("DEBUG: Secondary button tapped in view.")
        delegate?.onSecondaryTap()
    }
    
}
#Preview {
    ActionButtonView()
}
