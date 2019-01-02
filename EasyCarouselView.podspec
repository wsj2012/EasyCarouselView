Pod::Spec.new do |s|
s.name         = "EasyCarouselView"
s.version      = "1.0.0"
s.summary      = "OC版轮播广告、图片视图，带指示器视图。"
s.homepage     = "https://github.com/wsj2012/EasyCarouselView"
s.license      = "MIT"
s.author       = { "wsj_2012" => "time_now@yeah.net" }
s.source       = { :git => "https://github.com/wsj2012/EasyCarouselView.git", :tag => "#{s.version}" }
s.requires_arc = true
s.ios.deployment_target = "9.0"
s.source_files  = "Libs/*.{h,m}"
s.dependency 'SDWebImage'
s.dependency 'Masonry'
end
