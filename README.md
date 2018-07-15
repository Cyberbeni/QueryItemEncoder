# Installing

Add `pod 'QueryItemEncoder'` to your podfile

# Usage

```swift
var urlBuilder = URLComponents(string: "http://example.com")
let encoder = QueryItemEncoder()
urlBuilder.queyItems = encoder.encode(encodableObject)
var request = URLRequest(url: urlBuilder.url)
...
```
