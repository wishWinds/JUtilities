#
#  Be sure to run `pod spec lint JUtilities.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "JUtilities"
  s.version      = "1.1"
  s.summary      = "iOS Utilities"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
  iOS Utilities for Develepment.
                   DESC

  s.homepage     = "https://github.com/wishWinds/JUtilities.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "shupeng" => "john.hi.gm@gmail.com" }
  # Or just: s.author    = "shupeng"
  # s.authors            = { "shupeng" => "john.hi.gm@gmail.com" }
  # s.social_media_url   = "https://twitter.com/shupeng"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  s.platform     = :ios, "9.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "9.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/wishWinds/JUtilities.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "JUtilities/JUtilities.h"
  # s.exclude_files = "Classes/Exclude"

  s.public_header_files = "JUtilities/JUtilities.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

  s.subspec 'Runtime' do |ss|
    ss.source_files = 'JUtilities/Runtime/*.{h,m}'
    ss.public_header_files = 'JUtilities/Runtime/*.h'
  end

  s.subspec 'Foundation' do |ss|
    ss.source_files = 'JUtilities/Foundation/*.{h,m}'
    ss.public_header_files = 'JUtilities/Foundation/*.h'
  end

  s.subspec 'UIKit' do |ss|
    ss.source_files = 'JUtilities/UIKit/*.{h,m}'
    ss.public_header_files = 'JUtilities/UIKit/*.h'

    ss.dependency 'Masonry'
    ss.dependency 'QMUIKit'
    

    ss.subspec 'UIResponderRouter' do |sss|
      sss.source_files = 'JUtilities/UIKit/UIResponderRouter/*.{h,m}'
      sss.public_header_files = 'JUtilities/UIKit/UIResponderRouter/*.h'
    end
  end

  s.subspec 'UIViews' do |ss|
    ss.source_files = 'JUtilities/UIViews/*.{h,m}'
    ss.public_header_files = 'JUtilities/UIViews/*.h'

    ss.dependency 'JUtilities/Runtime'

    ss.subspec 'Menu' do |sss|
      sss.source_files = 'JUtilities/UIViews/Menu/*.{h,m}'
      sss.public_header_files = 'JUtilities/UIViews/Menu/*.h'
      sss.resources = ['JUtilities/UIViews/Menu/*.xib']
      
      sss.dependency 'Masonry'
      sss.dependency 'QMUIKit'
    end


    ss.subspec 'Banner' do |sss|
      sss.source_files = 'JUtilities/UIViews/Banner/*.{h,m}'
      sss.public_header_files = 'JUtilities/UIViews/Banner/*.h'
      sss.resources = ['JUtilities/UIViews/Banner/*.xib']
      
      sss.dependency 'JUtilities/Runtime'
      sss.dependency 'JUtilities/UIKit'
      sss.dependency 'Masonry'
      sss.dependency 'BlocksKit'
      sss.dependency 'SDWebImage'
      
    end
  end
end
