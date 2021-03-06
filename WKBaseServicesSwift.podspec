#
#  Be sure to run `pod spec lint WKBaseServicesSwift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "WKBaseServicesSwift"
  s.version      = "5.0.0"
  s.summary      = "WKBaseServicesSwift是一个Swift的基础的扩展服务框架"
  s.homepage     = "https://github.com/guoweikun621/WKBaseServicesSwift"
  s.license      = "MIT"
  s.author       = { "郭伟坤" => "guoweikun621@gmail.com" }
  s.ios.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/guoweikun621/WKBaseServicesSwift.git", :tag => s.version }
  s.source_files  = "Sources/**/*.swift"

  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
  #s.xcconfig = { 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/WKBaseServicesSwift/Sources' }
  #s.preserve_paths = 'Sources/module.modulemap'
end
