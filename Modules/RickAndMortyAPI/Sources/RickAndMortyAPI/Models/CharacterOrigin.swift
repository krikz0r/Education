//
// CharacterOrigin.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Локация происхождения персонажа */
public struct CharacterOrigin: Codable, Hashable {

    /** Имя локации происхождения */
    public var name: String?
    /** URL локации происхождения */
    public var url: String?

    public init(name: String? = nil, url: String? = nil) {
        self.name = name
        self.url = url
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case url
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(url, forKey: .url)
    }
}

