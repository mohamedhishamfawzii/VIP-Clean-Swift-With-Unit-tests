//
//  Array+Extension.swift
//  VIPCleanPOC
//
//  Created by Mohamed Hisham on 10/11/2022.
//

import Foundation

//only to use it in the coordinator
extension Array {

    mutating func removeElementByReference(_ element: Element?) {
        
        if let _element = element {
            removeElementByReference(_element)
        }
    }
    
    mutating func removeElementByReference(_ element: Element) {
        let objIndex = firstIndex {
            return $0 as AnyObject === element as AnyObject
        }
        
        if let objIndex = objIndex {
            remove(at: objIndex)
        }
    }
}
