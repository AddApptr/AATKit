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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATAmazonAdapter.zip",
            checksum: "ed6a13f557b0d06eeec8b31b958c96f19ea187f76124755930219cceee8fa04f"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATUnityAdapter.zip",
            checksum: "7312c371d389e924c16bf86131a9e03a5b5ed76a18217dac5cdcd78ddbf98ac0"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATAppNexusAdapter.zip",
            checksum: "98199317b3ec7a35383269f6cb706b699f560e6e23e72211858c70328f2fda15"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATSmartAdAdapter.zip",
            checksum: "ca70f9d91b5e5232d33925b5c5f72ff578ff9d162720eb60a62427ce710d6c25"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATIronSourceAdapter.zip",
            checksum: "7b5aa2f9c4b8c18b4b1fd5102d6dfba47ee4d04353a499deaf62c46cec991ab1"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATDFPPrebidAdapter.zip",
            checksum: "5650b89816fe25ebea0cc96a99c0e2d09d032cebb47f5b896889658185c535bf"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATGraviteRTBAdapter.zip",
            checksum: "79823c9dd65995a653ef3db10d60e385b04d6d0f02847d71eb971d9e92ecc7df"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/DIOSDK.zip",
            checksum: "9c73730949ecb10c2da12d88d52861854a7571f72f57ed376a5045aa3b702a44"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/HyBid.zip",
            checksum: "77da7c4dcc24b842fa590216909535a7b7690ee84afcb4aa90c35d97273f04d1"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/OMSDK_Pubnativenet.zip",
            checksum: "727bc37917cc0cc3336d1c4b281832df9ed8d0f3c91e29347fe46a009df6e74d"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/ATOM.zip",
            checksum: "8536d60b139731c6a8e5d1255a13f35385bc434aabbfd5994e38a008f3090c4c"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/Utiq.zip",
            checksum: "35d7904c24667b686aef31b9e4da998063fe70553192c405b1e913980f651d11"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/ConsentViewController.zip",
            checksum: "f375241e00aaea09011afdbd8831f01285f6005cd3887111ff1693cdacac9fd6"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/VisxSDK.zip",
            checksum: "781efc1e2abb03922234ed417b665d447500eeac83ef621de9e37eb46d3092a6"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/OMSDK_Prebidorg.zip",
            checksum: "0e37ecd4878fc6135060b2a7737c850441a94477e29192b32310d1633d5ef4a2"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/PrebidMobile.zip",
            checksum: "b2ea8579289360de53763a1a46003e63bdccf448f8252b173d63306909fbd2f8"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATSourcePointCMPAdapter.zip",
            checksum: "ee2be830bd1657432d7400a4031e679cc6a45754001e48d190a17866e5a343ff"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATAdMobDSPAdapter.zip",
            checksum: "8f4f225be5b1ab4911350af8feeac327483961c2a90d638fff5b95ddcca8589b"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATSuperAwesomeAdapter.zip",
            checksum: "eba17587344b0973a906fb2a92ff1218f36f6d4011d31e66e9f2529683ca5d35"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATGoogleAdsAdapter.zip",
            checksum: "317db2504467922e29906f926f3af6dcab1e513bf8ff30a686c538c5c4cb3676"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATDisplayIOAdapter.zip",
            checksum: "cd1c2024b3915fe122ee80d31ada55c2ba96764b2b1fbbff3e6a06ce13efd90e"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATPubNativeAdapter.zip",
            checksum: "a5353fb5755572a6fc5c45dba102cfe84a9f3012dc9854977b4f3250563b0ee4"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATMetaBiddingAdapter.zip",
            checksum: "1056678f46603526796623ca7d96228a91e86966982a26e1e5d370817c06ce01"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATVungleAdapter.zip",
            checksum: "5c15f56891943a060df6afd971b645d5d577a6de07179ed4c98da318bc9f3f51"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATFacebookAdapter.zip",
            checksum: "bc0bea6f0c3cde024fff521cd0e3e96278460a0d6925db3b8f4ce78b6c87600d"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATFeedAdAdapter.zip",
            checksum: "a74263af36ca0c1c87d43427cd012a939225f60f4a324cb1a877e3c9c234271a"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATMintegralAdapter.zip",
            checksum: "3675ed223fa8a70d1f8cc3d62fec2bca6034f836f464be3b0cea995667e2398b"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATKidozAdapter.zip",
            checksum: "0c38102cf5adc48dc98aae7899f8b6d50d47d81c593ac51ca8fb6eb944f09f9c"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATGoogleCMPAdapter.zip",
            checksum: "0e389f4c269aeca829e76fce2add9d3faa70eaf703e727784c3bb742b7184f8a"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATAppConsentAdapter.zip",
            checksum: "0bc15522cef5a63c20b52b606a0e9d6c0f26a93618777f0bc80f61735d99b1b4"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATMolocoBiddingDSPAdapter.zip",
            checksum: "42560bc70733d4b773445842687ec78d2ee494c84cf518cccd726e298600fa64"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATAdMobMediationAdapter.zip",
            checksum: "be5ee3ffd9a80a5efc23dc1ee2f8b13dd9a83b94e0e4b844816378c51041cc18"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATInMobiAdapter.zip",
            checksum: "d0aa00da6012048e28db643313ca96584cbb5ebeddcf82b5ba5ba120b2e30e2c"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATOguryAdapter.zip",
            checksum: "0ece473727d53ffe3dff79b98c6ba0c42460c8c185aca71eb04fbb5d6fe99abe"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATUTIQAdapter.zip",
            checksum: "214ec32ac5ffa6bf6776f02939905f5f7087ea744d2defbbc8ee83ea16b3494f"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATYOCAdapter.zip",
            checksum: "b8c5415794a0266202dbf5e3bb0d89d59f23c8d2cb85b638745c9a58263995d4"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATKit.zip",
            checksum: "d0c8e63ef9a9522ee3bf111efb7442d7b332ff95e05b8df6eaed0e1464b5e886"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATTappxAdapter.zip",
            checksum: "3088524e58ae547cab074dacca549b918cb3267fa4935a70a39ebdad2ad5e623"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATAppLovinAdapter.zip",
            checksum: "a15fc56a37f31d67d58d747fcfbf318d0a4d2c822e90456468f971b246600e93"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATAppHarbrAdapter.zip",
            checksum: "1eb10bde925ea7c1133b42b28c72ae694935e54fe023d1a15aa5d5f0d15260a4"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AATTeadsAdapter.zip",
            checksum: "6ffe9144f79ddeeb476f99bf14546e3081d9ae621a604d4fb50355f2d7a675e6"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AppConsent.zip",
            checksum: "85ee6957ec94346bfb445fdbb2c94269f5a3d24cc1eee531967ae03a1154fff5"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/UnityAds.zip",
            checksum: "a901cf2edfaedf0884a962cbf87f1cead761ebd441e6d8c80aeebc30e586f944"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/OguryCore.zip",
            checksum: "7d08925d74608316bc7b7ac75f36d22ba37f113e7cbfb1f144f5765f7dd88b8f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/OMSDK_Ogury.zip",
            checksum: "04d87d2ce8dedc05b737ae0e18944853cc616e7a3942b5f92eda4c5040c663b7"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/OguryAds.zip",
            checksum: "4ff7486fdbbe0dc076772a70540cd587cf796c2e071447bf49c1a22bf3831e15"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/InMobiSDK.zip",
            checksum: "88143500af495e2be4d57dd022318c258ed70d9f9e7cc7308e6bcc230dd1cef8"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/TeadsSDK.zip",
            checksum: "8f9b6e7c7d5587e60aceba4ffaebdae10d55ae122286e0919b9b265f10c33015"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/OMSDK_Teadstv.zip",
            checksum: "c03c5d41abff5b0e295e66936b33490bdcb649726698e3e5e645ddf4b1b97660"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/OgurySdk.zip",
            checksum: "36259d51996e0514c2405edf676edda4eb62882eb86b8a53b99d5a82539872f2"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/FBAudienceNetwork.zip",
            checksum: "e4ca8a251e2386c751e7bfb31ff663c67ac702309bb99062ce513ffddc2a4dba"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/TappxFramework.zip",
            checksum: "fcf0aececbbb939e973e8da98b768fc5bc85e033d4acf175507689c0a16db6ca"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/OMSDK_Tappx.zip",
            checksum: "950e42bb1e8b71d44b9f53fd014f8be4048b6de23b76b9394c8579491315d283"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/VungleAdsSDK.zip",
            checksum: "2550bffad0709fd9ada4b0a39047a1426f9a6fa71244d72f3d53bfd3efdf134c"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/IronSourceAdQualitySDK.zip",
            checksum: "a29f4ff5b92af31a63ba7d39f00f3bcb06395fe8cc501b62c59c53f9066431de"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/DTBiOSSDK.zip",
            checksum: "01c076c2afce8e5e21de92c4a90a30482069dbf07c1db459447df3e0888bb0e6"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/KidozSDK.zip",
            checksum: "b79cb7e0591d3cc0304e16d5cc196b13bcfc1a7cfaa7178ed5afe531e732c76c"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/FeedAd.zip",
            checksum: "c21db3e87dd7b2d80484f57da3e6921fcfabff08e2d549ff82e5eefe94d1eabf"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/MTGSDKInterstitialVideo.zip",
            checksum: "126469be57a7af50611a123c3c1617d0f0f1c4061567779fbe27337edb2605ce"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/MTGSDKBanner.zip",
            checksum: "d0a26884cc283015127fbd2a0dd66d9898cba2181f0887d31fdfa9a78099e587"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/MTGSDKBidding.zip",
            checksum: "cb235d6945d4e6abe858e12544cdd4a862fd01f5fece14ec495850e861e484e9"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/MTGSDKReward.zip",
            checksum: "9b8a68e965d72cd69c5a995bc4d15f5d9078204c329911fe3432b0dc55595a26"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/MTGSDKNativeAdvanced.zip",
            checksum: "b08ee39372cccdac26478f05cf4e642efee7bce81946d398c2c8bbddf8fd757e"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/MTGSDKSplash.zip",
            checksum: "7e400460f490b1a632a36d522ae164a33c19308c28fc02b0515353d262a48c5d"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/MTGSDKNewInterstitial.zip",
            checksum: "b4242b0ae25a565ed4eaa371afcca2b45c2ee9543ba5df31068a8ae1faa0e98d"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/MTGSDK.zip",
            checksum: "8a603a64e3eaac4a5f99820487e75a0081b90be256303f741a35e09ffe42ab27"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/IronSource.zip",
            checksum: "e2cd8d0c1e4b1f34cc1f9f48fdd5a63a117b821ef8b33e77cde38c196369b6f9"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/MolocoSDK.zip",
            checksum: "de4c17242f448b83f8d1e9057531d524d49b3582dcd08b402d929ba82d4ed6c8"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/AppNexusSDK.zip",
            checksum: "59e1492662e2e87e973d4ea1435a655ebb7b9cb27c22b12f0f8b8beea832020b"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta6/SASDisplayKit.zip",
            checksum: "1cb967e6f16db5a6440a7e8a79f3e7a8b49491dc9a4282271ef36c06cf9789b9"
        ),
    ]
)
