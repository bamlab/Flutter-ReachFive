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

  # cf. https://github.com/CocoaPods/CocoaPods/issues/10203
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}

  s.dependency 'IdentitySdkCore', '~> 6.1.0'
  s.dependency 'IdentitySdkFacebook', '~> 6.1.0'

  s.static_framework = true # Needed because IdentitySdkGoogle isn't a framework but a static library
  s.dependency 'IdentitySdkGoogle', '~> 6.1.0'
end
