#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_reach_five_ios'
  s.version          = '0.0.1'
  s.summary          = 'An iOS implementation of the flutter_reach_five plugin.'
  s.description      = <<-DESC
  An iOS implementation of the flutter_reach_five plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :type => 'BSD', :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }  
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.platform = :ios, '13.0'
  s.swift_version = '5.0'

  s.dependency 'Reach5', '~> 10.0'
  s.dependency 'Reach5Facebook', '~> 8.0'
  s.static_framework = true # Needed because Reach5Google isn't a framework but a static library
  s.dependency 'Reach5Google', '~> 8.0'
end
