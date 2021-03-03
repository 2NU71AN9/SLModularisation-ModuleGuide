platform :ios, '11.0'

target 'ModuleGuide' do
  use_frameworks!

  
#  pod 'ModuleComm', :path => '../ModuleComm'
#  pod 'SLJGSDK', :path => '../ModuleComm/SLJGSDK'
#  pod 'ModuleResource', :path => '../ModuleResource'
  
  pod 'ModuleComm', :git => 'https://github.com/2NU71AN9/SLModularisation-ModuleComm.git'
  
  pod 'ESTabBarController-swift'
  
  post_install do |installer|
    system 'sh mk_modulemap.sh Pods'
  end

end
