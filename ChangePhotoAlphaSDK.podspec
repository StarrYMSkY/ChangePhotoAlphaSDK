Pod::Spec.new do |s|
  # 项目名称,也就是pod使用这个库时候的名称
  s.name         = "ChangePhotoAlphaSDK" 
  # 版本,自己定一个版本迭代就行,如果要更新就把其版本号往上加
  s.version      = "1.0.0"
  # 主要标题
  s.summary      = "a objective-c project"
  # 详细描述（必须大于主要标题的长度）
  s.description  = <<-DESC
       一个可以从相册选取图片，并通过滑动屏幕改变其透明度的插件，双击屏幕可退出
                   DESC
  # 仓库主页,之前项目上传后获取的项目网址
  s.homepage     = "https://github.com/StarrYMSkY/ChangePhotoAlphaSDK"
  # MIT许可证,这个就这么填不用改
  s.license      = "MIT"
  # 作者信息,填写自己的信息
  s.author       = { "StarrYMSkY" => "1205822417@qq.com" }
  # 支持的ios版本
  s.platform     = :ios,'8.0'
  # 仓库地址,也是上传后获取的git地址,tag获取写法表示以版本号作为tag
  s.source       = { :git => "https://github.com/StarrYMSkY/ChangePhotoAlphaSDK.git",:tag => "#{s.version}"}
  # 自己编写的库在项目中的路径,这个要注意下,下面我会详细说明
  s.source_files = "ChangePhotoAlpha/*.{h,m}"
  # 调用的framework
  s.framework    = "UIKit","Foundation","Photos"
  # 使用arc
  s.requires_arc = true
end


