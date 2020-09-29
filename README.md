# AtomeMerchantDemo-iOS
Atome Merchant iOS Demo 

## Integration

#### CocoaPods (iOS 11+)

You can use [CocoaPods](http://cocoapods.org/) to install `AtomeSDK` by adding it to your `Podfile`:

```ruby
platform :ios, '11.0'
use_frameworks!

target 'YourApp' do
    pod 'AtomeSDK'
end
```

## Usage

```swift
AtomeManager.shared.handPaymentURL(url)
```

```swift
AtomeManager.shared.canHandPaymentURL(url)
```

## Note

if your project is written by Objective-C, please create Bridging-Header.h
