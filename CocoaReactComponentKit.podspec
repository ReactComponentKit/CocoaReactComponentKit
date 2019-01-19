Pod::Spec.new do |s|
  s.name         = "CocoaReactComponentKit"
  s.version      = "0.2.1"
  s.summary      = "CocoaReactComponentKit is ReactComponentKit for Cocoa, Mac OS X. It is a library for building NSViewController based on Components."
  s.homepage     = "https://github.com/ReactComponentKit/CocoaReactComponentKit"
  s.license      = "MIT"
  s.author             = { "Burt.K" => "skyfe79@gmail.com" }
  s.social_media_url   = "http://twitter.com/skyfe79"
  s.platform     = :osx
  s.osx.deployment_target = '10.11'
  s.swift_version         = "4.2"
  s.source       = { :git => "https://github.com/ReactComponentKit/CocoaReactComponentKit.git", :tag => "#{s.version}" }
  s.source_files  = "CocoaReactComponentKitApp/CocoaReactComponentKit/**/{*.swift}"
  s.resource_bundles = { 
    'CocoaReactComponentKit' => ['CocoaReactComponentKitApp/CocoaReactComponentKit/**/{*.xib}']
  }
  s.requires_arc = true
  s.dependency "RxSwift", ">= 4.2.0"
  s.dependency "RxCocoa", ">= 4.2.0"
  s.dependency "BKRedux", ">= 1.0.0"
  s.dependency "BKEventBus", ">= 1.0.7"
end