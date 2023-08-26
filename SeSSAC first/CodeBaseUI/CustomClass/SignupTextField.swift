//
//  SignupTextField.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/08/27.
//

import UIKit

class SignupTextField: UITextField{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        layer.cornerRadius = 10
        backgroundColor = .systemGray
        textColor = .white
        tintColor = .white
        textAlignment = .center
    }
}
