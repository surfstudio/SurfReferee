//
//  Refereing.swift
//  Referee
//
//  Created by Ilya Cherkasov on 25.07.2022.
//

public protocol Refereing {
    
    var votersBody: Voters { get }
    
    func startVoting() -> [Conflict]
    
}

public extension Refereing {
    
    func startVoting() -> [Conflict] {
        let referee = Referee.make(with: votersBody.voters)
        return referee.startVoting()
    }
    
}
