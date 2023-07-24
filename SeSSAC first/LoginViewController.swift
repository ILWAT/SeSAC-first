//
//  LoginViewController.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/07/19.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var switch_EtcInput: UISwitch!
    @IBOutlet var textField_Code: UITextField!
    @IBOutlet var textField_Location: UITextField!
    @IBOutlet var textField_Nickname: UITextField!
    @IBOutlet var textField_PassWord: UITextField!
    @IBOutlet var textField_ID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyAllUI()
    }
    

   //MARK: - DesignUI
    func designTextField(inputTextField :UITextField, placeholderText: String, keyboardType: UIKeyboardType){
        inputTextField.placeholder = placeholderText
        inputTextField.textColor = .white
        inputTextField.keyboardType = keyboardType
        inputTextField.textAlignment = .center
        inputTextField.borderStyle = .line
        inputTextField.backgroundColor = .gray
        inputTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [.foregroundColor: UIColor.white])
        inputTextField.textAlignment = .center
        inputTextField.layer.cornerRadius = 5
    }
    
    func designSwitch(){
        switch_EtcInput.isOn = true
        switch_EtcInput.onTintColor = .green
        switch_EtcInput.thumbTintColor = .white
    }
    
    func designSignUpButton(){
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.configuration?.background.backgroundColor = .white
    }
    
    //MARK: - applyUI
    
    func applyAllUI(){
        applyUITextField()
        designSwitch()
        designSignUpButton()
    }
    
    func applyUITextField() {
        designTextField(inputTextField: textField_ID, placeholderText: "이메일 주소 또는 전화번호", keyboardType: .default)
        
        designTextField(inputTextField: textField_PassWord, placeholderText: "비밀번호", keyboardType: .default)
        //비밀번호 가리기 위한 셋팅
        textField_PassWord.isSecureTextEntry = true
        
        designTextField(inputTextField: textField_Location, placeholderText: "위치", keyboardType: .default)
        
        designTextField(inputTextField: textField_Code, placeholderText: "추천 코드 입력", keyboardType: .numberPad)
        
        designTextField(inputTextField: textField_Nickname, placeholderText: "닉네임", keyboardType: .default)
    }
    

    //MARK: - Helper
    
    @IBAction func tappedBackground(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func tappedSignUpButton(_ sender: UIButton) {
        if checkSignUpConstraints() == false{
            print("잘못된 입력입니다.")
        }else{
            print("제대로된 입력입니다.")
        }
        
        view.endEditing(true)
    }
    
    func checkSignUpConstraints() -> Bool{
        if textField_ID.text == "" || textField_PassWord.text == "" || textField_PassWord.text?.count ?? 0 < 6 {
            return false
        }
        return true
    }
    
//    @IBAction func checkPassword(_ sender: UITextField) {
//        let number = ["1","2","3","4","5","6","7","8","9","0"]
//        number.contains(textField_Code.text?.)
//    }
}
