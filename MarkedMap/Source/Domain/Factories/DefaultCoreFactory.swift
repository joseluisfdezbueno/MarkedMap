//
//  DefaultCoreFactory.swift
//  MarkedMap
//
//  Created by Jose Luis Fernandez on 15/09/2020.
//  Copyright © 2020 joseluisfdezbueno. All rights reserved.
//

import MarkedMapCore

class DefaultCoreFactory: CoreFactoryProtocol {
    
    static var shared: DefaultCoreFactory = DefaultCoreFactory()
    
    private init() { }
    
    func getMapService() -> MapServiceProtocol {
        return MapService()
    }

}
