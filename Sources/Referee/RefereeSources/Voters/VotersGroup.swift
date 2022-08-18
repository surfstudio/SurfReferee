//
//  VotersSet.swift
//  Referee
//
//  Created by Ilya Cherkasov on 25.07.2022.
//

public struct VotersGroup: Voters {
    
    public var voters: [Voting]
    
    public init(@VotersBuilder voters: () -> Voters) {
        self.voters = voters().voters
    }
    
    public init(@VotingBuilder voters: () -> [Voting]) {
        self.voters = voters()
    }
    
}

@resultBuilder public struct VotersBuilder {
    
    public static func buildBlock(_ components: Voters...) -> Voters {
        VotersDTO(voters: components.flatMap { $0.voters })
    }
    
}

@resultBuilder public struct VotingBuilder {
    
    public static func buildBlock(_ components: Voting...) -> [Voting] {
        components
    }
    
}
