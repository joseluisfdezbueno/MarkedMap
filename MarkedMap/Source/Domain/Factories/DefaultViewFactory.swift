//
//  DefaultViewFactory.swift
//  MarkedMap
//
//  Created by Jose Luis Fernandez on 15/09/2020.
//  Copyright © 2020 joseluisfdezbueno. All rights reserved.
//

class DefaultViewFactory: ViewFactoryProtocol {

    static var shared: DefaultViewFactory = DefaultViewFactory()

    private init() { }

    func getMapView() -> MapViewControllerProtocol {
        let view = MapViewController()
        let presenter = MapPresenter(view: view)
        view.presenter = presenter
        return view
    }

}
