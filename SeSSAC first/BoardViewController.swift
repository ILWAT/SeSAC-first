//
//  BoardViewController.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/07/19.
//

import UIKit

class BoardViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var inputTextView: UIView!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet weak var sendTextButton: UIButton!
    @IBOutlet weak var changeColorButton: UIButton!
    
    let colorSet: [UIColor] = [.red, .white, .yellow, .blue, .gray, .black]
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designDisplayLabel()
        designInputTextView()
        
    }
    
    @IBAction func tappedTapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        
        //View isHidden Assignment
//        if inputTextView.isHidden == true{
//            inputTextView = false
//        }else{
//            inputTextView.isHidden = true
//        }
        inputTextView.isHidden = !inputTextView.isHidden
    }
    
    @IBAction func tappedInputButton(_ sender: UIButton) {
        if inputTextField.text?.isEmpty == true {
            displayLabel.text = "내용을 입력해주세요"
        }
        else{
            displayLabel.text = inputTextField.text
            inputTextField.text = ""
        }
    }
    //MARK: - designUI
    
    func designDisplayLabel() {
        displayLabel.textAlignment = .center
        displayLabel.text = "안녕하세요"
        displayLabel.font = .boldSystemFont(ofSize: 20)
        displayLabel.textColor = .blue
        displayLabel.numberOfLines = 3
        displayLabel.textAlignment = .center
        displayLabel.adjustsFontSizeToFitWidth = true
        displayLabel.font = .boldSystemFont(ofSize: 80)
    }
    
    func designInputextField() {
        //textfield 설정
        inputTextField.placeholder = "내용을 입력해주세요."
        inputTextField.textColor = .black
        inputTextField.keyboardType = .emailAddress
        inputTextField.borderStyle = .line
        //TextField ReturnKey Assignment
        inputTextField.returnKeyType = .done
    }
    
    func designInputTextView(){
        //뷰 설정하기
        inputTextView.layer.cornerRadius = 10
        inputTextView.layer.borderColor = UIColor.black.cgColor
        inputTextView.layer.borderWidth = 1
        inputTextView.clipsToBounds = true
        
        
        //보내기 버튼 설정하기
        sendTextButton.layer.cornerRadius = 10
        sendTextButton.layer.borderColor = UIColor.black.cgColor
        sendTextButton.layer.borderWidth = 2
        sendTextButton.setTitleColor(.black, for: .normal)
        
        //색 바꾸기 버튼 설정하기
        changeColorButton.layer.cornerRadius = 10
        changeColorButton.layer.borderColor = UIColor.black.cgColor
        changeColorButton.layer.borderWidth = 2
        changeColorButton.setTitleColor(.blue, for: .normal)
        
        designInputextField()
    }
    
    
    //MARK: - Helper
    @IBAction func testDidEndOnExit(_ sender: UITextField) {
        print("잘 실행되었습니다.")
    }

    @IBAction func tappedChangeColorBtn(_ sender: UIButton) {
        let randomColor = colorSet.shuffled()[0]
        
        var config = UIButton.Configuration.plain()
        var attributedString = AttributedString(stringLiteral: "Aa")
        attributedString.foregroundColor = randomColor
        if randomColor.isEqual(UIColor.white) || randomColor.isEqual(UIColor.yellow) {
            changeColorButton.backgroundColor = .black

        } else {
            changeColorButton.backgroundColor = .white
        }
        config.attributedTitle = attributedString
        changeColorButton.configuration = config
//        changeColorButton.updateConfiguration()

            
//        changeColorButton.setTitleColor(randomColor, for: .normal)
        displayLabel.textColor = randomColor
    }
    
}
