Pod::Spec.new do |s|
  s.name        = "AtomeSDK"
  s.version     = "0.0.1"
  s.summary     = "A SDK for Atome"
  s.homepage    = "https://github.com/Atome-FE/AtomeMerchantDemo-iOS"
  s.license     = { :type => "MIT" }
  s.authors     = { "hby" => "houboye@outlook.com" }

  s.platform     = :ios
  s.requires_arc = true
  s.swift_version = "5.0"
  s.ios.deployment_target = "11.0"
  s.static_framework = true
  s.source   = { :git => "https://github.com/Atome-FE/AtomeMerchantDemo-iOS.git", :tag => s.version }
  s.source_files = "AtomeMerchantDemo/AtomeSDK.framework/Headers/*.{h}"
  s.vendored_frameworks = 'AtomeMerchantDemo/AtomeSDK.framework'
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }
  s.frameworks = 'UIKit'
end
