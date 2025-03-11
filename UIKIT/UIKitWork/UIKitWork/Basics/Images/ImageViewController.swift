//
//  ImageViewController.swift
//  UIKitWork
//
//  Created by Shaik Areef on 30/01/25.
//

import UIKit

class ImageViewController: UIViewController {
    
    private var ImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageView.contentMode = .scaleAspectFit
        ImageView.clipsToBounds = true
        ImageView.tintColor =  .orange
        ImageView.image = UIImage(systemName: "star.fill")
        
        view.addSubview(ImageView)
        
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        ImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        ImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        ImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        }
}

#Preview {
    ImageViewController()
}
