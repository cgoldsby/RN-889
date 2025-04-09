Pod::Spec.new do |s|
    s.name             = 'MyTvOSLibrary'
    s.version          = '1.0.0'
    s.summary          = 'A simple TvOS-only library.'
    s.description      = 'This library is intended for tvOS targets only.'
    s.homepage         = 'https://example.com/MyVisionOSLibrary'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Your Name' => 'you@example.com' }
    s.source           = { :git => 'https://example.com/MyTvOSLibrary.git', :tag => s.version.to_s }
  
    s.platform     = :tvos, '1.0'
  
    s.source_files = 'Sources/**/*.{h,m,swift}'
  
  end
  