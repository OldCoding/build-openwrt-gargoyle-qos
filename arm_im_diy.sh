#!/bin/bash
svn_export() {
	# 参数1是分支名, 参数2是子目录, 参数3是目标目录, 参数4仓库地址
 	echo -e "clone $4/$2 to $3"
	TMP_DIR="$(mktemp -d)" || exit 1
 	ORI_DIR="$PWD"
	[ -d "$3" ] || mkdir -p "$3"
	TGT_DIR="$(cd "$3"; pwd)"
	git clone --depth 1 -b "$1" "$4" "$TMP_DIR" >/dev/null 2>&1 && \
	cd "$TMP_DIR/$2" && rm -rf .git >/dev/null 2>&1 && \
	cp -af . "$TGT_DIR/" && cd "$ORI_DIR"
	rm -rf "$TMP_DIR"
}

rm -rf ./feeds/luci/applications/luci-app-passwall
rm -rf ./feeds/luci/applications/luci-app-openclash
rm -rf ./feeds/luci/applications/luci-app-smartdns
rm -rf ./feeds/luci/applications/luci-app-dockerman
rm -rf ./feeds/luci/applications/luci-app-vsftpd
rm -rf ./feeds/luci/applications/luci-app-minidlna
rm -rf ./feeds/luci/applications/luci-app-watchcat
rm -rf ./feeds/luci/applications/luci-app-ssr-plus
rm -rf ./feeds/packages/net/smartdns
rm -rf ./feeds/packages/multimedia/minidlna
rm -rf ./feeds/packages/net/vsftpd
rm -rf ./feeds/packages/net/dns2tcp
rm -rf ./feeds/packages/net/hysteria
rm -rf ./feeds/packages/net/ipt2socks
rm -rf ./feeds/packages/lang/lua-neturl
rm -rf ./feeds/packages/net/microsocks
rm -rf ./feeds/packages/net/mosdns
rm -rf ./feeds/packages/net/naiveproxy
rm -rf ./feeds/packages/net/redsocks2
rm -rf ./feeds/packages/net/shadowsocks-rust
rm -rf ./feeds/packages/net/shadowsocksr-libev
rm -rf ./feeds/packages/net/simple-obfs
rm -rf ./feeds/packages/net/tcping
rm -rf ./feeds/packages/net/trojan-go
rm -rf ./feeds/packages/net/trojan
rm -rf ./feeds/packages/net/trojan-plus
rm -rf ./feeds/packages/net/v2ray-core
rm -rf ./feeds/packages/net/v2ray-plugin
rm -rf ./feeds/packages/net/v2raya
rm -rf ./feeds/packages/net/xray-core
rm -rf ./feeds/packages/net/xray-plugin
rm -rf ./feeds/packages/net/pdnsd-alt
rm -rf ./feeds/packages/net/trojan-go
rm -rf ./feeds/packages/net/trojan-plus
rm -rf ./feeds/packages/net/v2ray-geodata
rm -rf ./feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang

git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot
git clone --depth 1 https://github.com/sbwml/luci-app-xunlei  package/luci-app-xunlei
git clone --depth 1 https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
git clone --depth 1 https://github.com/chenmozhijin/luci-app-adguardhome package/luci-app-adguardhome
git clone --depth 1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
git clone --depth 1 https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone -b openwrt-2102 https://github.com/ilxp/gargoyle-qos-openwrt.git package/gargoyle-qos-openwrt
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall-packages
svn_export "master" "applications/luci-app-dockerman" "package/luci-app-dockerman" "https://github.com/lisaac/luci-app-dockerman"
svn_export "main" "luci-app-passwall2" "package/luci-app-passwall2" "https://github.com/xiaorouji/openwrt-passwall2"
svn_export "main" "luci-app-passwall" "package/luci-app-passwall" "https://github.com/xiaorouji/openwrt-passwall"
svn_export "main" "luci-app-amlogic" "package/luci-app-amlogic" "https://github.com/ophub/luci-app-amlogic"
svn_export "dev" "luci-app-openclash" "package/luci-app-openclash" "https://github.com/vernesong/OpenClash"
svn_export "master" "applications/luci-app-vsftpd" "feeds/luci/applications/luci-app-vsftpd" "https://github.com/immortalwrt/luci"
svn_export "master" "applications/luci-app-minidlna" "feeds/luci/applications/luci-app-minidlna" "https://github.com/immortalwrt/luci"
svn_export "master" "applications/luci-app-watchcat" "feeds/luci/applications/luci-app-watchcat" "https://github.com/immortalwrt/luci"
svn_export "master" "net/vsftpd" "feeds/packages/net/vsftpd" "https://github.com/immortalwrt/packages"
svn_export "master" "multimedia/minidlna" "feeds/packages/multimedia/minidlna" "https://github.com/immortalwrt/packages"
svn_export "master" "utils/watchcat" "feeds/packages/utils/watchcat" "https://github.com/immortalwrt/packages"
svn_export "master" "lang/rust" "feeds/packages/lang/rust" "https://github.com/immortalwrt/packages
svn_export "v5" "luci-app-mosdns" "package/luci-app-mosdns" "https://github.com/sbwml/luci-app-mosdns"
svn_export "v5" "mosdns" "package/mosdns" "https://github.com/sbwml/luci-app-mosdns"
svn_export "v5" "v2dat" "package/v2dat" "https://github.com/sbwml/luci-app-mosdns"
svn_export "master" "luci-app-netspeedtest" "package/luci-app-netspeedtest" "https://github.com/sirpdboy/netspeedtest"
svn_export "master" "homebox" "package/homebox" "https://github.com/sirpdboy/netspeedtest"

