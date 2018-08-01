//
//  ActivityIndicatorView.swift
//  Profiency_Exercise_Swift
//
//  Created by kanagasabapathy on 01/08/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicatorView {
    
    var containerView: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func showActivityIndicatorView(view: UIView){
        
        self.containerView.frame = view.frame
        self.containerView.center = view.center
        self.containerView.backgroundColor = .lightGray
        self.containerView.alpha = 0.3
        
        self.loadingView.frame = CGRect.init(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        self.loadingView.center = view.center
        self.loadingView.backgroundColor = .blue
        self.loadingView.alpha = 0.5
        self.loadingView.clipsToBounds = true
        self.loadingView.layer.cornerRadius = 10
        
        self.activityIndicator.frame = CGRect.init(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        self.activityIndicator.activityIndicatorViewStyle = .whiteLarge
        self.activityIndicator.center = CGPoint.init(x: self.loadingView.frame.size.width/2, y: self.loadingView.frame.size.height/2)
       
        self.activityIndicator.hidesWhenStopped = true
        
        self.loadingView.addSubview(self.activityIndicator)
        
        self.containerView.addSubview(self.loadingView)
       
        view.addSubview(self.containerView)
        
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    
    func hideActivityIndicatorView(view: UIView){
       
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            self.loadingView.removeFromSuperview()
            self.containerView.removeFromSuperview()
          
        }
            
    }
    
    
}
