require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
    s.name         = "RNWeekFoxApp"
    s.version      = package['version'].gsub(/v|-beta/, '')
    s.summary      = package['description']
    s.description  = package['description']
    s.homepage     = package['homepage']
    s.license      = package['license']
    s.author       = package['author']
    s.platform     = :ios, "11.0"
    s.source       = { :git => "https://github.com/weekfox/react-native-weekfox-app.git", :tag => "master" }
    s.source_files = "ios/*.{h,m}"
    s.requires_arc = true
  
    s.resources = ['fonts/*.ttf']
    s.dependency "React"
  
  end