//
//  CustomStackView.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/08/26.
//

import UIKit


class CustomStackView: UIStackView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        spacing = 10
        axis = .horizontal
        alignment = .fill
        distribution = .fillProportionally
    }
}