# 调整菜单位置
sed -i "s|services|nas|g" feeds/luci/applications/luci-app-filebrowser/root/usr/share/luci/menu.d/luci-app-filebrowser.json
sed -i "s|services|nas|g" feeds/luci/applications/luci-app-transmission/root/usr/share/luci/menu.d/luci-app-transmission.json
sed -i "s|services|nas|g" feeds/luci/applications/luci-app-alist/root/usr/share/luci/menu.d/luci-app-alist.json
sed -i "s|services|nas|g" feeds/luci/applications/luci-app-qbittorrent/root/usr/share/luci/menu.d/luci-app-qbittorrent.json
sed -i "s|services|vpn|g" feeds/luci/applications/luci-app-squid/root/usr/share/luci/menu.d/luci-app-squid.json
sed -i "s|services|vpn|g" feeds/luci/applications/luci-app-pppoe-server/luasrc/controller/pppoe-server.lua
# 微信推送&全能推送
sed -i "s|qidian|bilibili|g" package/luci-app-pushbot/root/usr/bin/pushbot/pushbot
sed -i "s|qidian|bilibili|g" feeds/luci/applications/luci-app-wechatpush/root/usr/share/wechatpush/wechatpush
# 石像鬼755权限
chmod 755 package/gargoyle-qos-openwrtqos-gargoyle/files/*
# DNS劫持
sed -i '/dns_redirect/d' package/network/services/dnsmasq/files/dhcp.conf
cd package
# 个性化设置
sed -i "s|amlogic_firmware_repo.*|amlogic_firmware_repo 'https://github.com/OldCoding/openwrt_packit_arm'|g" luci-app-amlogic/root/etc/config/amlogic
sed -i "s|ARMv8|ARMv8-im|g" luci-app-amlogic/root/etc/config/amlogic
rm -rf luci-app-netspeedtest/po/zh_Hans
# 汉化
curl -sfL -o ./convert_translation.sh https://github.com/kenzok8/small-package/raw/main/.github/diy/convert_translation.sh
chmod +x ./convert_translation.sh && bash ./convert_translation.sh
# OpenClash
cd ./luci-app-openclash/root/etc/openclash
CORE_VER=https://github.com/vernesong/OpenClash/raw/core/dev/core_version
CORE_TUN=https://github.com/vernesong/OpenClash/raw/core/dev/premium/clash-linux-arm64
CORE_DEV=https://github.com/vernesong/OpenClash/raw/core/dev/dev/clash-linux-arm64.tar.gz
CORE_MATE=https://github.com/vernesong/OpenClash/raw/core/dev/meta/clash-linux-arm64.tar.gz
TUN_VER=$(curl -sfL $CORE_VER | sed -n "2{s/\r$//;p;q}")
curl -sfL -o ./Country.mmdb https://github.com/alecthw/mmdb_china_ip_list/raw/release/Country.mmdb
curl -sfL -o ./GeoSite.dat https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat
curl -sfL -o ./GeoIP.dat https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat
mkdir ./core && cd ./core
curl -sfL -o ./tun.gz "$CORE_TUN"-"$TUN_VER".gz && gzip -d ./tun.gz && mv ./tun ./clash_tun
curl -sfL -o ./meta.tar.gz "$CORE_MATE" && tar -zxf ./meta.tar.gz && mv ./clash ./clash_meta
curl -sfL -o ./dev.tar.gz "$CORE_DEV" && tar -zxf ./dev.tar.gz
chmod +x ./clash* ; rm -rf ./*.gz
