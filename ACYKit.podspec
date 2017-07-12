Pod::Spec.new do |s|
  s.name             = 'ACYKit'
  s.version          = '0.25.1'
  s.summary          = 'A library to start a project quickly for iOS developers.'
  s.description      = <<-DESC
  A library to start a project quickly for iOS developers which is written by Objective-C.
  DESC

  s.homepage         = 'https://github.com/archmagees/ACYKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Arthur Liu' => 'archmagees+cocoapods@gmail.com' }
  s.source           = { :git => 'https://github.com/archmagees/ACYKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.subspec 'LogManager' do |log|
    log.source_files = 'ACYKit/Classes/LogManager/*'
    log.public_header_files = 'ACYKit/Classes/LogManager/*.h'
    log.dependency 'CocoaLumberjack'
  end
  

  s.subspec 'Foundation' do |foundation|
    foundation.source_files = 'ACYKit/Classes/Foundation/*'
    foundation.public_header_files = 'ACYKit/Classes/Foundation/*.h'  
  end

  s.subspec 'UIKit' do |ui|
    ui.source_files = 'ACYKit/Classes/UIKit/**/*'
    ui.public_header_files = 'ACYKit/Classes/UIKit/**/*.h'
    ui.dependency 'ACYKit/Foundation'
    ui.dependency 'ACYKit/LogManager'
    ui.dependency 'Masonry'
    ui.dependency 'SDWebImage'
    ui.dependency 'HexColors', "4.0.0"
  end

  s.subspec 'CategoryKit' do |category|
    category.source_files = 'ACYKit/Classes/CategoryKit/**/*'
    category.public_header_files = 'ACYKit/Classes/CategoryKit/**/*.h'
    category.dependency 'ACYKit/Foundation'
    category.dependency 'ACYKit/LogManager'
    category.dependency 'Aspects'
    category.frameworks = 'QuartzCore', 'CoreGraphics', 'AVFoundation', 'ImageIO'
  end
    
  s.frameworks = 'UIKit', 'Foundation'
end
