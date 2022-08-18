//
//  Validator.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

public class Validator {
    
    // MARK: - Properties
    
    public var rules = [Rule]()
    
    // MARK: - Initialization
    
    public init(rules: [Rule] = []) {
        self.rules = rules
    }
    
    // MARK: - Methods
    
    func checkYourself(voter: Voting) -> [Conflict] {
        let selfCheckRules = rules.filter { $0 is SelfCheckRule }
        return selfCheckRules.reduce([Conflict]()) { partialResult, rule in
            guard let rule = rule as? SelfCheckRule else {
                return partialResult
            }
            rule.voiter = voter
            let result =  partialResult +
                (rule.isValid ? [] : [Conflict(tag: rule.tag, priority: rule.priority)])
            rule.voiter = nil
            return result
        }
    }
    
    func startOneTwoOne(with voter: Voting) -> [Conflict] {
        rules.reduce([Conflict]()) { partialResult, rule in
            guard let rule = rule as? OneTwoOneRule else {
                return partialResult
            }
            rule.opponent = voter
            // TODO: - remove DefaultConflict
            let result = partialResult
                + (rule.isValid ? [] : [Conflict(tag: rule.tag, priority: rule.priority)])
            rule.opponent = nil
            return result
        }
    }
    
    func startRoundTable(with voters: [Voting]) -> [Conflict] {
        let roundTableRules = rules.filter { $0 is RoundTableRule }
        return roundTableRules.reduce([Conflict]()) { partialResult, rule in
            guard let rule = rule as? RoundTableRule else {
                return partialResult
            }
            rule.opponents = voters
            let result =  partialResult +
                (rule.isValid ? [] : [Conflict(tag: rule.tag, priority: rule.priority)])
            rule.opponents = nil
            return result
        }
    }
    
}
