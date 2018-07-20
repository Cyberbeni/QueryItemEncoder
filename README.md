[![Build Status](https://travis-ci.org/Cyberbeni/QueryItemEncoder.svg?branch=master)](https://travis-ci.org/Cyberbeni/QueryItemEncoder) [![Code coverage](https://codecov.io/github/Cyberbeni/QueryItemEncoder/coverage.svg?branch=master)](https://codecov.io/github/Cyberbeni/QueryItemEncoder?branch=master)

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
