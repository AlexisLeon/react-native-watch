require 'json'

Pod::Spec.new do |s|
  # NPM package specification
  package = JSON.parse(File.read(File.join(File.dirname(__FILE__), 'package.json')))

  s.name         = "RNWatch"
  s.version      = package['version']
  s.license      = "MIT"
  s.description  = "Connect your React Native App with WatchKit"
  s.author       = "author": "Alexis Leon <alexis.leon@icloud.com>"
  s.homepage     = "https://github.com/alexisleon/react-native-watch#readme"
  s.source       = {
    :git => "https://github.com/alexisleon/react-native-watch.git",
    :tag => "master"
  }

  s.platform     = :ios, "8.2"

  s.dependency "React"

  s.source_files = "RNWatch/**/*.{h,m}"
end
