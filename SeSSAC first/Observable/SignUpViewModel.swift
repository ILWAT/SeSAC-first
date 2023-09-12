//
//  SignUpViewModel.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/09/12.
//

import Foundation

class SignUpViewModel {
    private let bannedNickname = ["시발", "병신", "개새끼", "Asdf" ]
    private let emailDomain = ["@naver.com", "gmail.com"]
    
    private var validNickname = true
    private var validPW = false
    private var validID = false
    
    let nickname = Observable(value: "")
    let id = Observable(value: "")
    let pw = Observable(value: "")
    let isVlid = Observable(value: false)
    
    
    func checkValidId(){
        for item in bannedNickname{
            if nickname.value.contains(item){
                validNickname = false
            }
        }
        
        if pw.value.count >= 4{
            validPW = true
        }
        
        for item in emailDomain{
            if id.value.contains(item){
                validID = true
            }
        }
       
        if validNickname&&validPW&&validID{
            isVlid.value = true
        } else{
            isVlid.value = false
        }
        
        //초기 값으로 되돌린다.
        validID = false
        validPW = false
        validNickname = true
    }
    
}
