//
//  File.swift
//  
//
//  Created by Anton on 27.09.2024.
//

public protocol InjectedServiceProtocol { }

public final class ServiceLocator {
	// Синглтон
	public static let shared = ServiceLocator()
	
	// Приватный инициализатор для предотвращения создания других экземпляров
	private init() {}
	
	// Хранилище для сервисов
	private var services: [String: InjectedServiceProtocol] = [:]
	
	// Регистрация сервиса
	public  func register<T: InjectedServiceProtocol>(_ service: T) {
		let key = "\(T.self)"
		services[key] = service
	}
	
	// Извлечение сервиса
	public  func resolve<T: InjectedServiceProtocol>() -> T? {
		let key = "\(T.self)"
		return services[key] as? T
	}
}
