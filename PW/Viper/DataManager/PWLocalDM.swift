//
//  PWLocalDM.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//


import RealmSwift
import RxSwift
import RxCocoa

class PWLocalDM {

    var realm: Realm? {
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        return try? Realm(configuration: config)
    }
    /*var realm: Realm? {
        let config = Realm
    }*/
}
