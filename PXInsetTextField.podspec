Pod::Spec.new do |s|
  s.name             = "PXInsetTextField"
  s.version          = "0.1.1"
  s.summary          = "A UITextField with insets."
  s.description      = <<-DESC
                       It has insets so the text doesn't go to the edge.'
                       DESC
  s.homepage         = "https://github.com/pixio/PXInsetTextField"
  s.license          = 'MIT'
  s.author           = { "Daniel Blakemore" => "DanBlakemore@gmail.com" }
  s.source = {
   :git => "https://github.com/pixio/PXInsetTextField.git",
   :tag => s.version.to_s
  }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
