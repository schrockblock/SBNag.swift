#
# Be sure to run `pod lib lint SBNag.swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SBNag.swift'
  s.version          = '0.0.5'
  s.summary          = 'A Swift library for nagging users to take an action.'
  s.swift_versions   = ['4.0', '4.2', '5.0', '5.1', '5.2', '5.3']

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is a simple swift pod to manage the logic behind nagging users to take actions like rating your app or upgrading to a paid version. To do so, simply create a new SBNagtion (think 'Nag Action'), and edit the defaults (Example/SBNag/ViewController.swift shows how you could do this).
                       DESC

  s.homepage         = 'https://github.com/schrockblock/SBNag.swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'schrockblock' => 'thryvinc@gmail.com' }
  s.source           = { :git => 'https://github.com/schrockblock/SBNag.swift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/schrockblock'

  s.ios.deployment_target = '11.0'

  s.source_files = 'SBNag.swift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SBNag.swift' => ['SBNag.swift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'SwiftDate'
end
