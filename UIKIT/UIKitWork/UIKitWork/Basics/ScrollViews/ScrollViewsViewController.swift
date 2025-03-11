//
//  ScrollViewsViewController.swift
//  UIKitWork
//
//  Created by Shaik Areef on 30/01/25.
//

import UIKit

class ScrollViewsViewController: UIViewController {
    
    private var scrollView = UIScrollView()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private var rectHeight: CGFloat = 200
    private var noOfRects: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...noOfRects {
            let rect = createRectangle()
            stackView.addArrangedSubview(rect)
        }
        
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        scrollView.contentSize.height = (rectHeight * CGFloat((noOfRects))) + 64
    }
    
    private func createRectangle() -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
        view.layer.cornerRadius = 12
        view.backgroundColor = .blue
        return view
    }
}

extension ScrollViewsViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("DEBUG: scroll view scrolled \(scrollView.contentOffset)")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("DEBUG: scroll view ended decelerating")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("DEBUG: scroll view ended dragging")
    }
}

#Preview {
    ScrollViewsViewController()
}
