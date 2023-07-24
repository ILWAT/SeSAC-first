//
//  KeyboardViewController.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/07/20.
//

import UIKit

class KeyboardViewController: UIViewController {

    @IBOutlet var newButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newButton.backgroundColor = .blue
        
        var config = UIButton.Configuration.filled() //apple system button
        config.title = "SeSAC 영등포 캠퍼스"
        config.subtitle = "로그인 없이 둘러보기"
        config.image = UIImage(systemName: "star" )
        
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .yellow
        config.imagePadding = 8
        config.imagePlacement = .trailing
        config.titleAlignment = .center
        
        config.cornerStyle = .capsule
        newButton.configuration = config
    }

    @IBAction func dismissKeyboard(_ sender: UIButton) {
        view.endEditing(true)
    }
    
}
