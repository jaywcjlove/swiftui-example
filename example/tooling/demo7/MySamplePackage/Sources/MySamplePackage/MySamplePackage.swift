import SwiftUI


public func printLog(message: Any, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
        print("🍺🍺🍺\n\((file as NSString).lastPathComponent)[\(line)], \(method): \n\(message)\n🍺🍺🍺\n")
    #endif
}

public struct MySamplePackage {
    public private(set) var text = "Hello, World!"
    
    public init() {
    }
}
