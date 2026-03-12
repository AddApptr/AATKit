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
                    dependencies: ["AATAppNexusSDK", "AATAppNexusAdapter", "AATOMSDK_Microsoft"],
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
            checksum: "7574f62ecf843f6f5b883de8a29f85328b8713b54e3d2ff7b8d9f0d966b05fc7"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/UnityAds.zip",
            checksum: "b47ff4ab2bf02e021c962d4775cd1a52c9f57562e111a6841a733fb5dbf9b7d3"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OguryCore.zip",
            checksum: "2bfaf05da6ae9dcac81382b25f6f6e8dea06fd99fead11b2a6b8566f3f3dc19b"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OMSDK_Ogury.zip",
            checksum: "cf736fc24850a75ee879ff9abf85e3bd17ae10b8217b5c56e9d0ee55c3cb720f"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OguryAds.zip",
            checksum: "2c8f3f315326e75ea0e77a90faa527df482c2e927e0bbe2590da3bc7024f4b7a"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/InMobiSDK.zip",
            checksum: "19d31233a278578611a9cb648e9c388bbbd56be1a79a2a89bc00c282fdb31877"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/TeadsSDK.zip",
            checksum: "d03d2109971a6a7983610a38dc17a3e99c496c97d023e91ccb41f91b7b9f671c"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OMSDK_Teadstv.zip",
            checksum: "a93a941d418d0573ca9c5f0d793a9811901a999b18341ea0d19bdf336b3e1b55"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OgurySdk.zip",
            checksum: "6b7deec23e0c7b21c08fe62e055f04892479491979076f26c1b9ea553009c86d"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/FBAudienceNetwork.zip",
            checksum: "88a449efa17f376a6bd639480962838b5b9bfc9c111c67f4579575eb3efa9df2"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/TappxFramework.zip",
            checksum: "a54a8926db7c1838507a65c69c5ed7d6dd79659d586c62947024e7fc78ad94b7"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OMSDK_Tappx.zip",
            checksum: "c8592cc8c3ca4c8dd5acf18f76ab965aca0c11f8d4e7c2a3cd66dbfbb9f21275"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/VungleAdsSDK.zip",
            checksum: "fd5bbe8f9ad926a762c56679ce309e555eaec20cba0493fb98449c9043da6a43"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/IronSourceAdQualitySDK.zip",
            checksum: "645a19301c88ea2146a5ed6a9a36ad4556f099b173807b8013187cc58fff0801"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/DTBiOSSDK.zip",
            checksum: "664af0b24bfc57210329d1ce73ddeae509ee782e12cb907ff65a1422ee0b4422"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/KidozSDK.zip",
            checksum: "fea359f438a7a9638afb85c31a49069699b034cce72e7cb2841ce6afd459869d"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/FeedAd.zip",
            checksum: "caf50b35571b05c6cbbc0821d0857b61d318bf9238466916653e6b24321dfd61"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKInterstitialVideo.zip",
            checksum: "2e50a69ff5f08ad20f439b37e3d6fdb4a4bca56ec12a7a49e2f3f52500460e6e"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKBanner.zip",
            checksum: "743127f38feeded53b3d1683a837d89befdaee12050f21a7e24d3ae38dee0053"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKBidding.zip",
            checksum: "a8a14ce45d017133bd395a565d97f6edfd1a6981536c3fe6869bdc9bfb5785e2"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKReward.zip",
            checksum: "038095c4c1fd81839f49d50392fb209c828039d9461bd413ea2f319aa81c75f1"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKNativeAdvanced.zip",
            checksum: "2ea4b5889c1a61d9a7321e7a76b58e3cb4fd2dfcd1a3fa645d1039ffeb83bce4"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKSplash.zip",
            checksum: "2d48233376091e592676fad2e4cf0b2cdfe06f680ab540862ac1bdfd6c0e5c05"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDKNewInterstitial.zip",
            checksum: "a08fe9efc429e93c50c7e64682dcc74eb54f0219c05276f30edb0809e1a5c266"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MTGSDK.zip",
            checksum: "bb2a00de9174a538f6e3ed168608947116d539b95756d72c7f36c97fe599d465"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/IronSource.zip",
            checksum: "1c35f3db17b0bc0c9a4a6dd8a9a1c2f58997d9f7272e35172964bea258c47f9c"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/MolocoSDK.zip",
            checksum: "3822fdb3e570065a3cf1da11f7d9321272fa6d6b8d4722d9c9efb6c2bef16b7f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/OMSDK_Microsoft.zip",
            checksum: "860b76486263ea5bf794a9940462deae78e26697057cf9b1ff55112912b67aa6"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/AppNexusSDK.zip",
            checksum: "417c4e39ed9229d75d743be0808e34ffb579fb7fd97f2843a9a76e1c076d7fb8"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta7/SASDisplayKit.zip",
            checksum: "d41848b56f296aa068801a32f792d0fbe4bcd0ae60c1d59a75344b097433fb7f"
        ),
    ]
)
