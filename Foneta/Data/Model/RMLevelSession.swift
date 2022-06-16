//
//  RMLevelSession.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import RealmSwift

class RMLevelSession: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var levelId = ""
    @Persisted var startedAt: Date? = nil
    @Persisted var endedAt: Date? = nil
}
