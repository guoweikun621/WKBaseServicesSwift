#
#  Be sure to run `pod spec lint WKBaseServicesSwift.podspec.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "WKBaseServicesSwift.podspec"
  s.version      = "2.0.0"
  s.summary      = "WKBaseServicesSwift 是一个swift的基础的扩展服务框架。"

  s.homepage     = "https://github.com/guoweikun621/WKBaseServicesSwift"

  s.license      = "MIT"
  s.authors            = { "郭伟坤" => "guoweikun621@gmail.com" }

  s.platform     = :ios, "8.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/guoweikun621/WKBaseServicesSwift.git", :tag => "#{s.version}" }

  s.source_files  = "WKBaseServicesSwift", "WKBaseServicesSwift/Sources/**/*.swift"

  s.frameworks = "UIKit", "Foundation"

  s.requires_arc = true
end
