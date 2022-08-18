//
//  RoundTableRule.swift
//  Referee
//
//  Created by Ilya Cherkasov on 27.07.2022.
//

public protocol RoundTableRule: AnyObject, Rule {
    
    var opponents: [Voting]? { get set }
        
}
