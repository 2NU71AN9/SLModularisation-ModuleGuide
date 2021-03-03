Pod::Spec.new do |s|
  s.name             = 'ModuleGuide'
  s.version          = '0.0.1'
  s.summary          = 'Guide模块'
  s.description      = 'Guide模块, Guide模块'
  s.homepage         = 'https://github.com/2NU71AN9/SLModularisation-ModuleGuide'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '2UN7' => '1491859758@qq.com' }
  s.source           = { :git => 'https://github.com/2NU71AN9/SLModularisation-ModuleGuide.git' }
  s.ios.deployment_target = '11.0'
  s.source_files = 'ModuleGuide/Classes/**/*.{swift,h,m}'
  s.resource_bundles = {
    'ModuleGuide' => ['ModuleGuide/Classes/*.{storyboard,xib}']
  }

  s.dependency 'ModuleComm'
  s.dependency 'ESTabBarController-swift'
  
  s.pod_target_xcconfig = {
      'OTHER_LDFLAGS'          => '$(inherited) -undefined dynamic_lookup'
  }
  s.static_framework  =  true

end
