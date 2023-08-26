//
//  TopButtons.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/08/24.
//

import UIKit

class TopButton: UIButton {
    var titleText: String {
        get{
            guard let title = self.titleLabel?.text else {return ""}
            return title
        }
        set{
            setTitle(newValue, for: .normal)
        }
    }
    
    var bold: Bool = false{
        didSet{
            if bold {
                self.titleLabel?.font = .boldSystemFont(ofSize: 17)
            } else {
                self.titleLabel?.font = .systemFont(ofSize: 15)
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        setTitleColor(.white, for: .normal)
    }
    
}
