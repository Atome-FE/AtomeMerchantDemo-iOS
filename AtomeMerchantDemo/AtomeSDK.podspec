Pod::Spec.new do |s|
  s.name        = "AtomeSDK"
  s.version     = "0.0.1"
  s.summary     = "A SDK for Atome"
  s.homepage    = "https://github.com/Atome-FE/AtomeMerchantDemo-iOS"
  s.license     = { :type => "MIT" }
  s.authors     = { "hby" => "houboye@outlook.com" }

  s.requires_arc = true
  s.swift_version = "5.0"
  s.ios.deployment_target = "11.0"
  s.source   = { :git => "https://github.com/Atome-FE/AtomeMerchantDemo-iOS.git", :tag => s.version }
  s.source_files = "AtomeMerchantDemo/Sources/AtomeSDK.framework"
  s.frameworks = 'UIKit'
end
