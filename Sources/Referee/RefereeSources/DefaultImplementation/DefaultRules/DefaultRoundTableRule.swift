//
//  DefaultRoundTableRule.swift
//  Referee
//
//  Created by Ilya Cherkasov on 27.07.2022.
//

final public class DefaultRoundTableRule: RoundTableRule {
    
    // MARK: - Properties

    public var priority: RulePriority
    public var tag: String
    public var opponents: [Voting]?
    
    public var isValid: Bool {
        guard let opponents = opponents else {
            return false
        }
        return rule(opponents)
    }
    
    // MARK: - Private properties
    
    private var rule: (([Voting]) -> Bool)
    
    // MARK: - Initialization
    
    public init(priority: RulePriority, tag: String, rule: @escaping (([Voting]) -> Bool)) {
        self.rule = rule
        self.priority = priority
        self.tag = tag
    }
    
}
