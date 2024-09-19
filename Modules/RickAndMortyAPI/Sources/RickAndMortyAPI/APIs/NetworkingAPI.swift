//
// NetworkingAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class NetworkingAPI {

    /**
     Получить список персонажей с пагинацией
     
     - parameter page: (query) Номер страницы для получения данных о персонажах. (optional)
     - returns: ModelResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func characterGet(page: Int? = nil) async throws -> ModelResponse {
        return try await characterGetWithRequestBuilder(page: page).execute().body
    }

    /**
     Получить список персонажей с пагинацией
     - GET /character/
     - parameter page: (query) Номер страницы для получения данных о персонажах. (optional)
     - returns: RequestBuilder<ModelResponse> 
     */
    open class func characterGetWithRequestBuilder(page: Int? = nil) -> RequestBuilder<ModelResponse> {
        let localVariablePath = "/character/"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": (wrappedValue: page?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<ModelResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Получить список локаций с пагинацией
     
     - parameter page: (query) Номер страницы для получения данных о локациях. (optional)
     - returns: LocationResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func locationGet(page: Int? = nil) async throws -> LocationResponse {
        return try await locationGetWithRequestBuilder(page: page).execute().body
    }

    /**
     Получить список локаций с пагинацией
     - GET /location/
     - parameter page: (query) Номер страницы для получения данных о локациях. (optional)
     - returns: RequestBuilder<LocationResponse> 
     */
    open class func locationGetWithRequestBuilder(page: Int? = nil) -> RequestBuilder<LocationResponse> {
        let localVariablePath = "/location/"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": (wrappedValue: page?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LocationResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
