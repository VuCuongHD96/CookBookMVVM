# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# MARK: - Global Lib
def shareLib
  
  # API
  pod 'Alamofire', '~> 4.9.1'
  pod 'ObjectMapper'
  
  # View
  pod 'SkeletonView', '~> 1.4.1'
  pod "youtube-ios-player-helper"
  pod 'SDWebImage', '~> 5.8.1'
  pod 'SwiftLint'
  pod 'Toast-Swift', '~> 5.0.1'
  pod 'Reusable'
  pod 'Then'

  # Data Base
  pod 'RealmSwift', '~> 5.0.0'
  
end

# MARK: - Lib For Cook Book MVVM
def libForCookBookMVVM
  
end

target 'CookBookMVVM' do
  use_frameworks!
  
  shareLib
  libForCookBookMVVM
  
end

# MARK: - Lib For Cook Book Rx
def libForCookBookRx
  # Clean Architecture
  pod 'MGArchitecture'

  # Rx
  pod 'RxSwift', '~> 4.5.0'
  pod 'NSObject+Rx'
  pod 'RxDataSources'

  # UI
  pod 'SDWebImage', '~> 5.8.1'

end

target 'CookBookRx' do
  use_frameworks!

  shareLib
  libForCookBookRx

end
