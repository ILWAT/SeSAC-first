//
//  SignUpViewController.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/08/27.
//

import UIKit

class SignUpViewController: UIViewController {

    let TitleLabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "JACKFLIX"
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let signupStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .fill
        view.distribution = .fillEqually
        return view
    }()
    
    let emailTextField = {
        let view = SignupTextField()
        view.placeholder = "이메일 주소 또는 전화번호"
        return view
    }()
    
    let passwordTextField = {
        let view = SignupTextField()
        view.placeholder = "비밀번호"
        return view
    }()
    
    let nicknameTextField = {
        let view = SignupTextField()
        view.placeholder = "닉네임"
        return view
    }()
    
    let locationTextField = {
        let view = SignupTextField()
        view.placeholder = "위치"
        return view
    }()
    
    let recoCodeTextField = {
        let view = SignupTextField()
        view.placeholder = "추천 코드 입력"
        return view
    }()
    
    let signupButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let moreInfoLabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let contentSwitch = {
        let content = UISwitch()
        content.isOn = true
        return content
    }()
    
    let viewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        nicknameTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        nicknameTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        viewModel.isVlid.bind { bool in
            self.signupButton.isEnabled = bool
            if bool{
                self.signupButton.backgroundColor = .white
            } else {
                self.signupButton.backgroundColor = .systemGray
            }
        }
    }
    
    func setUI(){
        signupStackView.addArrangedSubview(emailTextField)
        signupStackView.addArrangedSubview(passwordTextField)
        signupStackView.addArrangedSubview(nicknameTextField)
        signupStackView.addArrangedSubview(locationTextField)
        signupStackView.addArrangedSubview(recoCodeTextField)
        signupStackView.addArrangedSubview(signupButton)
        
        view.addSubview(signupStackView)
        view.addSubview(TitleLabel)
        view.addSubview(contentSwitch)
        view.addSubview(moreInfoLabel)
        
        setConstratints()
    }
    
    func setConstratints(){
        TitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        signupStackView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(TitleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        contentSwitch.snp.makeConstraints { make in
            make.trailing.equalTo(signupStackView.snp.trailing)
            make.top.equalTo(signupButton.snp.bottom).offset(10)
        }
        
        moreInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentSwitch)
            make.leading.equalTo(signupStackView)
        }
    }
    
    //MARK: - Action
    @objc func textFieldEditingChanged(_ sender: UITextField){
        switch sender{
        case nicknameTextField:
            guard let text = nicknameTextField.text else {return}
            viewModel.nickname.value = text
        case passwordTextField:
            guard let text = passwordTextField.text else {return}
            viewModel.pw.value = text
        case emailTextField:
            guard let text = emailTextField.text else {return}
            viewModel.id.value = text
        default:
            break
        }
        viewModel.checkValidId()
    }

}
