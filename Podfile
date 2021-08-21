# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shareLib
  pod 'SDWebImage', '~> 5.8.1'
  pod 'RealmSwift', '~> 5.0.0'
  pod 'Toast-Swift', '~> 5.0.1'
  pod 'SwiftLint'
  pod 'Reusable'
  pod 'Then'
  pod 'Alamofire', '~> 4.9.1'
  pod 'ObjectMapper'
  pod 'SkeletonView'
  pod "youtube-ios-player-helper"
end

# MARK: - Only Use For Cook Book MVVM
def onlyUseForCookBookMVVM
  
end

target 'CookBookMVVM' do
  use_frameworks!
  
  shareLib
  onlyUseForCookBookMVVM
  
end

# MARK: - Only Use For Cook Book Rx
def onlyUseForCookBookRx
  
end

target 'CookBookRx' do
  use_frameworks!

  shareLib
  onlyUseForCookBookRx

end
