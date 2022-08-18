//
//  VotersRule.swift
//  Referee
//
//  Created by Ilya Cherkasov on 25.07.2022.
//

public struct VotersRules: Voters {
    
    public var voters: [Voting]
    
    public init(_ rule: Rule, @VotersBuilder voters: () -> Voters) {
        self.voters = voters().voters
        self.voters.forEach {
            $0.validator.rules.append(rule)
        }
    }
    
    public init(_ rules: [Rule] = [], @VotersBuilder voters: () -> Voters) {
        self.voters = voters().voters
        self.voters.forEach {
            $0.validator.rules += rules
        }
    }
    
    public init(_ rule: Rule, @VotingBuilder voters: () -> [Voting]) {
        self.voters = voters()
        self.voters.forEach {
            $0.validator.rules.append(rule)
        }
    }
    
    public init(_ rules: [Rule] = [], @VotingBuilder voters: () -> [Voting]) {
        self.voters = voters()
        self.voters.forEach {
            $0.validator.rules += rules
        }
    }
    
}
