//
//  Convertible.swift
//  SmallSquareBox
//
//  Created by 艾伦 on 2023/7/14.
//


import Foundation

protocol StringRepresentable: CustomStringConvertible {
    init?(_ string: String)
}

extension Int: StringRepresentable {}

struct StringBacked<Value: StringRepresentable>: Codable {
    var value: Value
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        
        guard let value = Value(string) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Failed to convert an instance of \(Value.self) from '\(string)'"
            )
        }
        
        self.value = value
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value.description)
    }
}

