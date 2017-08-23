#!usr/bin/ruby
Pod::Spec.new do |s|
  s.name             = 'ACYKit'
  s.version          = '1.0.1'
  s.summary          = 'A library to start a project quickly for iOS developers.'
  s.description      = <<-DESC
  A library to start a project quickly for iOS developers which is written by Objective-C.
  DESC

  s.homepage         = 'https://github.com/archmagees/ACYKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Arthur Liu' => 'archmagees.dev@gmail.com' }
  s.source           = { :git => 'https://github.com/archmagees/ACYKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.subspec 'Service' do |subspec|
    subspec.source_files = 'ACYKit/ACYKit/Service/**/*.{h,m}'
    subspec.dependency 'CocoaLumberjack'
    subspec.dependency 'ChameleonFramework'
  end
  

  s.subspec 'Core' do |subspec|
    subspec.source_files = 'ACYKit/ACYKit/Core/**/*.{h,m}'
    subspec.dependency 'ReactiveCocoa', '2.5'
  end

  s.subspec 'CategoryKit' do |subspec|
    subspec.source_files = 'ACYKit/ACYKit/CategoryKit/**/*.{h,m}'
    subspec.dependency 'ACYKit/Core'
    subspec.dependency 'ACYKit/Service'
    subspec.dependency 'Aspects'
    subspec.frameworks = 'QuartzCore', 'CoreGraphics', 'AVFoundation', 'ImageIO'
  end
    
  s.frameworks = 'UIKit', 'Foundation'
end
