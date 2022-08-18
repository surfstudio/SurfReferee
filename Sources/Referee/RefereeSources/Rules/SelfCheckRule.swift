//
//  SelfCheckRule.swift
//  Referee
//
//  Created by Ilya Cherkasov on 27.07.2022.
//

public protocol SelfCheckRule: AnyObject, Rule {
    
    var voiter: Voting? { get set }
        
}
