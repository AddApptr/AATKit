// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AATKit",
    platforms: [.iOS(.v13)],
    products: [

        .library(name: "AATKit-Core", targets: ["AATKit-Core"]),
        .library(name: "AATKit-AATAdMobMediationAdapter", targets: ["AATKit-AATAdMobMediationAdapter"]),
        .library(name: "AATKit-AATAdMobDSPAdapter", targets: ["AATKit-AATAdMobDSPAdapter"]),
        .library(name: "AATKit-GooglePartnerBidding", targets: ["AATKit-GooglePartnerBidding"]),

        // Dependencies
        .library(name: "AATKit-GoogleMobileAds", targets: ["AATKit-GoogleMobileAds"]),
        .library(name: "AATKit-AppLovin", targets: ["AATKit-AppLovin"]),
        .library(name: "AATKit-AppNexus", targets: ["AATKit-AppNexus"]),
        .library(name: "AATKit-AppHarbr", targets: ["AATKit-AppHarbr"]),
        .library(name: "AATKit-Amazon", targets: ["AATKit-Amazon"]),
        .library(name: "AATKit-FeedAd", targets: ["AATKit-FeedAd"]),
        .library(name: "AATKit-GraviteRTB", targets: ["AATKit-GraviteRTB"]),
        .library(name: "AATKit-SmartAd", targets: ["AATKit-SmartAd"]),
        .library(name: "AATKit-Moloco", targets: ["AATKit-Moloco"]),
        .library(name: "AATKit-YOC", targets: ["AATKit-YOC"]),
        .library(name: "AATKit-InMobi", targets: ["AATKit-InMobi"]),
        .library(name: "AATKit-IronSource", targets: ["AATKit-IronSource"]),
        .library(name: "AATKit-Kidoz", targets: ["AATKit-Kidoz"]),
        .library(name: "AATKit-PubNative", targets: ["AATKit-PubNative"]),
        .library(name: "AATKit-Prebid", targets: ["AATKit-Prebid"]),
        .library(name: "AATKit-Tappx", targets: ["AATKit-Tappx"]),
        .library(name: "AATKit-Teads", targets: ["AATKit-Teads"]),
        .library(name: "AATKit-Unity", targets: ["AATKit-Unity"]),
        .library(name: "AATKit-Vungle", targets: ["AATKit-Vungle"]),
        .library(name: "AATKit-OguryAds", targets: ["AATKit-OgurySdk"]),
        .library(name: "AATKit-Mintegral", targets: ["AATKit-Mintegral"]),
        .library(name: "AATKit-Facebook", targets: ["AATKit-Facebook"]),
        .library(name: "AATKit-DisplayIO", targets: ["AATKit-DisplayIO"]),
        .library(name: "AATKit-UTIQ", targets: ["AATKit-UTIQ"]),
        .library(name: "AATAppNexusAdapter", targets: ["AATAppNexusAdapter"]),
        .library(name: "AATAmazonAdapter", targets: ["AATAmazonAdapter"]),
        .library(name: "AATKit-AATMetaBiddingAdapter", targets: ["AATKit-AATMetaBiddingAdapter"]),

        // CMPs
        .library(name: "AATKit-GoogleCMP", targets: ["AATKit-GoogleCMP"]),
        .library(name: "AATKit-SourcePointCMP", targets: ["AATKit-SourcePointCMP"]),
        .library(name: "AATKit-AppConsentCMP", targets: ["AATKit-AppConsentCMP"]),

        // Default Dependencies
        .library(name: "AATKit-Default", targets: ["AATKit-GoogleMobileAds",
                                                   "AATKit-AppLovin",
                                                   "AATKit-GraviteRTB",
                                                   "AATKit-SmartAd",
                                                   "AATKit-YOC",
                                                   "AATKit-InMobi",
                                                   "AATKit-IronSource",
                                                   "AATKit-OgurySdk",
                                                   "AATKit-PubNative",
                                                   "AATKit-Unity",
                                                   "AATKit-Vungle",
                                                   "AATKit-Mintegral",
                                                   "AATKit-GooglePartnerBidding",
                                                   "AATKit-Tappx",
                                                   "AATKit-Facebook",
                                                   "AATKit-AppNexus",
                                                   "AATKit-Prebid",
                                                   "AATKit-AATMetaBiddingAdapter",
                                                   "AATKit-Moloco"
                                                  ]),

    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", .upToNextMinor(from: "13.4.0")),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .upToNextMinor(from: "12.13.0")),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", .upToNextMinor(from: "1.27.0")),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(url: "https://github.com/AddApptr/RTBSDK.git", .upToNextMinor(from: "1.9.1"))
        //        .package(name: "TeadsSDK", url: "https://github.com/teads/TeadsSDK-iOS", .exact("5.1.3")), Conflict in AppLovin dependency
    ],
    // Mark: Targets
    targets: [
        // AATKit target
        .target(name:"AATKit-Core",
                dependencies: ["AATKit"],
                path: "./Sources/AATKit"),

        // AATAdMobMediationAdapter target
        .target(name:"AATKit-AATAdMobMediationAdapter",
                dependencies: ["AATKit-GoogleMobileAds", "AATKit"],
                path: "./Sources/AATAdMobMediationAdapter"),

        // AATAdMobDSPAdapter
        .target(name:"AATKit-AATAdMobDSPAdapter",
                dependencies: [ "AATKit-GoogleMobileAds", "AATKit", "AATKit-GraviteRTB", "AATAdMobDSPAdapter"],
                path: "./Sources/AATAdMobDSPAdapter"),

        // GooglePartnerBidding
        .target(name:"AATKit-GooglePartnerBidding",
                dependencies: [
                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                    "AATKit",
                    "AATKit-GraviteRTB",
                    "AATAdMobDSPAdapter"
                ],
                path: "./Sources/GooglePartnerBiddingSources"),

        // MARK - Dependencies Targets
        .target(name: "AATKit-GoogleMobileAds",
                dependencies: [
                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                    "AATGoogleAdsAdapter",
                ],
                path: "./Sources/GoogleMobileAdsSources"),

            .target(name: "AATKit-AppLovin",
                    dependencies: [
                        .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                        "AATAppLovinAdapter"
                    ],
                    path: "./Sources/AppLovinSources"),

            .target(name:"AATKit-AppHarbr",
                    dependencies: [
                        .product(name: "AppHarbrSDK", package: "AppHarbrSDK"),
                        "AATAppHarbrAdapter"
                    ],
                    path: "./Sources/AppHarbr"),

            .target(name:"AATKit-AppNexus",
                    dependencies: ["AATAppNexusSDK", "AATAppNexusAdapter"],
                    path: "./Sources/AppNexusSources"),

            .target(name:"AATKit-Amazon",
                    dependencies: ["AATDTBiOSSDK", "AATAmazonAdapter"],
                    path: "./Sources/AmazonSources"),

            .target(name:"AATKit-FeedAd",
                    dependencies: ["AATFeedAd", "AATFeedAdAdapter"],
                    path: "./Sources/FeedAdSources"),

            .target(name:"AATKit-GraviteRTB",
                    dependencies: [
                        .product(name: "RTBSDK", package: "RTBSDK"),
                        "AATGraviteRTBAdapter"
                    ],
                    path: "./Sources/GraviteRTB"),

            .target(name:"AATKit-OgurySdk",
                    dependencies: ["AATOgurySdk", "AATOguryAds", "AATOguryCore", "AATOMSDK_Ogury", "AATOguryAdapter"],
                    path: "./Sources/OguryAdsSources"),

            .target(name:"AATKit-GoogleCMP",
                    dependencies: [
                        .product(name: "GoogleUserMessagingPlatform", package: "swift-package-manager-google-user-messaging-platform"),
                        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                        "AATGoogleCMPAdapter"
                    ],
                    path: "./Sources/GoogleCMPSources"),


            .target(name:"AATKit-Facebook",
                    dependencies: [
                        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                        "AATFacebookAdapter",
                        "AATFBAudienceNetwork",
                        "AATMetaBiddingAdapter"
                    ],
                    path: "./Sources/FacebookSources"),
        // AATMetaBiddingAdapter
        .target(name: "AATKit-AATMetaBiddingAdapter",
                dependencies: [
                    "AATKit",
                    "AATKit-GraviteRTB",
                    "AATKit-Facebook",
                    "AATMetaBiddingAdapter"
                ], path: "./Sources/MetaBidingSources"),

            .target(name:"AATKit-Moloco",
                    dependencies: ["AATMolocoBiddingDSPAdapter", "AATMolocoSDK", "AATKit", "AATKit-GraviteRTB",],
                    path: "./Sources/MolocoSources"),

            .target(name:"AATKit-SmartAd",
                    dependencies: ["AATSASDisplayKit", "AATSmartAdAdapter"],
                    path: "./Sources/SmartAdSources"),

            .target(name:"AATKit-Tappx",
                    dependencies: ["AATTappxFramework", "AATOMSDK_Tappx", "AATTappxAdapter"],
                    path: "./Sources/Tappx"),

            .target(name:"AATKit-Teads",
                    dependencies: ["AATTeadsSDK", "AATOMSDK_Teadstv", "AATTeadsAdapter"],
                    path: "./Sources/TeadsSources"),

            .target(name:"AATKit-YOC",
                    dependencies: ["AATVisxSDK", "AATYOCAdapter"],
                    path: "./Sources/YOCSources"),

            .target(name:"AATKit-InMobi",
                    dependencies: ["AATInMobiSDK", "AATInMobiAdapter"],
                    path: "./Sources/InMobiSources"),

            .target(name:"AATKit-IronSource",
                    dependencies: ["AATIronSource", "AATIronSourceAdapter"],
                    path: "./Sources/IronSourceSources"),

            .target(name:"AATKit-Kidoz",
                    dependencies: ["AATKidozSDK", "AATKidozAdapter"],
                    path: "./Sources/KidozSources"),

            .target(name:"AATKit-PubNative",
                    dependencies: ["AATHyBid", "AATOMSDK_Pubnativenet", "AATATOM", "AATPubNativeAdapter"],
                    path: "./Sources/PubnativeSources"),

            .target(name:"AATKit-Prebid",
                    dependencies: ["AATPrebidMobile", "AATDFPPrebidAdapter", "AATOMSDK_Prebidorg"],
                    path: "./Sources/PrebidSources"),

            .target(name:"AATKit-Unity",
                    dependencies: ["AATUnityAds", "AATUnityAdapter"],
                    path: "./Sources/UnitySources"),

            .target(name:"AATKit-Vungle",
                    dependencies: ["AATVungleAdsSDK", "AATVungleAdapter"],
                    path: "./Sources/VungleSources"),

            .target(name:"AATKit-Mintegral",
                    dependencies: [
                        "AATMTGSDK",
                        "AATMTGSDKNativeAdvanced",
                        "AATMTGSDKBanner",
                        "AATMTGSDKNewInterstitial",
                        "AATMTGSDKBidding",
                        "AATMTGSDKReward",
                        "AATMTGSDKSplash",
                        "AATMTGSDKInterstitialVideo",
                        "AATMintegralAdapter"
                    ],
                    path: "./Sources/MintegralSources"),

            .target(name:"AATKit-SourcePointCMP",
                    dependencies: ["AATConsentViewController", "AATSourcePointCMPAdapter"],
                    path: "./Sources/SourcePointSources"),

            .target(name:"AATKit-AppConsentCMP",
                    dependencies: ["AATAppConsent", "AATAppConsentAdapter"],
                    path: "./Sources/AppConsentCMP"),

            .target(name:"AATKit-DisplayIO",
                    dependencies: ["AATDIOSDK", "AATDisplayIOAdapter"],
                    path: "./Sources/DisplayIOSources"),

            .target(name:"AATKit-UTIQ",
                    dependencies: ["AATUtiq", "AATUTIQAdapter"],
                    path: "./Sources/UTIQSources"),

        // Mark: Binary Targets
        .binaryTarget(
            name: "AATAmazonAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATAmazonAdapter.zip",
            checksum: "2bf97f87157d851735e2e1143dfaae974873f693f6a5bbffbdc5c5e693864f18"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATUnityAdapter.zip",
            checksum: "af4df0f903107639e05ac022345d5c729af5eff69a7efe96856322297d5e646d"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATAppNexusAdapter.zip",
            checksum: "0133f7640fd9d78f30ea089d1eda2d3af5716f8792460068c723abda2376d868"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATSmartAdAdapter.zip",
            checksum: "6af7de0d003e48bc951c7aebbe60ac5bba08b5d2e136ddda99f24800a83c5b17"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATIronSourceAdapter.zip",
            checksum: "db8371b6cc9acb9b19fdbe7d3f8c8a1618452f7cf46ea8b51d90e73eed55dc5a"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATDFPPrebidAdapter.zip",
            checksum: "18a51d96d44073ab3491754e81e025e43c9d1eb94dd6b8d7a3eab243e40e0c82"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATGraviteRTBAdapter.zip",
            checksum: "37c0bd4879a5c8bcd222db85c4c57c6f6094bbec572a8551bcd450a76e3b9407"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/DIOSDK.zip",
            checksum: "94227ac202aed82fabd668dc39fb2720be950c690fc67b6cf4d63502e078b0b5"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/HyBid.zip",
            checksum: "8d82c2104d3959bb58b1f13d7278a8b949a997b11c0286399fc8a921879d2b07"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/OMSDK_Pubnativenet.zip",
            checksum: "ce5f667fcf6c7ed35f064dace50d31de72491705be1332475dc9c109dee65a3c"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/ATOM.zip",
            checksum: "2230b249f326b8d79f5733b599fa098a87d538413e09420a9c2e8e5efb80e96e"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/Utiq.zip",
            checksum: "c48f446c42994befb4bdb266806ee76e607dcb178f7816a24e9c1e66463bd59e"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/ConsentViewController.zip",
            checksum: "02f40c89de32e9d02e9699dbef32529772c4293592dc93675fb854a1d25f8fe4"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/VisxSDK.zip",
            checksum: "2a6aa814c9f2665bb06c7f113df27b7c4adb9d7a2c28710b2319d693b360e71b"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/OMSDK_Prebidorg.zip",
            checksum: "ae075289001187b88cb0af649a063cb704b19f5e02200dffb0b776204fcb83b4"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/PrebidMobile.zip",
            checksum: "f74ad53f1fff5d6c8d5f0493987226d1f15c49e7d8531e6bb38f0534abc818ef"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATSourcePointCMPAdapter.zip",
            checksum: "424b7e395106ee19d847e92547d456d42bf744f70c6970195475ad78afbc0d15"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATAdMobDSPAdapter.zip",
            checksum: "ba2c6036002bd27fb453d4801cf7e9b763180693fe50f015c42928b3aa0bbc7c"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATSuperAwesomeAdapter.zip",
            checksum: "919d367672bab689cd8c86c7ec28589de9159c6f57e1166dca094a56cb3ff6f2"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATGoogleAdsAdapter.zip",
            checksum: "01584e0fe95d4639434fc8b8b6cdea504a041534ac46f39185ac6cdf49505ebc"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATDisplayIOAdapter.zip",
            checksum: "4765c4b97e4f95030175f5b4e3f89b7db3db56aced5a3e2c95e981dc0581ebf5"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATPubNativeAdapter.zip",
            checksum: "d5b28d2fcd69560efa42bd38a915a751e4d2d4f33f57e44411749e8eeacda43e"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATMetaBiddingAdapter.zip",
            checksum: "e5a4b6957b310b2e283d94506392d033ac9004b62cb940b0685140b2508f9262"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATVungleAdapter.zip",
            checksum: "476811b8cd2860518558bbc7cd794e01cca60c95364ddc5a89eb6d1296fd5ba0"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATFacebookAdapter.zip",
            checksum: "4a47e1c718479faee0995ee14e63aea7c3ba3275084a729ff776e583727aacaf"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATFeedAdAdapter.zip",
            checksum: "415d18b3cbcffa60255376e5088b05af08eb7406f1a02dff141ddededfb589cb"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATMintegralAdapter.zip",
            checksum: "50b80abd9a77ea239b4cb618dc5cf81cb58304af951db8d1c9b9068986d9178f"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATKidozAdapter.zip",
            checksum: "9471ebc397f95beea64ed0363f40fa0800f84faba1be5cb499d774d07c724d56"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATGoogleCMPAdapter.zip",
            checksum: "7ca617fff671c2d98ac94446b980cfe8a96ba4087465a2abcfa3fa1be2c57c13"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATAppConsentAdapter.zip",
            checksum: "574bb99153f5002e51eb674045c3ec843a450ab99b32af225c364fe34ab734e9"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATMolocoBiddingDSPAdapter.zip",
            checksum: "691dadf45f25230203abb7c5c2f3e34108ab976ab1750312e060b7cbe9bfa13d"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATAdMobMediationAdapter.zip",
            checksum: "3089c29a1e92750fe443bafba1c16fc053dd4f608a68274d0c14e5a6e9fc8090"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATInMobiAdapter.zip",
            checksum: "74fbd2974b2e298ed26b74904700039275a8eb7c658100a39d1f683221e6b232"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATOguryAdapter.zip",
            checksum: "a5e73f5c2def92bfd48779ff79aff2c1961e78633aea33d9c2c3e66e94776bd1"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATUTIQAdapter.zip",
            checksum: "4eaa93a5ee353a56be478c3c64cbcc204171d1373c64bc4df3059e270a084bb1"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATYOCAdapter.zip",
            checksum: "cd266eb0e721c2883482c32449d099e68d6c04ceaf48e3c2f8fc92c4e01085f4"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATKit.zip",
            checksum: "e2f331c04006879b8acf261618f0d865ff62c49df47fbee44314e000b75f2e67"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATTappxAdapter.zip",
            checksum: "5e58eaac3e374f0a125c9e845f54782cb765d90dec7a8c83dcf821f20691fc66"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATAppLovinAdapter.zip",
            checksum: "5d1fa089130bc086dbb789697810c670fa8b73d48fdb99f6a4271dc59dc853cf"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATAppHarbrAdapter.zip",
            checksum: "ecfefde745889e12a81149650184f5af83f1400e94472da0a3d845a2ac850e7b"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AATTeadsAdapter.zip",
            checksum: "305136c464e57548cd6833b7c1432295740086b00b8a94a8103323bd735f1ed0"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AppConsent.zip",
            checksum: "64eb6d5cfc9648cd5c0a4e0231d14f29532ccb4a715c229b50f45171e95cc367"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/UnityAds.zip",
            checksum: "60bc7191ac0d229beb957dc96af4368a518969197575c51dcacc19ae7423dc10"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/OguryCore.zip",
            checksum: "9ef023cce1788ece041fed340961fa37564c6593f47485e674a10bb17310d360"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/OMSDK_Ogury.zip",
            checksum: "2b207ee9985525c96684c4752c3445ab1b795432991bbcb2221aed4eb370b676"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/OguryAds.zip",
            checksum: "7f1d3c7ba5dad122436d02a0665e4d6bfe5305790485da2cfa347b892241f122"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/InMobiSDK.zip",
            checksum: "44f8316dec12d25e1d93f2b1994617f0435d6cb8ce14c9d61dc1aa13ce4f67c2"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/TeadsSDK.zip",
            checksum: "fbfc85f173c90aff07d8fddcb40834f7c98f4cf4d7d7c49d02053dd4bfa50c20"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/OMSDK_Teadstv.zip",
            checksum: "38d6a204296af811f08eebf747621652f8b20770c1d14ff052aeba83e0409b5b"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/OgurySdk.zip",
            checksum: "2cbc6ab5778b2efab6209105b334633dfe92b72539ec310b03aeb2b08277459f"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/FBAudienceNetwork.zip",
            checksum: "d78e361d57c9742a87fe3c2c3c568f00eae9e9ee2f4bc7b7f9e5b88b81c01564"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/TappxFramework.zip",
            checksum: "143a784b1c541d6510c90cf53119fb579e6c8c37e1d41373c25b99579eaa4702"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/OMSDK_Tappx.zip",
            checksum: "30756817f1bcb747d440be3f20627b76724316278820e0e38eeb47b2907d2f09"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/VungleAdsSDK.zip",
            checksum: "f044d54c5fd94a952d9fc3a84a1616cab6162ec9e65b7bb61aa0fb30ed630018"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/IronSourceAdQualitySDK.zip",
            checksum: "975eb9f4d8e164bbb60d647fc1d86eee73e5cc653aee1dce9c3a581cb294120f"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/DTBiOSSDK.zip",
            checksum: "abf9d6abc79530c73a4d9bd691b796d0b9225d598feeabdbec1c7c492371103e"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/KidozSDK.zip",
            checksum: "e12a70e00fb2c69816c871df9fc0bd1bab7c87cf40a49b4234731f4f0073358a"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/FeedAd.zip",
            checksum: "52d1da8fb70859c103ac476bb59686481f15e176004828132a5981c330b00b21"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/MTGSDKInterstitialVideo.zip",
            checksum: "ad6fb9d5b45990eb97e4e64c4a63ca56a7ce82e50a7f8fe59d168fc40a6e7562"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/MTGSDKBanner.zip",
            checksum: "834d6c1c584e6bf3fcd8ec412c863dc4eefc613a471000b20b7f33e907de0233"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/MTGSDKBidding.zip",
            checksum: "ce56d9aa00a1f5f080fbf6b7790b84d351496cf8971eb1c9fe3c8b75b1eaa06c"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/MTGSDKReward.zip",
            checksum: "1f23c632473c2b080f8dab0d390a2aff9b8b3cf2c058ed2e172ed8c5c215fd52"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/MTGSDKNativeAdvanced.zip",
            checksum: "667137f77d9edef8ecf961df9fa6bf31c3d9b042a4688e160c19720d49637051"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/MTGSDKSplash.zip",
            checksum: "2150a630b6f1869aadc3acb8cf6833729601cb88cf6a585c195b6995adf78a5e"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/MTGSDKNewInterstitial.zip",
            checksum: "3552c26343358f16c80bdcfb7347bbd52c838c33088d0cb69b8933378e83cc55"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/MTGSDK.zip",
            checksum: "c32a6a5e64803fada084268a4d105df983ad458cdb6348f9e29f05d3e043f333"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/IronSource.zip",
            checksum: "122de5de4a98c5b0fe262eb800af8b474d438185a44732e23bed480884a84fb2"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/MolocoSDK.zip",
            checksum: "b70ca425599aa779d39296f7b13033040a0369da1c9addef2a4a9c9621ee97fe"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/AppNexusSDK.zip",
            checksum: "17e7c0a5af407ba51364c04e6bfdb5e175cb06eeffa55c6217a6d64777822831"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta4/SASDisplayKit.zip",
            checksum: "5d7aa628d100cc96752b6095b05fc7a89b68272cf7a1132e45984d0667d85b3d"
        ),
    ]
)
