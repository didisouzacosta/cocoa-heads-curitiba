platform :ios, '12.4'

target 'Domain' do
  use_frameworks!

  target 'DomainTests' do
    
  end

end

target 'GameQuickLookPreview' do
  use_frameworks!

  pod 'Kingfisher' # Images load and cache

end

target 'SpotlightAndShortcutItems' do
  use_frameworks!
  
  pod 'Kingfisher' # Images load and cache
  pod 'MSPeekCollectionViewDelegateImplementation' # Custom slider effects
  
  target 'SpotlightAndShortcutItemsTests' do
    inherit! :search_paths
  end

end
