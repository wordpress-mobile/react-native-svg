require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name             = 'RNSVG'
  s.version          = package['version']
  s.summary          = package['description']
  s.license          = package['license']
  s.homepage         = 'https://github.com/react-native-community/react-native-svg'
  s.authors          = 'Horcrux Chen'
  s.source           = { :git => 'https://github.com/react-native-community/react-native-svg.git', :tag => s.version }
  s.source_files     = 'ios/**/*.{h,m}'
  s.requires_arc     = true
  s.platforms        = { :ios => "8.0", :tvos => "9.2" }
  s.dependency         'React-Core'
  s.dependency         'React-RCTImage'

  # This updates the outdated <React/RCTImageLoader.h> import to use the RCTImage namespace
  # It can be removed once https://github.com/facebook/react-native/issues/25349 is fixed
  s.prepare_command  = 'sed -i "" "s/React\/RCTImageLoader.h/RCTImage\/RCTImageLoader.h/g" ios/Elements/RNSVGImage.m'
end
