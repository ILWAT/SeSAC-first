//
//  SignUpViewModel.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/09/12.
//

import Foundation

class SignUpViewModel {
    private let bannedNickname = ["시발", "병신", "개새끼", "Asdf" ]
    private let emailDomain = ["naver.com", "gmail.com"]
    
    private var validNickname = false
    private var validPW = false
    private var validID = false
    private var validReco = false
    
    let nickname = Observable(value: "")
    let id = Observable(value: "")
    let pw = Observable(value: "")
    let recommandCode = Observable(value: "")
    let isValid = Observable(value: false)
    let showState = Observable(value: "")
    
    
    
    func checkValidId(){
        if nickname.value.count >= 2{ //닉네임은 최소 2글자 이상이어야한다.
            validNickname = true
            for item in bannedNickname{
                if nickname.value.contains(item){
                    validNickname = false
                    showState.value = "비속어가 포함된 닉네임은 사용할 수 없습니다.\n 닉네임을 변경해주세요"
                }
            }
        }
       
        if pw.value.count >= 4{ //비밀번호는 4자리 이상이어야 한다.
            validPW = true
        } else {
            showState.value = "비밀번호는 4자리 이상이어야합니다."
        }
        
        
        for item in emailDomain { //이메일은 @와 도메인이 포함되어야한다.
            if id.value.contains(item) && id.value.contains("@"){
                validID = true
            }
        }
        if !validID {
            showState.value = "올바른 이메일을 입력해주세요."
        }
        
            
        if recommandCode.value.count >= 6 {
            validReco = true
        } else {
            showState.value = "추천코드는 6자리 이상이어야 합니다."
        }
       
        if validNickname&&validPW&&validID&&validReco{
            isValid.value = true
            showState.value = "올바른 입력값입니다. 회원가입을 진행해주세요."
        } else{
            isValid.value = false
        }
        
        //초기 값으로 되돌린다.
        validID = false
        validPW = false
        validNickname = false
        validReco = false
    }
    
}
