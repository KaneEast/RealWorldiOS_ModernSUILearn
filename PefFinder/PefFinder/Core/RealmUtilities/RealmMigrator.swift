//
//  RealmMigrator.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/29.
//

import RealmSwift

enum RealmMigrator {
    static private func migrationBlock(migration: Migration, oldSchemaVersion: UInt64) {
        if oldSchemaVersion < 2 {
            migration.enumerateObjects(
                ofType: AnimalEntity.className()
            ) { _, newObject in
                newObject?["ranking"] = 0
            }
        }
    }
    
    static var configuration: Realm.Configuration {
        let configuration = Realm.Configuration(schemaVersion: 2, migrationBlock: migrationBlock)
        print("User Realm User file location: \(configuration.fileURL!.path)")
        return configuration
    }
}
