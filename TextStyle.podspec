#
# Be sure to run `pod lib lint TextStyle.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name         = "TextStyle"
  s.version      = "1.0.1"
  s.summary      = "TextStyle provides easier management of dynamic font sizing in iOS."
  s.description  = <<-EOS
  TextStyle easier management of dynamic font sizing in iOS. Also adds RxSwift bindings for
  reactive changes.
  EOS
  s.homepage     = "https://github.com/ivanbruel/TextStyle"
  s.license      = { :type => "MIT", :file => "License" }
  s.author             = { "Ivan Bruel" => "ivan.bruel@gmail.com" }
  s.social_media_url   = "http://twitter.com/ivanbruel"
  s.ios.deployment_target = '9.0'
  s.source       = { :git => "https://github.com/ivanbruel/TextStyle.git", :tag => s.version }
  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files  = "TextStyle/Classes/*.swift"
    ss.framework  = "UIKit"
    ss.framework  = "Foundation"
  end

  s.subspec "RxSwift" do |ss|
    ss.source_files = "TextStyle/Classes/RxSwift/*.swift"
    ss.dependency "RxSwift", "~> 2.0"
    ss.dependency "RxCocoa", "~> 2.0"
    ss.dependency "TextStyle/Core"
  end

end
