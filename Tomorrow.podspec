Pod::Spec.new do |s|
  s.name                      = "Tomorrow"
  s.version                   = "1.0.4"
  s.summary                   = "Tomorrow"
  s.homepage                  = "https://github.com/lukszar/Tomorrow"
  s.license                   = { :type => "MIT", :file => "LICENSE" }
  s.author                    = { "Łukasz Szarkowicz" => "szarkowicz@gmail.com" }
  s.source                    = { :git => "https://github.com/lukszar/Tomorrow.git", :tag => s.version.to_s }
  s.swift_version             = "5.1"
  s.ios.deployment_target     = "8.0"
  s.tvos.deployment_target    = "9.0"
  s.watchos.deployment_target = "2.0"
  s.osx.deployment_target     = "10.10"
  s.source_files              = "Sources/**/*"
  s.frameworks                = "Foundation"
end
