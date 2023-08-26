//
//  CustomImageView.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/08/26.
//

import UIKit


class CustomImageView: UIImageView {
    
    override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        
        setUI()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        
        setUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.width/2
        }
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
