//
//  Limited.swift
//  Referee
//
//  Created by Ilya Cherkasov on 27.07.2022.
//

@propertyWrapper struct Limited<Value: Comparable> {
    
    // MARK: - Property Wrapper
    
    var wrappedValue: Value {
        set {
            value = newValue
        }
        get {
            getWrapped()
        }
    }
    
    // MARK: - Private properties
    
    private let minValue: Value
    private let maxValue: Value
    private var value: Value
    
    // MARK: - Initialization
    
    init(from min: Value, to max: Value, value: Value) {
        self.minValue = min
        self.maxValue = max
        self.value = value
    }
    
    init(from min: Value = 0, to max: Value = 1000, value: Value = 0) where Value == Int {
        self.minValue = min
        self.maxValue = max
        self.value = value
    }
        
}

private extension Limited {
    
    func getWrapped() -> Value {
        max(minValue, min(value, maxValue))
    }
    
}
