//
//  Injected.swift
//
//
//  Created by Anton on 27.09.2024.
//

import Foundation

@propertyWrapper
public struct Injected<Service: InjectedServiceProtocol> {
	private var service: Service!
	public init() { }
	public var wrappedValue: Service {
		mutating get {
			if service == nil {
				service = ServiceLocator.shared.resolve()
			}
			return service
		}
	}
	 
	public var projectdValue: Injected<Service> {
		get { return self }
		mutating set { self = newValue }
	}
}
