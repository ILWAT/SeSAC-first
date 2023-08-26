//
//  MovieMainViewController.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/08/24.
//

import UIKit
import SnapKit

class MovieMainViewController: UIViewController {
    //MARK: - Properties
    let backgroundMovieImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "어벤져스엔드게임")
        view.contentMode = .scaleToFill
        return view
    }()
    
    let backgroundBlurImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.contentMode = .scaleToFill
        return view
    }()
    let tvNaviBarButton = {
        let label = TopButton()
        label.titleText = "N"
        label.bold = true
        return label
    }()
    let homeNaviBarButton = {
        let label = TopButton()
        label.titleText = "TV프로그램"
        label.bold = false
        return label
    }()
    let movieNaviBarButton = {
        let label = TopButton()
        label.titleText = "영화"
        label.bold = false
        return label
    }()
    let likeNaviBarButton = {
        let label = TopButton()
        label.titleText = "내가 찜한 콘텐츠"
        label.bold = false
        return label
    }()
    
    let topStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillProportionally
        return view
    }()
    
    let likeContentButton = {
        let button = ContentButton()
        button.setContent(title: "내가 찜한 컨텐츠", systemImageString: "checkmark")
        return button
    }()
    
    let playContentButton = {
        let button = UIButton()
        button.setTitle("재생", for: .normal)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.imagePlacement = .leading
        button.configuration = config
        return button
    }()
    
    let infoContentButton = {
        let button = ContentButton()
        button.setContent(title: "정보", systemImageString: "info.circle")
    }
    
    
    let infomationLabel = {
        let label = UILabel()
        label.text = "미리보기"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let movieImageStackView = UIStackView()
    
    let firstMovieImageView = {
        let view = CustomImageView()
        view.image = UIImage(named: "겨울왕국2")
        return view
    }()
    let secondMovieImageView = {
        let view = CustomImageView()
        view.image = UIImage(named: "신과함께죄와벌")
        return view
    }()
    let thirdMovieImageView = {
        let view = CustomImageView()
        view.image = UIImage(named: "아바타")
        return view
    }()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: - setUI
    func setUI(){
        
        setConstraints()
    }
    
    func setConstraints(){
        backgroundMovieImageView.snp.makeConstraints { make in
            
        }
    }


}
