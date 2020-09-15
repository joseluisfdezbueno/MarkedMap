//
//  MapServiceProtocol.swift
//  MarkedMapCore
//
//  Created by Jose Luis Fernandez on 15/09/2020.
//  Copyright © 2020 joseluisfdezbueno. All rights reserved.
//

import RxSwift

public protocol MapServiceProtocol {
        
    func getPointsOfInterest() -> Observable<[PointOfInterestModel]>

}
