//
//  SectionData.swift
//  CookBookMVVM
//
//  Created by admin on 8/22/21.
//

import RxDataSources

struct SectionData: SectionModelType {
    let header: String
    var items: [Item]
}
 
extension SectionData {
    typealias Item = String
    
    init(original: SectionData, items: [Item]) {
        self = original
        self.items = items
    }
}
