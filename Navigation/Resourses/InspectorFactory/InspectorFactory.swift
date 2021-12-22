//
//  InspectorFactory.swift
//  Navigation
//
//  Created by admin on 14.12.2021.
//

import Foundation

protocol InspectorFactoryProtocol {
    func makeLoginIncpector() -> LoginInspector
}

class InspectorFactory: InspectorFactoryProtocol {
    func makeLoginIncpector() -> LoginInspector {
        return LoginInspector()
    }
}
