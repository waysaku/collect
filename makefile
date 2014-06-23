#build: pod
#	xcodebuild \
#		-workspace collect.xcworkspace \
#		-scheme 'collect' \
#		-configuration 'Debug' \
#		-sdk iphonesimulator \
#		clean build
#


# build - AdHoc ビルドをおこなう
build: pod
	xcodebuild \
		-workspace collect.xcworkspace \
		-scheme 'collect' \
		-sdk iphoneos \
		-configuration 'Debug' \
		#CODE_SIGN_IDENTITY=$(SIGN) CONFIGURATION_TEMP_DIR=$(CONFIGURATION_TEMP_DIR) CONFIGURATION_BUILD_DIR=$(CONFIGURATION_BUILD_DIR) 
		clean build
 
pod: add-certificates
	pod install


# add-certificates - KeyChain を作成する
add-certificates: decrypt-certificates
	security create-keychain -p travis ios-build.keychain
	security import ./scripts/certs/AppleWWDRCA.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
	security import ./scripts/certs/dist.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
	security import ./scripts/certs/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P $(ENCRYPTION_SECRET) -T /usr/bin/codesign
	security default-keychain -s ~/Library/Keychains/ios-build.keychain
	mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
	cp ./scripts/profile/collect_adhoc.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/



# decrypt_certificates - 暗号化されたファイルを復号化する
decrypt-certificates:
	openssl aes-256-cbc -k "$(ENCRYPTION_SECRET)" -in scripts/profile/collect_adhoc.mobileprovision.enc -d -a -out scripts/profile/collect_adhoc.mobileprovision
	openssl aes-256-cbc -k "$(ENCRYPTION_SECRET)" -in scripts/certs/dist.cer.enc -d -a -out scripts/certs/dist.cer
	openssl aes-256-cbc -k "$(ENCRYPTION_SECRET)"  -in scripts/certs/dist.p12.enc -d -a -out scripts/certs/dist.p12




