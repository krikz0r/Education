//
//  SuffixesCreator.swift
//
//
//  Created by Anton on 14.10.2024.
//

import Foundation

// Модель для создания суффиксов
public struct SuffixesCreator {
    public var allSuffixes: [String: Int] = [:]
    public var threeLetterSuffixes: [String: Int] = [:]
    
    public init(text: String) {
        guard !text.isEmpty else { return }
        let words = text.split { !$0.isLetter }
        for word in words {
            let sequence = SuffixSequence(string: String(word))
            for suffix in sequence {
                allSuffixes[String(suffix)] = (allSuffixes[String(suffix)] ?? 0) + 1
            }
            
            if word.count >= 3 {
                let threeLetterSuffix = String(word.suffix(3))
                if !threeLetterSuffix.isEmpty {
                    threeLetterSuffixes[threeLetterSuffix] = (threeLetterSuffixes[threeLetterSuffix] ?? 0) + 1
                }
            }
        }
    }
}

// Итератор для суффиксов
struct SuffixIterator: IteratorProtocol {
    let string: String
    let length: Int
    var index = 1
    
    init(string: String) {
        self.string = string
        length = string.count
    }
    
    mutating func next() -> Substring? {
        guard index <= length else {
            return nil
        }
        let suffix = string.suffix(index)
        index += 1
        return suffix
    }
}

// Последовательность для итерации по суффиксам
struct SuffixSequence: Sequence {
    let string: String
    
    func makeIterator() -> SuffixIterator {
        return SuffixIterator(string: string)
    }
}
