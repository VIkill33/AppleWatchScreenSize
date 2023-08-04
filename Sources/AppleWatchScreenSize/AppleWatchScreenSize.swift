import WatchKit

/**
 A struct representing the screen size of a device.
 
 Every instance of this struct represents a specific screen size, defined by its width and height dimensions. It conforms to the `Hashable` protocol.
 
 - Note: The `width` and `height` properties define the dimensions of the screen size.
 
 - Note: The `cornerSize` property provides the corner size value associated with this screen size. It is an optional `Int` value.
 
 - Important: The `cornerSize` property's value is derived based on a predefined dictionary that maps screen sizes to corner sizes. If no corner size is associated with the current screen size, then it returns `nil`.
 
 - Remark: The `init` method creates a new instance of `ScreenSize` with the specified width and height. By default, it uses the screen bounds of the current device.
 
 - Remark: The `hash(into:)` method computes a hash value for this screen size based on its width and height.
 
 - Note: The `==` operator compares two `ScreenSize` instances for equality based on their width and height dimensions.
 */
@available(watchOS 4.0, *)
struct ScreenSize: Hashable {
    var width: CGFloat
    var height: CGFloat
    
    /**
     The corner size value associated with this screen size.
     
     If no corner size is associated with the current screen size, it returns `nil`.
     */
    var cornerSize: Int? {
        get {
            let dic: [ScreenSize: Int?] = [
                ScreenSize(width: 136, height: 170): nil,
                ScreenSize(width: 156, height: 195): nil,
                ScreenSize(width: 162, height: 197): 28,
                ScreenSize(width: 176, height: 215): 38,
                ScreenSize(width: 184, height: 224): 34,
                ScreenSize(width: 198, height: 242): 41,
                ScreenSize(width: 205, height: 251): 54
            ]
            return dic[self] ?? nil
        }
    }
    
    /**
     Creates a new instance of `ScreenSize`.
     
     - Parameter width: The width dimension of the screen size. It defaults to the screen bounds' width of the current device.
     - Parameter height: The height dimension of the screen size. It defaults to the screen bounds' height of the current device.
     */
    init(width: CGFloat = WKInterfaceDevice.current().screenBounds.size.width, height: CGFloat = WKInterfaceDevice.current().screenBounds.size.height) {
        self.width = width
        self.height = height
    }
    
    /**
     Computes a hash value for this screen size based on its width and height.
     
     - Parameter hasher: The hasher used to combine the values.
     */
    func hash(into hasher: inout Hasher) {
        hasher.combine(width)
        hasher.combine(height)
    }
    
    /**
     Compares two `ScreenSize` instances for equality based on their width and height dimensions.
     
     - Parameter lhs: The left-hand side `ScreenSize` instance to compare.
     - Parameter rhs: The right-hand side `ScreenSize` instance to compare.
     
     - Returns: `true` if the width and height dimensions of both instances are equal, otherwise `false`.
     */
    static func ==(lhs: ScreenSize, rhs: ScreenSize) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}
