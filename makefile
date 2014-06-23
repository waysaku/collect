build: pod
	xcodebuild \
		-workspace collect.xcworkspace \
		-scheme 'collect' \
		-configuration 'Debug' \
		-sdk iphonesimulator \
		clean build


pod:
	pod install


# build - AdHoc ビルドをおこなう
#build: add-certificates
#	xcodebuild \
#		-project $(PROJECT) \
#		-scheme $(SCHEME) \
#		-sdk $(SDK) \
#		-configuration $(CONFIGURATION) \
#		CODE_SIGN_IDENTITY=$(SIGN) CONFIGURATION_TEMP_DIR=$(CONFIGURATION_TEMP_DIR) CONFIGURATION_BUILD_DIR=$(CONFIGURATION_BUILD_DIR) \
#		clean build
# 
# add-certificates - KeyChain を作成する
#add-certificates: decrypt-certificates
#	security create-keychain -p travis ios-build.keychain
#	security import ./scripts/certs/apple.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
#	security import ./scripts/certs/dist.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
#	security import ./scripts/certs/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P $(ENCRYPTION_SECRET) -T /usr/bin/codesign
#	security default-keychain -s ~/Library/Keychains/ios-build.keychain
#	mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
#	cp ./scripts/profile/$(PROVISIONING_PROFILE) ~/Library/MobileDevice/Provisioning\ Profiles/
# 
# decrypt_certificates - 暗号化されたファイルを復号化する
#decrypt-certificates:
#	openssl aes-256-cbc -k "$(ENCRYPTION_SECRET)" -in scripts/profile/$(PROVISIONING_PROFILE).enc -d -a -out scripts/profile/$(PROVISIONING_PROFILE)
#	openssl aes-256-cbc -k "$(ENCRYPTION_SECRET)" -in scripts/certs/dist.p12.enc -d -a -out scripts/certs/dist.p12
#	openssl aes-256-cbc -k "$(ENCRYPTION_SECRET)" -in scripts/certs/dist.p12.enc -d -a -out scripts/certs/dist.p12

