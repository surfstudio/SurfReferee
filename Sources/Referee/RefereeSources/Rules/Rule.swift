//
//  Rule.swift
//  Referee
//
//  Created by Ilya Cherkasov on 27.07.2022.
//

public protocol Rule {
    
    var isValid: Bool { get }
    var priority: RulePriority { get set }
    var tag: String { get set }
    
}

