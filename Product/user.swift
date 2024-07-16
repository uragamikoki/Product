//
//  user.swift
//  sample
//
//  Created by Owner on 2024/07/11.
//

import Foundation

struct UserData: Identifiable{
    let id = UUID()
    let mail: String
    let password: String
}

var userArray = [
    UserData(mail: "test@test", password: "testtest1"),
    UserData(mail: "taro@test", password: "testtest2"),
    UserData(mail: "sato@test", password: "testtest3"),
    UserData(mail: "kato@test", password: "testtest4")
]
