//
//  Conflict.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 11.06.2022.
//

public struct Conflict {
    
    public var tag: String
    public var priority: RulePriority
    
    public init(tag: String, priority: RulePriority) {
        self.tag = tag
        self.priority = priority
    }
    
}
