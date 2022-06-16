//
//  RMStageSession.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import RealmSwift

class RMStageSession: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var stageId = ""
    @Persisted var wrongAttempt = 0
    @Persisted var correctAttempt = 0
    @Persisted var startedAt: Date? = nil
    @Persisted var endedAt: Date? = nil
}
