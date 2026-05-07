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
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .upToNextMinor(from: "13.3.0")),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", .upToNextMinor(from: "1.27.0")),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(url: "https://github.com/AddApptr/RTBSDK.git", .upToNextMinor(from: "1.9.6"))
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATAmazonAdapter.zip",
            checksum: "d8b8c1d6f05ad6320aa63e267f02f09fe040ffcf6a7e83c27e5078f91996e827"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATUnityAdapter.zip",
            checksum: "cd0f8dfe52f14f2d0fe46adf5e2569ba317779daeead999e430063e83569212d"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATAppNexusAdapter.zip",
            checksum: "b88e0952d727546de3061b03672b98c19e93022336e7d60cf8dd2951d292084c"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATSmartAdAdapter.zip",
            checksum: "4210ff2106a82e86f5daf643d230c2b359604e2d898735878d90bd7faff280f3"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATIronSourceAdapter.zip",
            checksum: "217a0d3758706608f12a755f869a15200da80e71952f62e7a56cd5d328c28f98"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATDFPPrebidAdapter.zip",
            checksum: "d857dfe3ae0f0d0579c1f0597574cb6807472e1a3173ba20b7379bb798ade46a"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATGraviteRTBAdapter.zip",
            checksum: "ab5cfc67b0ef208de9de09e832bb5f04f92546fdd9abc0ecb8ffa28d3ccb8d21"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/DIOSDK.zip",
            checksum: "c818f35437be3a4a23da8236f690921c3ec1e6b00e90ec876c3e87b314f9471b"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/HyBid.zip",
            checksum: "cc70f1e63fe4de635ec36a3ba084ce57d4c62336f44965cff8e5c4ce61af010f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/OMSDK_Pubnativenet.zip",
            checksum: "9f17acf7cdfaf663e74aacfe375254cd32fcb26379cb941ba2896b2a7255e1fe"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/ATOM.zip",
            checksum: "2a1fc78aab797c0e84fc685f707160987b3cd4d823684896708eaf697456b54b"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/Utiq.zip",
            checksum: "fafbf4d27f5dd3d073154f04a4b4808eecb64fdfd556f8ddd08374cd93bc48b4"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/ConsentViewController.zip",
            checksum: "732d11b8dad9cc9098e4af88e5023d672389a5c0f67b0ad971f727aa6354ade2"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/VisxSDK.zip",
            checksum: "f3277aab07b0c1062c28afcf03080ed829b4d58ece33f2ad55426a91a301821c"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/OMSDK_Prebidorg.zip",
            checksum: "99fda22f25f838ad0a0c644fa545052932df3b46311cb5a483ea27a2bffaf859"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/PrebidMobile.zip",
            checksum: "8c1fffd2ff10ad2e7dea37c541ba23e38848b6dea184928176aa2954aa7fe3eb"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATSourcePointCMPAdapter.zip",
            checksum: "a61691a521c3d8aae75ed802df8ba00347b7327b26f372fd340f6c252045cb85"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATAdMobDSPAdapter.zip",
            checksum: "0c2746cc1f5fe14f319b3562e0f1ae44fe362ea98304bda2fbe2b7c0813caee4"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATSuperAwesomeAdapter.zip",
            checksum: "313c0f33d5b5d01a2d40aa2f06404fe09e74fb98653b0ce2c6faf46c599517c0"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATGoogleAdsAdapter.zip",
            checksum: "d9a23cf4b8c2d181dae471312d4aa4ab7ae5033db07480beea8c7ae76a66696b"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATDisplayIOAdapter.zip",
            checksum: "bf4ced6603b1710d4fa9e71319d4129d8c801d23e39c13f34385982b1aee99b9"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATPubNativeAdapter.zip",
            checksum: "2e4f91c1a89d7cc8a8eb6bed7ca6fe444704c56af8a7c987d10892a40759c720"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATMetaBiddingAdapter.zip",
            checksum: "8d052ff6996a40c1dd10f2eb9b46f2ee0f741d45b114867c43e42281974c8a4e"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATVungleAdapter.zip",
            checksum: "56a7d437689aab421e826d2986c94a3197d5cea029a927682771fae61198dce2"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATFacebookAdapter.zip",
            checksum: "75c58f9cc7a54b41b25f6e65910b7031a71dfa157e508e3e928cdf982105d855"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATFeedAdAdapter.zip",
            checksum: "5d60ae4b0626fb4ba5e8742a87c0a22aa7b3216390a2b8cd48b5d756df06ea49"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATMintegralAdapter.zip",
            checksum: "b44c1e8368cd3cf70ad4449b1fa0978dda02041b2c79656627d52b4aa3535fdf"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATKidozAdapter.zip",
            checksum: "a94838cd139cdf6130212c070ae055c02574eb92e74bf2e35314800041c204a6"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATGoogleCMPAdapter.zip",
            checksum: "5c90b057f9d852a752cb5cae1b5f824eb1c0c10045491679d3ef4bb4e2bb3123"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATAppConsentAdapter.zip",
            checksum: "02b957d6d42fea946ba6b710faf720c39698e0a5af38557a4ea4cb0e244c8206"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATMolocoBiddingDSPAdapter.zip",
            checksum: "dd4498673adf46b3c5bc1d926dab8a887f95373a55f3cbb7b8b4466416aa5e69"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATAdMobMediationAdapter.zip",
            checksum: "3e01f72d5a9042ecf70172da3961e5647e383ab38f5f31a42fd1058f9647cd90"
        ),
        .binaryTarget(
            name: "AATVungleBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATVungleBiddingAdapter.zip",
            checksum: "a89d2afc519e5764dd7950d406ea987b716bd06a06cd08b7d1872a347239fae6"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATInMobiAdapter.zip",
            checksum: "ac0643dd5dbb5a4aa85f3dc434150683d309e9bdd9e66b9ae80e0867a3e7860a"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATOguryAdapter.zip",
            checksum: "a0a190d1642713e415637494a726910a4d20d9c3e0729b9b3351a02565ac2e37"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATUTIQAdapter.zip",
            checksum: "8b51ae134ff7adb5538f479932ac49e7b9ad5402ce104a780e13fb4de40cc0c1"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATYOCAdapter.zip",
            checksum: "dc3b048a01871bbddc4b038af22ea0ba4c64624e2dae7562a04da1db6a10647f"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATKit.zip",
            checksum: "eb20c73a75532d7597c96e1f6b4102a01c06e3740a7f4582d164b850d8f6890f"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATTappxAdapter.zip",
            checksum: "a580ade41f248cd4a4b087a885e228c590b32fc14d5bee683feb464670531c48"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATAppLovinAdapter.zip",
            checksum: "e9fcd3035bed61c6339182f3b4a8c803262d0d59209772043150429da2485d53"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATAppHarbrAdapter.zip",
            checksum: "8283fd2358641657d54672a9bc2a609d4622825dcf7a91c025981ed06fa05172"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AATTeadsAdapter.zip",
            checksum: "e9bfc3d1f6811d4be6ce401fbd0e8395e7f526b5e011474ce66688026e380d5b"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AppConsent.zip",
            checksum: "5a6e2b2072cfc3f83feeb2ed716c9a9743f1eab9a68055e441b1eb4607011442"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/UnityAds.zip",
            checksum: "92a45c668401bdfc33ecf7c6c1ff0d793d1d9206d9303eab90ef0b4a42ac9863"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/OguryCore.zip",
            checksum: "d7609107e7bc40cfee2ab9e6b313b53fa406690dc1e1708a040ee013b03a1464"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/OMSDK_Ogury.zip",
            checksum: "b0da283d123f4ca38469fb8f46ce2573e7b9bf5798162f24d65e5dc187df8c57"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/OguryAds.zip",
            checksum: "2dbf591c50e384c722b23e9960ba220f20741db2132e7eeac7668cb926380de8"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/InMobiSDK.zip",
            checksum: "35cdccf72d21dd47ae48a6f800ee9140d8e12dc0c8d6ea89ad8829bab05a2f56"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/TeadsSDK.zip",
            checksum: "54ae85eca163c003ae582caab696ab9af8b6d5855100d046cc020f6a239d8d7a"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/OMSDK_Teadstv.zip",
            checksum: "2f46bb397a02a4a5a3ac43eebc7903d395ae26fd892bdf33ed656ca2760869fd"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/OgurySdk.zip",
            checksum: "10742df8fda6218546ae44a3f425c239c1e99a5e0d3774edd7dab7800bfeb919"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/FBAudienceNetwork.zip",
            checksum: "51cae0340ec99846655841d41b9e12d13a4ea719436e058e48ad2cbe1e1824ca"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/TappxFramework.zip",
            checksum: "dea2058b6a5313e633c47d92c46936caf396cc628a65450340997fe269bbf545"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/OMSDK_Tappx.zip",
            checksum: "7d800250832bd50cd53410e2ebb37d91eb60080c285e5bb35e588912d63fd08c"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/VungleAdsSDK.zip",
            checksum: "dda26f500856b97439319706d8eb5d4da03349e8c28cf7ef4378744ba17ac655"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/IronSourceAdQualitySDK.zip",
            checksum: "183cfd04419919862efaa05efd25457c91272849ada9e6989ecd940e5e064980"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/DTBiOSSDK.zip",
            checksum: "450a0cef33d68326529e7849a8bc8bf313d37c0a4ab64c3e96f765cb15ec9043"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/KidozSDK.zip",
            checksum: "8569ef29f56a9218e3f65fc91bb9fff05b60b5eca28b2b9825e19ec325d8487a"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/FeedAd.zip",
            checksum: "d09be7ed37b178d283cffbda1ad7f658ff34fdf6a72827c69b7ed750e481160b"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/MTGSDKInterstitialVideo.zip",
            checksum: "78870d7b0ef0ebcb5036b7fb4bef295dbd582f7ab6d999cf0ab7794e7d09a548"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/MTGSDKBanner.zip",
            checksum: "677dc6f4ae5366a4dd253966cbee2b3ceee1b3c2c5accac944f5b1c60548cd0f"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/MTGSDKBidding.zip",
            checksum: "9f1f05d459b9ba70324d80fa58feb71cda67ee03afaebf9cbf5c3c1db3d3e4a4"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/MTGSDKReward.zip",
            checksum: "7eca96b4322fe30572987aa8611b71a43fcad432f630bf53439d0283526cd7dd"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/MTGSDKNativeAdvanced.zip",
            checksum: "78c7b7a9406f182b1f38751f78e86eb3312883842767ef59240e0a18c1d029e2"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/MTGSDKSplash.zip",
            checksum: "9e4255a3593c2fccc6099c3e191d31b06889cd831d4bd5d09335fe1230f8e294"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/MTGSDKNewInterstitial.zip",
            checksum: "6c5fa421b6cd20c20a596a552d0a0006b1c95ff7483086a81f86d06d392bb80d"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/MTGSDK.zip",
            checksum: "da0ec8ed00d09a67b4cd29b76a3137f71903c2098311f4eac2d4f32da386b639"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/IronSource.zip",
            checksum: "eabcd03bc32514639526aa027c248631c530aa6579a6bcc5dbbbd10739badd8f"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/MolocoSDK.zip",
            checksum: "c52a2e8ce1a60c5525c53b5131c8d2ff348c6e68bbb2dc7ef6558a41da72a7ed"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/OMSDK_Microsoft.zip",
            checksum: "8ed8bc28b4b6f44bafa55f92afcc9dc95c61f4e43cfbb50ac67cacf95c6ce224"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/AppNexusSDK.zip",
            checksum: "eb054d7d4d08062454d07000a5727acc3d14d947cf1881e9ae1c3e86671cdad6"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.3/SASDisplayKit.zip",
            checksum: "b70ac643de35a2f33cf05808c8185774c30f35498a99eb46e9da067140f69b46"
        ),
    ]
)
