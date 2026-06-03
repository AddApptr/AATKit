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
        .library(name: "AATKit-GraviteRTB", targets: ["AATKit-GraviteRTB"]),
        .library(name: "AATKit-Moloco", targets: ["AATKit-Moloco"]),
        .library(name: "AATKit-InMobi", targets: ["AATKit-InMobi"]),
        .library(name: "AATKit-IronSource", targets: ["AATKit-IronSource"]),
        .library(name: "AATKit-PubNative", targets: ["AATKit-PubNative"]),
        .library(name: "AATKit-Prebid", targets: ["AATKit-Prebid"]),
        .library(name: "AATKit-Tappx", targets: ["AATKit-Tappx"]),
        .library(name: "AATKit-Teads", targets: ["AATKit-Teads"]),
        .library(name: "AATKit-Unity", targets: ["AATKit-Unity"]),
        .library(name: "AATKit-Vungle", targets: ["AATKit-Vungle"]),
        .library(name: "AATKit-Mintegral", targets: ["AATKit-Mintegral"]),
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
                                                   "AATKit-InMobi",
                                                   "AATKit-IronSource",
                                                   "AATKit-PubNative",
                                                   "AATKit-Unity",
                                                   "AATKit-Vungle",
                                                   "AATKit-Mintegral",
                                                   "AATKit-GooglePartnerBidding",
                                                   "AATKit-Tappx",
                                                   "AATKit-AppNexus",
                                                   "AATKit-Prebid",
                                                   "AATKit-AATMetaBiddingAdapter",
                                                   "AATKit-Moloco"
                                                  ]),

    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", .upToNextMinor(from: "13.6.2")),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .upToNextMinor(from: "13.4.0")),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", .upToNextMinor(from: "1.33.1")),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(url: "https://github.com/AddApptr/RTBSDK.git", .upToNextMinor(from: "1.10.0-beta1"))
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
                    dependencies: ["AATAppNexusSDK", "AATAppNexusAdapter", "AATOMSDK_Microsoft"],
                    path: "./Sources/AppNexusSources"),

            .target(name:"AATKit-Amazon",
                    dependencies: ["AATDTBiOSSDK", "AATAmazonAdapter"],
                    path: "./Sources/AmazonSources"),

            .target(name:"AATKit-GraviteRTB",
                    dependencies: [
                        .product(name: "RTBSDK", package: "RTBSDK"),
                        "AATGraviteRTBAdapter"
                    ],
                    path: "./Sources/GraviteRTB"),

            .target(name:"AATKit-GoogleCMP",
                    dependencies: [
                        .product(name: "GoogleUserMessagingPlatform", package: "swift-package-manager-google-user-messaging-platform"),
                        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                        "AATGoogleCMPAdapter"
                    ],
                    path: "./Sources/GoogleCMPSources"),


        // AATMetaBiddingAdapter
        .target(name: "AATKit-AATMetaBiddingAdapter",
                dependencies: [
                    "AATKit",
                    "AATKit-GraviteRTB",
                    "AATFBAudienceNetwork",
                    "AATMetaBiddingAdapter"
                ], path: "./Sources/MetaBidingSources"),

            .target(name:"AATKit-Moloco",
                    dependencies: ["AATMolocoBiddingDSPAdapter", "AATMolocoSDK", "AATKit", "AATKit-GraviteRTB",],
                    path: "./Sources/MolocoSources"),

            .target(name:"AATKit-Tappx",
                    dependencies: ["AATTappxFramework", "AATOMSDK_Tappx", "AATTappxAdapter"],
                    path: "./Sources/Tappx"),

            .target(name:"AATKit-Teads",
                    dependencies: ["AATTeadsSDK", "AATOMSDK_Teadstv", "AATTeadsAdapter"],
                    path: "./Sources/TeadsSources"),

            .target(name:"AATKit-InMobi",
                    dependencies: ["AATInMobiSDK", "AATInMobiAdapter"],
                    path: "./Sources/InMobiSources"),

            .target(name:"AATKit-IronSource",
                    dependencies: ["AATIronSource", "AATIronSourceAdapter"],
                    path: "./Sources/IronSourceSources"),

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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATAmazonAdapter.zip",
            checksum: "97bde0432e26d0250869b0b5beaac3e367d04bfa4372bbe88eaa9bfe59b0d97b"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATUnityAdapter.zip",
            checksum: "f3c9248871a7ff8dae9da0af852892161dfc51d5baaaefca5c19319c67d7656e"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATAppNexusAdapter.zip",
            checksum: "9a76a9181c6db5e96f73e58a3b87ae724200735e70f253437cdd96eca1c3f7c9"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATIronSourceAdapter.zip",
            checksum: "401a32ddc4b68a17fb5a175cb55df5eef05b38e279d41fffdc98d22b653420df"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATDFPPrebidAdapter.zip",
            checksum: "182a3f8dcd4fd1473a305dfdb0dbaea1ded4771993b63494f4e0ed6a93fb9dd1"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATGraviteRTBAdapter.zip",
            checksum: "3c8a58efa8872e78cf5a0ae5d7201ff0ff9fe5455b1a6a4571de7b51b2080463"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/HyBid.zip",
            checksum: "e668e019c8bc0077321119daf20737bf1512e493cd4dcfdbc412f0672f2e4f7d"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/OMSDK_Pubnativenet.zip",
            checksum: "5c6f5d3358db9acc0aae4801165dbbb0a99955a8b560438b4dc305c5d6916136"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/ATOM.zip",
            checksum: "6d5db74dda7e0f10145526e21ac3bb7294158ce0b582dc2b73d2557c28040bbe"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/OMSDK_Prebidorg.zip",
            checksum: "a9d27f56985a7fc934416b78b02ad79bbfd693d9123202f2ece5e4b2616237b0"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/PrebidMobile.zip",
            checksum: "965d81a1cfca97d5a0c86025636a31042383a861f4e8d2ccfc9c79601584f457"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/DIOSDK.zip",
            checksum: "8ae0cbc5425bd5d7134248043dacb751165b540ba9fc956e4484efb77e216bd0"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/ConsentViewController.zip",
            checksum: "cc01df431ff0f41a4112c654f0763c0840216a3ac75d98f8b2caf4a1f25157b8"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/Utiq.zip",
            checksum: "5ee74f3fb55c49607a8fe0ff8145b4a977734760e823a83f2ad5c20292e821c7"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATSourcePointCMPAdapter.zip",
            checksum: "975f0a98437ffa04e3f1b2361cd304b6db1cce28f2c76e563ab47a47a9b978ea"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATAdMobDSPAdapter.zip",
            checksum: "decb6a4fa1b4b7bad6d9b66b8a93e2a3902301fad2ef5d1dfa9706bef33ebb0d"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATGoogleAdsAdapter.zip",
            checksum: "8f4d83a9029defabea4452cc0c6bec2bcd9d896d7252308881ac4ae23c89cc1d"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATDisplayIOAdapter.zip",
            checksum: "60c87a10f6a01659fcf7a915239de87dc4c8c8ad1d60bf1d1faa774fcb0664ea"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATPubNativeAdapter.zip",
            checksum: "02421dd10db1396591acccefb69599b298f32faf0a9abbdec3eb74df7441282b"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATMetaBiddingAdapter.zip",
            checksum: "13880417ce3f3ae98dc16c85402af81383088d9d0a81770d2b55962862552c67"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATVungleAdapter.zip",
            checksum: "dd70c100c19f0f0c30655ab936ded968002e192002d3ea79bb09153fe6816df3"
        ),
        .binaryTarget(
            name: "AATDigitalTurbineBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATDigitalTurbineBiddingAdapter.zip",
            checksum: "99befd0b84c1b882bef623f1ed77a6c2396a7a6fe5e0129ba5bb2bba5b6402af"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATMintegralAdapter.zip",
            checksum: "6b85c403bf7d46360a1556778dede11f575dccef90a2df8cdb8b681b9247ea51"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATGoogleCMPAdapter.zip",
            checksum: "22bef663ec033efff6fb96c193428c900272a802b09578acba2604f33419f82a"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATAppConsentAdapter.zip",
            checksum: "99e4e7aa801a0491290e555d22a47c2f53ef3e9d6c29cf6b176d23ab43c45ded"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATMolocoBiddingDSPAdapter.zip",
            checksum: "6dd7c97ffb285b8f36f361368a9894e3471e2daa48e8fd505c5e96b025b8306c"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATAdMobMediationAdapter.zip",
            checksum: "9bf1851f44b7e56bff107ec35779eabbead80fb39a01baac1a3417d3bf9ad32d"
        ),
        .binaryTarget(
            name: "AATVungleBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATVungleBiddingAdapter.zip",
            checksum: "e55a112f7cce7cd88f258a1dfb3d629b109ae94b1e7bd6529651ba8b5101abed"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATInMobiAdapter.zip",
            checksum: "5262521677df92847c32307d66e1a7bb92602aad38c5c893d733dff0fa1fc3be"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATUTIQAdapter.zip",
            checksum: "2f9ae5246d5cfc853117befb148effba8e908d754953414db3c2699d97cd5703"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATKit.zip",
            checksum: "f6973fbfb2ad6125f716ca8bfb251d3d857229ac1429b03cd2ce9368895232de"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATTappxAdapter.zip",
            checksum: "12271fe1fbaefbc5918eb720259d5684099ba083320a0b206e43008f924859ac"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATAppLovinAdapter.zip",
            checksum: "718a62c4e6efa97a34faadcfb381e705d70aa8b5eb4c7da347d5f6897fcb4039"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATAppHarbrAdapter.zip",
            checksum: "e4522975a29d88a355ce04794c802d3f1cd9486ea009d5ffb9b18d967ed8f134"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AATTeadsAdapter.zip",
            checksum: "91ca657e70fe02ddac16e7c41d45c335d582e415e4f81d22cf0dd74a73443da5"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AppConsent.zip",
            checksum: "5288c233f5cd80070ab2651d2e2861516d90ba2c2676a1326a22c8518077b7e1"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/UnityAds.zip",
            checksum: "07cd442d29fef8f83637d224a57f579d836209717768ec364654311106dbef8c"
        ),
        .binaryTarget(
            name: "AATIASDKCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/IASDKCore.zip",
            checksum: "6156b99def0a962018d3110d80819ae4616f7d2d0be6744269c841f91ea2d27d"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/InMobiSDK.zip",
            checksum: "25e291113ea92c70a884796ad43d006dade484b51e53f260cd9342b57be8ca8b"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/TeadsSDK.zip",
            checksum: "6492a8c1aaa8fac36878d9a1af4f15fa5fddfda49c1f28fa8ede332e3ae80312"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/OMSDK_Teadstv.zip",
            checksum: "888fec302d73754d7701ea54f12da49c2f25bf54f812622118b002363ba0b281"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/FBAudienceNetwork.zip",
            checksum: "094507d6cdc362d4aecaabe751e3eda391c364a35fec06519a901bc1a96d9972"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/TappxFramework.zip",
            checksum: "d4ce8e7024400786a06875a27e1b2afaa6baf51fb07a48dd4ba47bd578d8673e"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/OMSDK_Tappx.zip",
            checksum: "a8b1d3f90d30c7b2774b75aee244839f9d0647f54ff437ed73aac62196681374"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/VungleAdsSDK.zip",
            checksum: "0f20713540c504c89b35fcb38b0ce540694a58c08db89d062f68b295178f055f"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/IronSourceAdQualitySDK.zip",
            checksum: "27eccc5fce1938690611178cb5045f308c4d1aa2f2687d2de12b3929b16eeefb"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/DTBiOSSDK.zip",
            checksum: "915ecc27efc4f7bceda6e60566af13f89f98646ffefab73f1642b6c44f75277a"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/MTGSDKInterstitialVideo.zip",
            checksum: "8c6f40199774dcd44b3c60b8bcf9873aec17f1a594832d447132189af9a93cb1"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/MTGSDKBanner.zip",
            checksum: "354b060c4c3997483250095434c77f724e8451267cb5bfd2a599c839d9b291ec"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/MTGSDKBidding.zip",
            checksum: "52f6b4d94ce8a58fd314b85e34c564b69f8f6db102fed1fbadd10b7ab343b692"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/MTGSDKReward.zip",
            checksum: "52f1bd628519c01130b246d4f6dc2281b9a200b94848df35579d9ab9719bc5b3"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/MTGSDKNativeAdvanced.zip",
            checksum: "86ca35f4eb2a9c6cfbd90e97147eba6d02bc803f12ef33d2cbf71b1ae38f411b"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/MTGSDKSplash.zip",
            checksum: "288214de8134d3dda337a37252f2c90586c4856afe56f91856b081d335259976"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/MTGSDKNewInterstitial.zip",
            checksum: "b5d16d6658cf1e15ca1addc61a4e4d2c8da414493c7ad04d81dcd40c3e1c7c0d"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/MTGSDK.zip",
            checksum: "7475e598e1ec91d8e97076910bffbd9689bfe0197a6f65b0853a41378c84ee73"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/IronSource.zip",
            checksum: "ba441b8d3e79acb409aee66a69d006f0c41d37ebb89d1ee9b214394878094bf2"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/MolocoSDK.zip",
            checksum: "0f9a6cf039920aeda236aff4195f707208f4b43850f5d5a31b4d4e1386923ec1"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/OMSDK_Microsoft.zip",
            checksum: "d97f709314389d315109529f9a382638e2bacaf903aca513b8ad2d57b1101f25"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.17.0-beta1/AppNexusSDK.zip",
            checksum: "c0cf2db3aed69d6f220b5f95e38a634bdcf7e77751e74a77669e85716a54fad1"
        ),
    ]
)
