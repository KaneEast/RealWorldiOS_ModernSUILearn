//
//  RealmMigrator.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/29.
//

import RealmSwift

enum RealmMigrator {
    
    static private func migrationBlock(
        migration: Migration,
        oldSchemaVersion: UInt64
    ) {
        if oldSchemaVersion < 1 {
            migration.enumerateObjects(
                ofType: Animal.className()
            ) { _, newObject in
                //newObject?["descriptionM"] = "dumy"
            }
        }
    }
    
    static var configuration: Realm.Configuration {
      Realm.Configuration(schemaVersion: 1, migrationBlock: migrationBlock)
    }

}

