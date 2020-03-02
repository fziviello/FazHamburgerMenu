Pod::Spec.new do |spec|

  spec.name         = 'FazHamburgerMenu'
  spec.version      = '1.0'
  spec.summary      = 'FazHamburgerMenu'
  spec.description  = 'Create HamburgerMenu'
  spec.homepage     = 'https://github.com/fziviello/FazHamburgerMenu'
  spec.license      = 'MIT'
  spec.author       = { 'fziviello' => 'f.ziviello@email.it' }
  spec.social_media_url   = 'https://www.linkedin.com/in/programmatore'
  spec.source       = { :git => 'https://github.com/fziviello/FazHamburgerMenu.git', :tag => '#{spec.version}' }
  spec.source_files  = 'FazHamburgerMenu/**/*.{swift, storyboard, xib, plist}'
  spec.framework  = 'SystemConfiguration'
  spec.requires_arc = true
  spec.ios.deployment_target = '12.1'
  spec.swift_version = '5.0'

end