#
#  Be sure to run `pod spec lint WKBaseServicesSwift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "WKBaseServicesSwift"
  s.version      = "0.0.4"
  s.summary      = "WKBaseServicesSwift是一个swift的基础的扩展服务框架"
  s.description      = <<-DESC
                        WKBaseServicesSwift.是一个swift的基础的扩展服务框架。
                       DESC
  s.homepage     = "https://github.com/guoweikun621/WKBaseServicesSwift"
  s.license      = "MIT"
  s.author             = { "郭伟坤" => "guoweikun621@gmail.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/guoweikun621/WKBaseServicesSwift.git", :tag => s.version }
  s.source_files  = "WKBaseServicesSwift/Sources/**/*.swift"

  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
  # s.pod_target_xcconfig = { 'SWIFT_VERSION' => '2.3' }
  
end
