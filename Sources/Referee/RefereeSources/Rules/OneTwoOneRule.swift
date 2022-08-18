//
//  OneTwoOneRule.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

public protocol OneTwoOneRule: AnyObject, Rule {
    
    var opponent: Voting? { get set }
        
}
