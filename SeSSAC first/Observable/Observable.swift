//
//  Observable.swift
//  SeSSAC first
//
//  Created by 문정호 on 2023/09/12.
//

import Foundation

class Observable<T> {
    private var delegate: ((T) -> Void)?
    
    var value: T{
        didSet{
            delegate?(self.value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(completionHandler: @escaping (T) -> Void){
        completionHandler(value)
        delegate = completionHandler
    }
}
