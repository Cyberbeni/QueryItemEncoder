import Foundation

struct _JSONEncodingStorage {
    // MARK: Properties
    
    /// The container stack.
    /// Elements may be any one of the JSON types (NSNull, NSNumber, NSString, NSArray, NSDictionary).
    private(set) var containers: [NSObject] = []
    
    // MARK: - Initialization
    
    /// Initializes `self` with no containers.
    init() {}
    
    // MARK: - Modifying the Stack
    
    var count: Int {
        return self.containers.count
    }
    
    mutating func pushKeyedContainer() -> NSMutableDictionary {
        let dictionary = NSMutableDictionary()
        self.containers.append(dictionary)
        return dictionary
    }
    
    mutating func pushUnkeyedContainer() -> NSMutableArray {
        let array = NSMutableArray()
        self.containers.append(array)
        return array
    }
    
    mutating func push(container: NSObject) {
        self.containers.append(container)
    }
    
    mutating func popContainer() -> NSObject {
        precondition(!self.containers.isEmpty, "Empty container stack.")
        return self.containers.popLast()!
    }
}
