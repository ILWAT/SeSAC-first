//
//  ContentButton.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/08/25.
//
import UIKit

class ContentButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUI(){
        var config = UIButton.Configuration.filled()
        config.baseForegroundColor = .white
        config.imagePlacement = .top
        configuration = config
    }
    
    func setContent(title: String, systemImageString: String){
        setTitle(title, for: .normal)
        setImage(UIImage(systemName: systemImageString), for: .normal)
    }
}
