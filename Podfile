# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'AudioMap' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AudioMap
  pod 'AudioKit' 
  
  target 'AudioMapTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AudioMapUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = ‘4.2’
            config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
        end
    end
end
