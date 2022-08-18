//
//  PupilDelegate.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

public protocol VotersProvider: AnyObject {
    
    var voters: [Voting] { get }
    
}
