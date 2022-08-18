//
//  Voters.swift
//  Referee
//
//  Created by Ilya Cherkasov on 25.07.2022.
//

public protocol Voters {
    
    var voters: [Voting] { get set }
        
}

struct VotersDTO: Voters {
    
    var voters: [Voting]
    
}
