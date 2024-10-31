//
//  SuffixJobScheduler.swift
//
//
//  Created by Anton on 31.10.2024.
//

import Foundation

// MARK: - Job для отслеживания времени выполнения поиска
public struct SearchJob: Identifiable {
    public let id = UUID()
    public let text: String
    public var result: [(String, Int)] = []
    public var duration: Double = 0
}

public actor SuffixJobScheduler {
    public private(set) var history: [SearchJob] = []
    
    public init () { }
    
    public func addJob(text: String) async {
        let start = CFAbsoluteTimeGetCurrent()
        
        let creator = SuffixesCreator(text: text)
        
        let duration = CFAbsoluteTimeGetCurrent() - start
        
        let job = SearchJob(
            text: text,
            result: creator.allSuffixes.sorted { $0.key < $1.key },
            duration: duration
        )
        
        history.append(job)
    }
}
