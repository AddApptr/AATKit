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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATAmazonAdapter.zip",
            checksum: "3aafd9f5df689fdc9c7309eb15d0bf269b4564dea4026b67886289d240498644"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATUnityAdapter.zip",
            checksum: "efeae94902442a9c92bb2530ba3e7979ec6b9f8ce727a782421834f986f6d030"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATAppNexusAdapter.zip",
            checksum: "56775e43a37ffa4684c067f4945f30014a969591d8785d1447e417d40fb81ca0"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATSmartAdAdapter.zip",
            checksum: "e84a8aaec669b9c04eac69014440bc452ef0e407aff1ac187be75f70b72fd18b"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATIronSourceAdapter.zip",
            checksum: "b4262662e7ea9ee95ad0d2eccb83a6c3cabcdc0b72bc3c78dce6cb48dba667d6"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATDFPPrebidAdapter.zip",
            checksum: "689c003701bd713fb717edf78631619ab0db9562a29dbe5dff73cf0691446906"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATGraviteRTBAdapter.zip",
            checksum: "66f731dedcb5ccd72fc0f7cae75d4d7faf0fa171c7894a5af683abf4d070c040"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/DIOSDK.zip",
            checksum: "38a9c170c2840529b912a06435e72241ba4e16ae4a615de03ab04027cf8dcfe3"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/HyBid.zip",
            checksum: "26c8e61e9071e2ddbdf79d2e9e5253a204d434681b0191697a41d30527706710"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/OMSDK_Pubnativenet.zip",
            checksum: "0a1f5e783df4d2fba3923f03b1c9fd4fd85648adb0fb5b1012014383007168a1"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/ATOM.zip",
            checksum: "b349e01b6baffb4c97a0f5ce7a6bdd1075d371dde222258a059c8fbf0b446309"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/Utiq.zip",
            checksum: "8df37ea9cd9647b2d80f8e58377e329528aba4a160e2c960932cf731a53022d8"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/ConsentViewController.zip",
            checksum: "769aed15c67add29a0906331ce5b0159b6c15fb1035cc838229f13299e1662c4"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/VisxSDK.zip",
            checksum: "aabfdcb1d587f8a88640e8b8d08ce7cae8c9447182f95b3290e37c696a0b0d3d"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/OMSDK_Prebidorg.zip",
            checksum: "d08fb81c88b56c149e879afed85e94a8642ce8a932a1e436a086e3ac01286fd8"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/PrebidMobile.zip",
            checksum: "50df3fdd14e628b5bfdc1288bd820a33f66e8e3cc070c619e44a1db822ed2980"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATSourcePointCMPAdapter.zip",
            checksum: "4f1fbcfb0dba3f81384f7c6a9291cd1c9b32f21dece602c03776e9c8b6ccbf71"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATAdMobDSPAdapter.zip",
            checksum: "e42567fe0e5a0d81d754318178a07bb4b7a1d18631422e69ec6e96595b95b8b6"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATSuperAwesomeAdapter.zip",
            checksum: "0a0b4ee76d7099bd1dd56327cb4652879e452dca21c91a36b9b32e9ac4ea1b7a"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATGoogleAdsAdapter.zip",
            checksum: "911f60b0b8ffdd606bafc7fa8a240f770c9ba7d6e75b474d6fb769b88b46cf41"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATDisplayIOAdapter.zip",
            checksum: "18cc487567dc66fc6349f710986a28e55b2404be77d78518a01a044013209824"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATPubNativeAdapter.zip",
            checksum: "ff5ca18a5ca720b2e3be4826fd94bd4f2e674c434e96c3264914aa911f151159"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATMetaBiddingAdapter.zip",
            checksum: "d3caa58883192c850a82e259f11993012ce8ab231a26c0d3fd9b96d761da1b0a"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATVungleAdapter.zip",
            checksum: "ea75700f214c7086b3b7b6b2c1bdcbcec64166003a4496cb6edfdc5e5cd324c6"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATFacebookAdapter.zip",
            checksum: "9337cddc62fb1d0b97ded925ac200d532d7178d940482e72a85171a7b855714a"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATFeedAdAdapter.zip",
            checksum: "67e46d9de3359363df35786dfffcd7b2746f0a801bbdfafc9c6394f45e25ec4b"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATMintegralAdapter.zip",
            checksum: "6fd7fa1b7942641f9ed9f8cca19af3f1bdaab1a2b31a934c02d2fda9e2f19518"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATKidozAdapter.zip",
            checksum: "3fa673d5d43b65a487a46490194e4b458f1cee5b62e3e6215c5177756411eb75"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATGoogleCMPAdapter.zip",
            checksum: "06d194ed76c0f0a5fb5f699a39bc94237cdf6f741c6053e79cde8d13c434f7b4"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATAppConsentAdapter.zip",
            checksum: "291405cd2a12196bb74cfd037b3ffbbc9f830cae7ce6a0d6f312fd705380bf50"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATMolocoBiddingDSPAdapter.zip",
            checksum: "bbe576e6fda45789fa3f49d89fb8712fba2f9eb51101cd850f6ba974780d224e"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATAdMobMediationAdapter.zip",
            checksum: "b30eb7cdf1ca192ec6762f34d4c33335fb8f3e59c14941d87701b7d79f81c96a"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATInMobiAdapter.zip",
            checksum: "70d8949f5d94550d55a0794dc7638c719dc787a4a995d0dcfa42c7c168cea7f9"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATOguryAdapter.zip",
            checksum: "357c3644eee230215d9114b8b5edff9f2f998a11f7cbf1e2fd9f4a33efdde7e7"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATUTIQAdapter.zip",
            checksum: "cfac1b0106509076abe4bb8a21ab5575789078ce9cabd3e6936ed364b911860b"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATYOCAdapter.zip",
            checksum: "d949c9857ff3fe7bc6e67b431a6c6f4e4501a1d9e1bb0ecbd34f6ffa08bf5786"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATKit.zip",
            checksum: "8b933672d0091fe5befc6d9970c166c1ea01b0e8871a7f601e59a900933d9397"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATTappxAdapter.zip",
            checksum: "200f932e5d44afaa267868f16deb028d176c124c86639e79ad6bbad4c2962e6a"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATAppLovinAdapter.zip",
            checksum: "1a157f4e338a012d15d60a6aa46704ac3068c8f8474a1cea50fb6e1ec09a8ebe"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATAppHarbrAdapter.zip",
            checksum: "d349286299c43211f0508a58073558405d714dc279e90dc78a02a181bfd04a76"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AATTeadsAdapter.zip",
            checksum: "39cb2b9cf43d79552580b3c1e1ba0ee08d0cddd8c420de23187de64a1255591d"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AppConsent.zip",
            checksum: "411e724b8dd6593b6c18be6cef1cb1af7ef5fcd8f4a11025b156e4bb8dd032cf"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/UnityAds.zip",
            checksum: "e2eab9b468cc74101befb3b1f7bc7e335eca9cd7e4000d28007b95032406025d"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/OguryCore.zip",
            checksum: "6b84b9e9a3d54daa45443cd461659acf8f87cf17ec261312e1f001ce93234f56"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/OMSDK_Ogury.zip",
            checksum: "2a6dda12633dfdf589cb0e789d19c5ee46cde4ea1d0039d8e5be261bd1410675"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/OguryAds.zip",
            checksum: "e318da9211dabbbee9f0c037518d31b7ced6ea822351e6828d82e722bf7cd193"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/InMobiSDK.zip",
            checksum: "0be06afb400fedd9e8b835e7b28cb8f1cb4e264b2c7ffac4c38e704f3771d735"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/TeadsSDK.zip",
            checksum: "1344f97042b8a48d9315494c5bd6decbb70fece082e911de5413a9ce201cfb5a"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/OMSDK_Teadstv.zip",
            checksum: "84ef0e6e365096c787b850df71f718bfaf5ed6617a5bad6be7da4bb34740ac47"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/OgurySdk.zip",
            checksum: "465b3cfd046f3bd0b2deedae9054a89f9ef3b3d55da23bb74278c22a80c56554"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/FBAudienceNetwork.zip",
            checksum: "469b4cd97c72041ec0a730d0114af5c256df8c46b6f2f80b417c96478902ec20"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/TappxFramework.zip",
            checksum: "9cb98affbfed3480d7bab83d8c4ed9d9aa1130b2211ca178f991c00bf38fc1ee"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/OMSDK_Tappx.zip",
            checksum: "a617f07dc14da73dbde0ae2c8139208ae4b3f5d24947e1ee2284b584256865c2"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/VungleAdsSDK.zip",
            checksum: "f347a9d4d042e2d65808a85d41ec15af7e8cb83bb1569b8b14967b0f57e8f6b0"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/IronSourceAdQualitySDK.zip",
            checksum: "97185266454590a5dab501fe053eeb3b4708105d76b5effe919701bcc3cc885e"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/DTBiOSSDK.zip",
            checksum: "23b8629317815c0a1238a25a56be9c2dd6e6f90b21961f0595049c3754ec62d8"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/KidozSDK.zip",
            checksum: "c02b13befdf667d058b06db9adf56d3a34eac42ffeaccf8818fddc3426f76984"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/FeedAd.zip",
            checksum: "f3ee7542665944e664aaef143228eecce5f6db176d6e3b787704c18cc9ade503"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/MTGSDKInterstitialVideo.zip",
            checksum: "e65ef9c614772a3f261357b3bd37142cbf2f4adbce81f78d418443aa149faecd"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/MTGSDKBanner.zip",
            checksum: "92501b8bde331713d29bcfee794aa1f436c9b1a28d492a8772669054b0ee8f1a"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/MTGSDKBidding.zip",
            checksum: "0345a87f50458d9a1c4ded30ab6c083289f2ee58c38991c4d585d567046774db"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/MTGSDKReward.zip",
            checksum: "20b2c7df33bdb649756b7561cef2dffc8aaebb44d171e392dcd28ad4a1ff5d16"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/MTGSDKNativeAdvanced.zip",
            checksum: "5b12f71731c9737d6dac6b28ee349b0d37826edcc8ff8f7a1dc3e3b9a8215623"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/MTGSDKSplash.zip",
            checksum: "9bf8241032c7ef41c5e07421a13c021c690a35de791eeed3ce6bc8e144a09339"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/MTGSDKNewInterstitial.zip",
            checksum: "665d67056c59c80d2a8582cc1506a03cd2bf2d68320e6d4cfb7237deddbb6ec4"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/MTGSDK.zip",
            checksum: "39522278a10c701b618e74b3a2accf540ab4abd85dd9119ea4831ae34c36c44f"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/IronSource.zip",
            checksum: "2085e7e0d471f89b51ca90f3c6684fb78d72f2bb67869650029ba5baa18f9f04"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/MolocoSDK.zip",
            checksum: "d09110e43eeb2b202b0b70d6fda4fd9f187cb7518e587602aef3527526461d65"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/OMSDK_Microsoft.zip",
            checksum: "849af947286f3588a27eba44f3d1835fd74f8cc9dcae3fe7e7b612bed926c59f"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/AppNexusSDK.zip",
            checksum: "6faae093a17dee58a8e21c5ceb2c5357ed2542e8a7ff33b8f51b7f1b62e598a0"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta10/SASDisplayKit.zip",
            checksum: "6ef8e042a496de9c5f1116c26c8a417fe20ef006ddf2bde9e43cb3bf0c79f150"
        ),
    ]
)
