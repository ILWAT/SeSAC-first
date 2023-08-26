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
        label.titleText = "TV프로그램"
        label.bold = false
        return label
    }()
    let homeNaviBarButton = {
        let label = TopButton()
        label.titleText = "N"
        label.bold = true
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
        return button
    }()
    
    
    let infomationLabel = {
        let label = UILabel()
        label.text = "미리보기"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    let contentStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        return view
    }()
    
    let movieView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let movieImageStackView = {
        let view = UIStackView()
        view.spacing = 20
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.backgroundColor = .black
        return view
    }()
    
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
        
        setUI()
    }
    
    
    //MARK: - setUI
    func setUI(){
        topStackView.addArrangedSubview(homeNaviBarButton)
        topStackView.addArrangedSubview(tvNaviBarButton)
        topStackView.addArrangedSubview(movieNaviBarButton)
        topStackView.addArrangedSubview(likeNaviBarButton)
        
        contentStackView.addArrangedSubview(likeContentButton)
        contentStackView.addArrangedSubview(playContentButton)
        contentStackView.addArrangedSubview(infoContentButton)
        
        
        movieImageStackView.addArrangedSubview(firstMovieImageView)
        movieImageStackView.addArrangedSubview(secondMovieImageView)
        movieImageStackView.addArrangedSubview(thirdMovieImageView)
        
        backgroundMovieImageView.addSubview(backgroundBlurImageView)
        backgroundMovieImageView.addSubview(contentStackView)
        
        view.addSubview(backgroundMovieImageView)
        view.addSubview(topStackView)
        view.addSubview(movieView)
        
        movieView.addSubview(movieImageStackView)
        movieView.addSubview(infomationLabel)
        
        setConstraints()
    }
    
    func setConstraints(){
        backgroundMovieImageView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.75)
            make.leading.trailing.top.equalToSuperview()
        }
        backgroundBlurImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        topStackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
        }
        contentStackView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
        }
        movieView.snp.makeConstraints { make in
            make.top.equalTo(backgroundMovieImageView.snp.bottom)
            make.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        infomationLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)

        }
        movieImageStackView.snp.makeConstraints { make in
            make.top.equalTo(infomationLabel.snp.bottom).offset(10)
            make.height.equalToSuperview().multipliedBy(0.8)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        
        
    }


}
