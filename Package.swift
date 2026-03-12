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
                    path: "./Sources/AppNexusSources",
                    resources: [
                        .process("Resources")
                    ]),

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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATAmazonAdapter.zip",
            checksum: "3aafd9f5df689fdc9c7309eb15d0bf269b4564dea4026b67886289d240498644"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATUnityAdapter.zip",
            checksum: "efeae94902442a9c92bb2530ba3e7979ec6b9f8ce727a782421834f986f6d030"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATAppNexusAdapter.zip",
            checksum: "56775e43a37ffa4684c067f4945f30014a969591d8785d1447e417d40fb81ca0"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATSmartAdAdapter.zip",
            checksum: "e84a8aaec669b9c04eac69014440bc452ef0e407aff1ac187be75f70b72fd18b"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATIronSourceAdapter.zip",
            checksum: "b4262662e7ea9ee95ad0d2eccb83a6c3cabcdc0b72bc3c78dce6cb48dba667d6"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATDFPPrebidAdapter.zip",
            checksum: "689c003701bd713fb717edf78631619ab0db9562a29dbe5dff73cf0691446906"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATGraviteRTBAdapter.zip",
            checksum: "66f731dedcb5ccd72fc0f7cae75d4d7faf0fa171c7894a5af683abf4d070c040"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/DIOSDK.zip",
            checksum: "38a9c170c2840529b912a06435e72241ba4e16ae4a615de03ab04027cf8dcfe3"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/HyBid.zip",
            checksum: "26c8e61e9071e2ddbdf79d2e9e5253a204d434681b0191697a41d30527706710"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OMSDK_Pubnativenet.zip",
            checksum: "0a1f5e783df4d2fba3923f03b1c9fd4fd85648adb0fb5b1012014383007168a1"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/ATOM.zip",
            checksum: "b349e01b6baffb4c97a0f5ce7a6bdd1075d371dde222258a059c8fbf0b446309"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/Utiq.zip",
            checksum: "8df37ea9cd9647b2d80f8e58377e329528aba4a160e2c960932cf731a53022d8"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/ConsentViewController.zip",
            checksum: "769aed15c67add29a0906331ce5b0159b6c15fb1035cc838229f13299e1662c4"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/VisxSDK.zip",
            checksum: "aabfdcb1d587f8a88640e8b8d08ce7cae8c9447182f95b3290e37c696a0b0d3d"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OMSDK_Prebidorg.zip",
            checksum: "d08fb81c88b56c149e879afed85e94a8642ce8a932a1e436a086e3ac01286fd8"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/PrebidMobile.zip",
            checksum: "50df3fdd14e628b5bfdc1288bd820a33f66e8e3cc070c619e44a1db822ed2980"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATSourcePointCMPAdapter.zip",
            checksum: "4f1fbcfb0dba3f81384f7c6a9291cd1c9b32f21dece602c03776e9c8b6ccbf71"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATAdMobDSPAdapter.zip",
            checksum: "e42567fe0e5a0d81d754318178a07bb4b7a1d18631422e69ec6e96595b95b8b6"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATSuperAwesomeAdapter.zip",
            checksum: "0a0b4ee76d7099bd1dd56327cb4652879e452dca21c91a36b9b32e9ac4ea1b7a"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATGoogleAdsAdapter.zip",
            checksum: "911f60b0b8ffdd606bafc7fa8a240f770c9ba7d6e75b474d6fb769b88b46cf41"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATDisplayIOAdapter.zip",
            checksum: "18cc487567dc66fc6349f710986a28e55b2404be77d78518a01a044013209824"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATPubNativeAdapter.zip",
            checksum: "ff5ca18a5ca720b2e3be4826fd94bd4f2e674c434e96c3264914aa911f151159"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATMetaBiddingAdapter.zip",
            checksum: "d3caa58883192c850a82e259f11993012ce8ab231a26c0d3fd9b96d761da1b0a"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATVungleAdapter.zip",
            checksum: "ea75700f214c7086b3b7b6b2c1bdcbcec64166003a4496cb6edfdc5e5cd324c6"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATFacebookAdapter.zip",
            checksum: "9337cddc62fb1d0b97ded925ac200d532d7178d940482e72a85171a7b855714a"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATFeedAdAdapter.zip",
            checksum: "67e46d9de3359363df35786dfffcd7b2746f0a801bbdfafc9c6394f45e25ec4b"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATMintegralAdapter.zip",
            checksum: "6fd7fa1b7942641f9ed9f8cca19af3f1bdaab1a2b31a934c02d2fda9e2f19518"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATKidozAdapter.zip",
            checksum: "3fa673d5d43b65a487a46490194e4b458f1cee5b62e3e6215c5177756411eb75"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATGoogleCMPAdapter.zip",
            checksum: "06d194ed76c0f0a5fb5f699a39bc94237cdf6f741c6053e79cde8d13c434f7b4"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATAppConsentAdapter.zip",
            checksum: "291405cd2a12196bb74cfd037b3ffbbc9f830cae7ce6a0d6f312fd705380bf50"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATMolocoBiddingDSPAdapter.zip",
            checksum: "bbe576e6fda45789fa3f49d89fb8712fba2f9eb51101cd850f6ba974780d224e"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATAdMobMediationAdapter.zip",
            checksum: "b30eb7cdf1ca192ec6762f34d4c33335fb8f3e59c14941d87701b7d79f81c96a"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATInMobiAdapter.zip",
            checksum: "70d8949f5d94550d55a0794dc7638c719dc787a4a995d0dcfa42c7c168cea7f9"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATOguryAdapter.zip",
            checksum: "357c3644eee230215d9114b8b5edff9f2f998a11f7cbf1e2fd9f4a33efdde7e7"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATUTIQAdapter.zip",
            checksum: "cfac1b0106509076abe4bb8a21ab5575789078ce9cabd3e6936ed364b911860b"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATYOCAdapter.zip",
            checksum: "d949c9857ff3fe7bc6e67b431a6c6f4e4501a1d9e1bb0ecbd34f6ffa08bf5786"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATKit.zip",
            checksum: "8b933672d0091fe5befc6d9970c166c1ea01b0e8871a7f601e59a900933d9397"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATTappxAdapter.zip",
            checksum: "200f932e5d44afaa267868f16deb028d176c124c86639e79ad6bbad4c2962e6a"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATAppLovinAdapter.zip",
            checksum: "1a157f4e338a012d15d60a6aa46704ac3068c8f8474a1cea50fb6e1ec09a8ebe"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATAppHarbrAdapter.zip",
            checksum: "d349286299c43211f0508a58073558405d714dc279e90dc78a02a181bfd04a76"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AATTeadsAdapter.zip",
            checksum: "39cb2b9cf43d79552580b3c1e1ba0ee08d0cddd8c420de23187de64a1255591d"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AppConsent.zip",
            checksum: "6623ab9b0143e595ee0cf64610929f05684ca300d2c5d4b35b1ef179a4b74732"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/UnityAds.zip",
            checksum: "5b231ad76b29dda1b9ce73a7df44373d188b0f9fb8689eed5598059682586dce"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OguryCore.zip",
            checksum: "6b84b9e9a3d54daa45443cd461659acf8f87cf17ec261312e1f001ce93234f56"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OMSDK_Ogury.zip",
            checksum: "2202a2b5b1558d0a4b02e2a0e1d2d1cb874f30536d0a3173da32b18a4bb84805"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OguryAds.zip",
            checksum: "e318da9211dabbbee9f0c037518d31b7ced6ea822351e6828d82e722bf7cd193"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/InMobiSDK.zip",
            checksum: "0be06afb400fedd9e8b835e7b28cb8f1cb4e264b2c7ffac4c38e704f3771d735"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/TeadsSDK.zip",
            checksum: "7a0739d2ff371fda33448cfb59792f4afabd8b1099a0603b8c96e36a28709383"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OMSDK_Teadstv.zip",
            checksum: "56abb8eade7011d4e697b0f28d0999cddf27e31f27e0ff470ab62f4c68eebd0a"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OgurySdk.zip",
            checksum: "465b3cfd046f3bd0b2deedae9054a89f9ef3b3d55da23bb74278c22a80c56554"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/FBAudienceNetwork.zip",
            checksum: "f3b90c0226aad95e13291dd6ded8d5835023a983fcc9fc5537b37020829b3ef3"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/TappxFramework.zip",
            checksum: "9cb98affbfed3480d7bab83d8c4ed9d9aa1130b2211ca178f991c00bf38fc1ee"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OMSDK_Tappx.zip",
            checksum: "fda7e47f97514d7ac538e04d1effe4bb66c91d7201b828bc59288a3648a19ea2"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/VungleAdsSDK.zip",
            checksum: "c13b18094a84bc6429be16645bdb1b172c71ff837337011daa831c16264eb2c8"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/IronSourceAdQualitySDK.zip",
            checksum: "97185266454590a5dab501fe053eeb3b4708105d76b5effe919701bcc3cc885e"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/DTBiOSSDK.zip",
            checksum: "23b8629317815c0a1238a25a56be9c2dd6e6f90b21961f0595049c3754ec62d8"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/KidozSDK.zip",
            checksum: "4d68f1da49d9b5629ff764c4e0203a08877ee21cebed0f25fa938874ae7cdb21"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/FeedAd.zip",
            checksum: "f3ee7542665944e664aaef143228eecce5f6db176d6e3b787704c18cc9ade503"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKInterstitialVideo.zip",
            checksum: "47c26ba5c880136cc3d7ef431647339b35d54246d7f62c706eff9d778e0e3bcd"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKBanner.zip",
            checksum: "f36e042449b64c92c2efd4e6b83080e7e1d5c0c29b1cccd426e2a5ef8021e6e7"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKBidding.zip",
            checksum: "808e6bd653b1c90daeb6b2c218b8b69e65f8518f1826f2dcf8d81e33c6b9bfba"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKReward.zip",
            checksum: "2c13b6dc0527ddd6b77d653562fb13d39c2c3c664be7d035c3160f58638f06eb"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKNativeAdvanced.zip",
            checksum: "fe15f8ed69cbc91cea56f2830c62d18cbd6005923412b7c43549fc3a2991b0fd"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKSplash.zip",
            checksum: "66398ab6a012d00180377eb64522e71640b8c4d2b4bbeed484dc20d74c50bb5c"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKNewInterstitial.zip",
            checksum: "37c5003fd7409a5536f5c684262714445817806595959fbcdeddc361fb9abf1f"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDK.zip",
            checksum: "6c80e8b53c010b52163705d1dacf5155b77d97d64a3d09ff5345eb8e2418a77c"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/IronSource.zip",
            checksum: "980555ee1c81d151c2daae14bb5daae67a5a18fddde98825060e1284ba0b0248"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MolocoSDK.zip",
            checksum: "104d319e3a988c6b2a873a4b1c27d0a03c048fd127c3851818f4e10e822371db"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AppNexusSDK.zip",
            checksum: "723e329a3d232beb515f94411e2c487a6e95e54212d4bcb1872cadd2c5759aa5"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/SASDisplayKit.zip",
            checksum: "20bb32d14fe7a2f62ec988e4b66dfb52cde5338c1ac0b5540c7d50ea5078107c"
        ),
    ]
)
