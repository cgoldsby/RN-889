Pod::Spec.new do |s|
    s.name             = 'MyMacOSLibrary'
    s.version          = '1.0.0'
    s.summary          = 'A simple MacOS-only library.'
    s.description      = 'This library is intended for macOS targets only.'
    s.homepage         = 'https://example.com/MyVisionOSLibrary'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Your Name' => 'you@example.com' }
    s.source           = { :git => 'https://example.com/MyMacOSLibrary.git', :tag => s.version.to_s }
  
    s.platform     = :osx, '1.0'
  
    s.source_files = 'Sources/**/*.{h,m,swift}'
  
  end
  