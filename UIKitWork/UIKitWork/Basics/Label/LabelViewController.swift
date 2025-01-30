//
//  LabelViewController.swift
//  UIKitWork
//
//  Created by Shaik Areef on 29/01/25.
//

import UIKit

class LabelViewController: UIViewController {

    private var textLabel = UILabel()
    
    private var subtitleLabel : UILabel = {
        let label = UILabel()
        label.text = "subtitles here!!"
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Hey, you Again!"
        textLabel.font = UIFont.systemFont(ofSize: 40)
       
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 9).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
    }
}

#Preview {
    LabelViewController()
}
