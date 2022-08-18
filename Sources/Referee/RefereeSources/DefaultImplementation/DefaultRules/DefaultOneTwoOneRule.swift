//
//  DefaultRule.swift
//  Referee
//
//  Created by Ilya Cherkasov on 27.07.2022.
//

public final class DefaultOneTwoOneRule: OneTwoOneRule {
    
    // MARK: - Properties
    
    public var priority: RulePriority
    public var tag: String
    weak public var opponent: Voting?
    
    public var isValid: Bool {
        guard let opponent = opponent else {
            return false
        }
        return rule(opponent)
    }
    
    // MARK: - Private properties
    
    public var rule: ((Voting) -> Bool)
    
    // MARK: - Initialization
    
    public init(priority: RulePriority, tag: String, rule: @escaping ((Voting) -> Bool)) {
        self.rule = rule
        self.priority = priority
        self.tag = tag
    }
    
}
