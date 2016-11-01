# coding: utf-8

# recipe[letv::default]

path = "/my_computer/C/Program_Files/letv"
# file = 乐视 英雄本色 喋血双雄 监狱风云 刀马旦 头文字D 张靓颖纪录片, 功夫梦 保持通话

directory "#{path}" do
  # action :create
  owner "#{node[:user][:name]}"
  group "#{node[:user][:group]}"
  mode '0755'
end

file "#{path}/letv.webloc" do
  # action :create
  mode '0644'
  owner "#{node[:user][:name]}"
  group "#{node[:user][:group]}"
  content <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>URL</key>
  <string>http://live.le.com/lunbo</string>
</dict>
</plist>
  EOF
end

link "#{path}/Uninstall.exe" do
  # link_type :symbolic
  to '/Applications/Safari.app'
end

link "#{path}/letv.exe" do
  # link_type :symbolic
  to '/Applications/在线视频播放器/在线视频播放器.app'
  # http://bbs.feng.com/read-htm-tid-10428717.html#Mac版在线视频播放器，拒绝flash，清爽看直播，观大片
  only_if { ::File.exists?("/Applications/在线视频播放器/在线视频播放器.app") }
end

#

aContent = <<aEOF

aContent

#11
乐视电影台
http://live.le.com/lunbo/play/index.shtml?channel=230

#12
乐视电影2台
http://live.le.com/lunbo/play/index.shtml?channel=224
(保持通话)

#13
乐视电影3台 日韩院线
http://live.le.com/lunbo/play/index.shtml?channel=762

#14
乐视电影4台 深夜好莱坞
http://live.le.com/lunbo/play/index.shtml?channel=760

#15
乐视电影5台 凤凰卫视电影台
http://live.le.com/lunbo/play/index.shtml?channel=352

more
https://www.douban.com/doulist/44412233/

aEOF

file "#{path}/Readme.txt" do
  # action :create
  mode '0444'
  owner "#{node[:user][:name]}"
  group "#{node[:user][:group]}"
  content aContent
end
