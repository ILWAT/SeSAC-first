//
//  LoginViewController.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/07/19.
//

import UIKit

enum TextFieldType: Int, CaseIterable {
    case id = 1
    case password = 2
    case location = 3
    case reco_code = 4
    case nickanme = 5
    
}

class LoginViewController: UIViewController {

    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var switch_EtcInput: UISwitch!
    @IBOutlet var textField_Code: UITextField!
    @IBOutlet var textField_Location: UITextField!
    @IBOutlet var textField_Nickname: UITextField!
    @IBOutlet var textField_PassWord: UITextField!
    @IBOutlet var textField_ID: UITextField!
    
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyAllUI()
        setTag()
        
        
        //UserDefaults를 통해 데이터를 읽어들임
        //키를 입력할때 오타에 유의하자 -> 값을 못 읽어들일 수 도 있음.
        //UserDefaults 에서 값을 불러올때 다른 값들은 기본값들이 존재하지만 String의 경우에는 Optional이 씌워진다.
        //String은 각 언어도 다르고 기본값을 주기 애매하기 때문에?! Optional로 return
        let nameValue = UserDefaults.standard.string(forKey: "name")
        let pWValue = UserDefaults.standard.string(forKey: "password")
        let nickNameValue  = UserDefaults.standard.string(forKey: "nickname")
        let locationValue = UserDefaults.standard.string(forKey: "location")
        
        
        //Optional Binding (if)
        if let nameValue { textField_ID.text = nameValue }
        if let nickNameValue { textField_Nickname.text = nickNameValue }
        if let pWValue { textField_PassWord.text = pWValue }
        if let locationValue { textField_Location.text = locationValue }
        
        
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
        inputTextField.layer.cornerRadius = 10
        inputTextField.clipsToBounds = true
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
    
    @IBAction func tappedTextFieldKeyboard(_ sender: UITextField) {
        
        guard let text = sender.text, let value = TextFieldType(rawValue: sender.tag) else {
            print("오류가 발생했습니다.")
            return
        }
        
//        guard let value = TextFieldType(rawValue: sender.tag) else {
//            print("오류가 발생했습니다.")
//            return
//        }
        
        //tag를 enum(열거형)을 통해 어떤 입력인지 판단하고 switch문을 통해 출력하는 방식
        switch value {
        case .id : print("아이디는 \(text) 입니다.")
        case .password : print("비밀번호 \(text) 입니다.")
        case .location : print("위치는 \(text) 입니다.")
        case .reco_code : print("추천코드는 \(text) 입니다.")
        case .nickanme : print("닉네임은 \(text) 입니다.")
        }
        
        //tag를 활용하여 어떤 입력인지 판단하고 출력하는 switch문 방식
//        switch sender.tag {
//        case TextFieldType.id.rawValue : print("아이디는 \(text) 입니다.")
//        case TextFieldType.password.rawValue : print("비밀번호 \(text) 입니다.")
//        case TextFieldType.location.rawValue : print("위치는 \(text) 입니다.")
//        case TextFieldType.reco_code.rawValue : print("추천코드는 \(text) 입니다.")
//        case TextFieldType.nickanme.rawValue : print("닉네임은 \(text) 입니다.")
//        default: print("오류가 발생했습니다.")
//        }
        
        
        //tag를 활용하여 어떤 입력인지 판단하고 출력하는 if문 방식
//        if sender.tag == 1{
//            print("아이디는 \(text) 입니다.")
//        } else if sender.tag == 2 {
//            print("비밀번호 \(text) 입니다.")
//        } else if sender.tag == 3{
//            print("닉네임은 \(text) 입니다.")
//        } else if sender.tag == 4{
//            print("추천코드는 \(text) 입니다.")
//        }
    }
    
    func setTag(){
        for i in 0..<textFields.count {
            let typeArr = TextFieldType.allCases
            textFields[i].tag = typeArr[i].rawValue
        }
    }
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        UserDefaults.standard.set(textField_ID.text!, forKey: "name")
        UserDefaults.standard.set(textField_PassWord!, forKey: "password")
        UserDefaults.standard.set(textField_Code.text!, forKey: "rec_code")
        UserDefaults.standard.set(textField_Location.text!, forKey: "location")
        UserDefaults.standard.set(textField_Nickname.text!, forKey: "nickname")
        
        //버튼 클릭 횟수 저장 기능
        UserDefaults.standard.set(3, forKey: "count")
        //1. 저장된 횟수 가지고 오기
        let value = UserDefaults.standard.integer(forKey: "count")
        //2. 저장된 횟수에 1을 더하기
        let result = value + 1
        //3. 2번 결과를 다시 저장해주기
        UserDefaults.standard.set(result, forKey: "count")
        
        print("저장되었습니다.")
    }
    
}
