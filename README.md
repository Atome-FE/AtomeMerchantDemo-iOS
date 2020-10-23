# AtomeMerchantDemo-iOS
Atome Merchant iOS Demo 

## Integration

#### CocoaPods (iOS 11+)

You can use [CocoaPods](http://cocoapods.org/) to install `AtomeSDK` by adding it to your `Podfile`:

```ruby
platform :ios, '10.0'
use_frameworks!

target 'YourApp' do
    pod 'AtomeSDK'
end
```

**add Key:"Localization native development region" to your info.plist, type is "Array",add a string value "apaylater"**

eg.
![image](image.png)


## Usage

```swift
AtomeManager.shared.handPaymentURL(url)
```

```swift
if AtomeManager.shared.isAtomeInstalled() {
    debugPrint("Atome already installed")
} else {
    debugPrint("Atome not installed, please go to download")
}
```

## Note

if your project is written by Objective-C, please create Bridging-Header.h
