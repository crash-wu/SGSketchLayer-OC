#
# Be sure to run `pod lib lint SGSketchLayer-OC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SGSketchLayer_OC'
  s.version          = '0.0.1'
  s.summary          = 'SGSketchLayer for Object-C.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "A layer that allows the user to interactively sketch geometries on the map .You can sketch point(点) ,FoldLine(折线),Curve(曲线),Surfaces(曲面),Polygon(多边形) geometries from scratch."

  s.homepage         = 'https://github.com/crash-wu/SGSketchLayer-OC'

  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '吴小星' => 'crash_wu@163.com' }
  s.source           = { :git => 'https://github.com/crash-wu/SGSketchLayer-OC.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'SGSketchLayer-OC/Classes/*.{h,m}'

  # s.resource_bundles = {
  #   'SGSketchLayer-OC' => ['SGSketchLayer-OC/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
    s.public_header_files = 'SGSketchLayer-OC/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'


    s.requires_arc = true

    s.xcconfig = {

    "FRAMEWORK_SEARCH_PATHS" => "$(HOME)/Library/SDKs/ArcGIS/iOS" ,
    "OTHER_LDFLAGS"  => '-lObjC -framework ArcGIS -l c++',

    'ENABLE_BITCODE' => 'NO',
    'CLANG_ENABLE_MODULES' => 'YES'

    }
end
