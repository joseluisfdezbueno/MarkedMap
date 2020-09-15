//
//  PointOfInterestModel.swift
//  MarkedMapCore
//
//  Created by Jose Luis Fernandez on 15/09/2020.
//  Copyright © 2020 joseluisfdezbueno. All rights reserved.
//

public class PointOfInterestModel: Decodable {
    
    public var id: String
    public var name: String
    public var companyZoneType: CompanyZoneType
    public var latitude: Double
    public var longitude: Double

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case companyZoneType = "companyZoneId"
        case latitude = "y"
        case longitude = "x"
    }

}
