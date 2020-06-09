//
//  cusModel.swift
//  Business
//
//  Created by kuetcse on 5/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import Foundation
class cusModel{
    var id: String?
    var seid: String?
    var topic: String?
    var amou: String?
    var dead: String?
    var subm: String?
    init(id: String?, seid: String?, topic: String?,amou: String?,dead: String?,subm: String?){
        self.id = id
        self.seid = seid
        self.topic = topic
        self.amou = amou
        self.dead = dead
        self.subm = subm
    }
    
}
