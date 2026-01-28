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
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", .upToNextMinor(from: "13.5.1")),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .upToNextMinor(from: "12.14.0")),
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATAmazonAdapter.zip",
            checksum: "2d47c1cfb8ce58887d24dbbdb282f0a247f4627678704a21001d70bce1f01d03"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATUnityAdapter.zip",
            checksum: "e7ef8374c0071cfb998a6c449e408d1ff7c232554a310aa2758e757b2bb065c1"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATAppNexusAdapter.zip",
            checksum: "f639c3d8d779df2c9b82f7eef384a7f917aefad960b1efcfcd54f12ceb3876bf"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATSmartAdAdapter.zip",
            checksum: "bbeda49a8c9a9dedad71ee784d92e0abff99c222da2c236118f2be99a6264c60"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATIronSourceAdapter.zip",
            checksum: "4cc680a1a9122d92157de8f4eba75561f02e1dadf79fd8eea23241402304ee6a"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATDFPPrebidAdapter.zip",
            checksum: "83f044882706c884c2cddf462829e8a267e061b6a4c341221b73412519e40d19"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATGraviteRTBAdapter.zip",
            checksum: "297cc57434934d57aec9c0800c4c45f6ba43950d54db2ac1ed87b6ed8b6da23c"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/DIOSDK.zip",
            checksum: "2c0d1b62ec3199dd30ef1f400a521d91e9c7c4647930dd591faacdaee712a664"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/HyBid.zip",
            checksum: "01a8135466417093c407dd367604bf88e73059504c8975a0a4b68873f83deaa3"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/OMSDK_Pubnativenet.zip",
            checksum: "f9e9357a53766f494adc7baa69442ab59d9a4dcce74823f2b303dc5562c16cb5"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/ATOM.zip",
            checksum: "ce60fa213e7e781bd94578ee7e4dacd4c1118278b8f8c93dccd2e63fa5938ebb"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/Utiq.zip",
            checksum: "220c34590a97f5831a8c55bc9a3afebd7e5ca17b8c9fa02fa4c92afacaa1296e"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/ConsentViewController.zip",
            checksum: "e71ae079798bff399037adeb61648b12dd3edc34a4174b2b729c00b014e65a57"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/VisxSDK.zip",
            checksum: "b90f36034c0904f2431d05a375e3758a3f7fcb8943d75d6716e005d069134c90"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/OMSDK_Prebidorg.zip",
            checksum: "237d0feb88740b906f87e67a4a034db0c52fc7c2031bc3967833bf9fca3d52c4"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/PrebidMobile.zip",
            checksum: "692bf9d4ad217aaf198e47209632412c3677ebcc5caef3ba767b4539b799897b"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATSourcePointCMPAdapter.zip",
            checksum: "d6de413385bcb104017f011ec04136477981533bf94c0bc698f07cc5bbeb39dd"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATAdMobDSPAdapter.zip",
            checksum: "eb3cd744f74eea8746fcc2e5dceb816f37ddfe9958c8224f7f2181f43194e855"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATSuperAwesomeAdapter.zip",
            checksum: "5e3c492424a43043213d96c32514a9aba3bc33e2c5cc42881790496df4d7620c"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATGoogleAdsAdapter.zip",
            checksum: "9af6bec29393b6214965616057459db002046fd5a64f74e4bd41880cbb3ee1f7"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATDisplayIOAdapter.zip",
            checksum: "db2032679ff9057a7b371183e9bee87b31f771fa1b7005a24b9cef0c3fdaaa41"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATPubNativeAdapter.zip",
            checksum: "330d82595ca01d7a31665c5fe4151558063997af692570012fe6a5a64329d808"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATMetaBiddingAdapter.zip",
            checksum: "cdedb08fc3d266dd89daa6dae3635d8bf674bb8be397a5096dd328ed08646098"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATVungleAdapter.zip",
            checksum: "f187b492f1f2d1e8f32d1eab0f674e9e8585fc67fbd684c0d4ac004e4c4439f8"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATFacebookAdapter.zip",
            checksum: "4284ad084d9861b53cc682718dd2dac6438baff0087bd7499905df95a111baa3"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATFeedAdAdapter.zip",
            checksum: "557a9df91ea9549029db8ba2b9df986496625a460aefe06d88f73620fc54b40f"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATMintegralAdapter.zip",
            checksum: "34c93903ff40c1265931887e9e4a8d2acaf84739a93d90d3f04cd7d1f33debc3"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATKidozAdapter.zip",
            checksum: "6e6b99a1244dfde070a6e27d52b252b975172d5716278f0242226917a69def15"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATGoogleCMPAdapter.zip",
            checksum: "39259ee76776ba1e4cad226607f46edc928c1d6af6d3b0ac135a802cd85c0e48"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATAppConsentAdapter.zip",
            checksum: "92e6b086446b753f037409e2e73346faf728b3a898c40271ae42c8c094ea58b8"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATMolocoBiddingDSPAdapter.zip",
            checksum: "9834030a1e7ab671d22ebd8ab8e22ea3254c218f93b2e4a5d64217542d712958"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATAdMobMediationAdapter.zip",
            checksum: "57665e30839e40b295bc27cbaae441e9956bc683cb16c45e5fd119994681f3f7"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATInMobiAdapter.zip",
            checksum: "9e766b81c80b9ceb77de2fc902fe5059891d858f11599f236ef49f6f775bad7e"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATOguryAdapter.zip",
            checksum: "d6d147ebdfd65d99ca63da47284e10ed1a774a41f791f1968a9baf5293354fb0"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATUTIQAdapter.zip",
            checksum: "a15e2150b3b88cf94b746e4e5cd1be7fc6e082787080a8fe9b23b037d5268f29"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATYOCAdapter.zip",
            checksum: "3a768a3fbee0a18a01cbcb0d5fb7ac0fea592f76579e30285a6603489f931d4c"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATKit.zip",
            checksum: "052f2e2db33d170a039629dbce1cafa852c88ed4de97acbc980461951e463304"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATTappxAdapter.zip",
            checksum: "b955f0a0856d7266dda528df6b8da56c630daef879a75dad6857017961ed108e"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATAppLovinAdapter.zip",
            checksum: "64e1c36004bb42ce277fc07fb9e1d176a2849a412549cf0b75c780b811cf48fa"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATAppHarbrAdapter.zip",
            checksum: "0de19abcbaed44fe53e8430fb750f74ccb919c8c5fdc1f3785f1296b2ff52d2c"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AATTeadsAdapter.zip",
            checksum: "b77b5094cf3f04f35cf589ec023f40e84a09fcfbafcd3f1fa32d2c8c3113da8f"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AppConsent.zip",
            checksum: "3548f21356f57617b1d6f8dc1b1c718995327018dc1f4fa6f9b7a3302f0e831a"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/UnityAds.zip",
            checksum: "e10281bd13d3b796cf48504a8c740ef58a149f4080e59ccb325e2e601362dd48"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/OguryCore.zip",
            checksum: "2f5bcf7049ef4fb03782222c914557abc6e54850785ea1c208253ea99c84d241"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/OMSDK_Ogury.zip",
            checksum: "cf027581e041e2d0a66c1c5b7caf51d6d1a6d08a3b5bf8a15164d437c20733df"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/OguryAds.zip",
            checksum: "745f1d83dc930b283364c50bf47245391a77ddc395f2120343418154a4e1189c"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/InMobiSDK.zip",
            checksum: "6917b4b8574cb8c4e1eaba8ba77e5aa72368b689c66f7ae16af6ed62defaec21"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/TeadsSDK.zip",
            checksum: "1c4cf44c06dd7cc5e7f34301783e5b4080b0eb1468749fb1b453272775306b7b"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/OMSDK_Teadstv.zip",
            checksum: "b60d8affef4b78a478744d86861109c4f232600d821514bdb96ec0f82f7950bb"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/OgurySdk.zip",
            checksum: "26dc229154f32c19cafb37a4c2d7b421aae124fb52123097124c54c107dc6cf1"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/FBAudienceNetwork.zip",
            checksum: "c417f0d54d3fdfc8bcac4cf666d1138182d94426487057ecf901a42363dc2d61"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/TappxFramework.zip",
            checksum: "9869f1f7fe5347efa7ecf2f13ace92d8bb3f7998fd1a2b687c90689e32d688bc"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/OMSDK_Tappx.zip",
            checksum: "1304457dc02d34f22e8602dc4d9fb367b68480236a2014746ed90f181ef69cb3"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/VungleAdsSDK.zip",
            checksum: "afdb4d71ba7c24a7b39a0ea86949b51d3823d0a8dc469368224efd46ba485497"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/IronSourceAdQualitySDK.zip",
            checksum: "b7e506210fe36122b5ffc182b0ae5bcc3ef580b9b66a73f01813cd91c714f246"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/DTBiOSSDK.zip",
            checksum: "79dc3a1dfbc5bcd714e541663e890d11b8d911f0944584d8e906b340e62a30db"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/KidozSDK.zip",
            checksum: "f8792eda5f0a275143a58e6c21b9f3fc61266f70c58764a4a810a7e98904f787"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/FeedAd.zip",
            checksum: "d5f15ba62b0b9de189b0b0afdaeb66837753ed72096fb29d57be5a1c0e6cda21"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/MTGSDKInterstitialVideo.zip",
            checksum: "409dbe32bc71513f6feca999e7acc8a445c86e7aa386a4f95870e769f5bfd398"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/MTGSDKBanner.zip",
            checksum: "c6af1875c9a3186018dee8490e686d38a5d2177d99f7c9383cec8dc93cdd019a"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/MTGSDKBidding.zip",
            checksum: "bd4dfe86777305f49d3e9e0df1515b8cfcdc6bd9cf2714a4d7fc8b49906f8a23"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/MTGSDKReward.zip",
            checksum: "32f48edaff182b1e8c80a4f2cd29261f3967789304415b79d9ac2cf967c1ae17"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/MTGSDKNativeAdvanced.zip",
            checksum: "7c6ee11b1f03efd3053ec05a99fa9426c854667113308015751ae55c91da0f0d"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/MTGSDKSplash.zip",
            checksum: "c72c42ca02021396f904e3f3b056b918c14c5e7a95ef7f8618c20e79c473414c"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/MTGSDKNewInterstitial.zip",
            checksum: "390e4f779410983ad7c029356f3280aaa3f6c7ba2712cd6ffbb7085cb40e9574"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/MTGSDK.zip",
            checksum: "894295603e7ebcba908f0a92a8eea733c5383846ae609828c4816db5b462089f"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/IronSource.zip",
            checksum: "63fef6c81cfca3e0cd69da515a43a54a07f832fd376063d72bee38e440aab072"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/MolocoSDK.zip",
            checksum: "2fcf461fbf7b452a7c4697981a72151d41d9a0ed867ef1e4be9431e176fc7626"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/AppNexusSDK.zip",
            checksum: "3ed7da364edf6570fda50f03e40ee2124d54cea2289b21ad17b4bda5d7470fdf"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta2/SASDisplayKit.zip",
            checksum: "2335c5754c30f2a67563684cc65aac789e0d7d2c43827fe54bef2dafc85dac89"
        ),
    ]
)
