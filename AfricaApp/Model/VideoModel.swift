//
//  VideoModel.swift
//  Africa
//
//  Created by Nilam Shah on 01/12/23.
//

import Foundation

struct Video : Codable, Identifiable {
    var id: String
    var name: String
    var headline: String
    
    //Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
