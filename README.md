# AppleWatchScreenSize

An easy way to get screen size and rounded corner size of Apple Watch.

# Installation
Require watchOS 4 or higher.
In Xcode go to `File -> Swift Packages -> Add Package Dependency` 
and paste in the repo's url: 

`https://github.com/VIkill33/AppleWatchScreenSize.git`

Or you can download the code of this repo, then `Add Local...` in Xcode, and open the folder of the repo.

# Usage
- Import this package after you installed by `import AppleWatchScreenSize`
- This repo define a public struct called ScreenSize containing 3 vars called width, height and a computed var cornerSize. You can easily know what they mean from their name(Note all vars were measured as **px**). So the demo code would be like:
```swift
import SwiftUI
import AppleWatchScreenSize

struct ContentView: View {
    let screenSize = ScreenSize()
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: Double(screenSize.cornerSize ?? 0), height: Double(screenSize.cornerSize ?? 0)))
            .stroke(lineWidth: 10.0)
            .foregroundColor(.red)
            .edgesIgnoringSafeArea(.all)
    }
}
```
The preview will be like:

<img width="224" alt="image" src="https://github.com/VIkill33/AppleWatchScreenSize/assets/78488529/4bc020e9-1477-408e-b01f-226268728e9d">

# How does it work
The data comes from https://screensizes.app/?compare=applewatch.
Since Apple Watch with same resolution share the same rounded corner size, it's not hard to infer the corner size from given screen size. Before series 3 Apple Watch just have a rectangle screen, so the corner size of them will return **nil** instead.

It can't be denied that Apple may someday release a new watch with same resolution but different corner size, but it works fine by now ;)
