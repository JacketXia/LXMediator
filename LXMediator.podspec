#
# Be sure to run `pod lib lint LXMediator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LXMediator'
  s.version          = '0.0.1'
  s.summary          = 'A Component Mediator With Person'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jacketxia/LXMediator'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jacketxia' => 'xiaxiaxiawb@163.com' }
  s.source           = { :git => 'https://github.com/JacketXia/LXMediator.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  # s.source_files = 'LXMediator/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LXMediator' => ['LXMediator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 
  
  #router库
  s.subspec 'Router' do |router|
    router.public_header_files = 'LXMediator/Classes/Router/**/*.h'
    router.source_files = 'LXMediator/Classes/Router/**/*'
    router.dependency 'CTMediator', '~> 46'
  end

  #service库
  s.subspec 'Service' do |service|
    service.public_header_files = 'LXMediator/Classes/Service/**/*.h'
    service.source_files = 'LXMediator/Classes/Service/**/*'
    service.dependency 'CTMediator', '~> 46'
  end

end
