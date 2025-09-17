// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "3.14.1"
let package = Package(
    name: "AATKit",
    platforms: [.iOS(.v12)],
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
                                                   "AATKit-AATMetaBiddingAdapter"
                                                  ]),

    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: Version(13, 3, 1)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: Version(12, 7, 0)),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", exact: Version(1, 24, 1)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(url: "https://github.com/AddApptr/RTBSPM.git", exact: Version(1, 8, 0))
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
                        .product(name: "RTBSPM", package: "RTBSPM"),
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
                    dependencies: ["AATPrebidMobile", "AATDFPPrebidAdapter"],
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAmazonAdapter.zip",
            checksum: "0fd2e885c3ca4292b1d7aea5a6ddc1a506460665e36b769ea87ca94d2070e98a"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATUnityAdapter.zip",
            checksum: "6e62dcb7abe2a367f50f02d0fac8dc37f4046397471f3c03ce7fca84e6da08fe"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAppNexusAdapter.zip",
            checksum: "de7575b7fa8e18773082be9374228713ee3bb7a5e0f53e11dc6afb97104e67bb"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATSmartAdAdapter.zip",
            checksum: "e252a0e7d86b7e1c1bb2499c419766af2b8a48dcead643da48c79d0a9d3e95d0"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATIronSourceAdapter.zip",
            checksum: "58513e876b321b7fc38063ae52cbbbf8cf6dbc9b195b7c4695fb9175016eac30"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATDFPPrebidAdapter.zip",
            checksum: "309d088194a9bb52369ebfea3b6fec65307748cc4a0b9c2c8ae33b72b51dd21e"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATGraviteRTBAdapter.zip",
            checksum: "ee2ff89bfe2323612f59d476cba12dd8be1df2b2ed71e049ec00737d7fc6ca36"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/DIOSDK.zip",
            checksum: "76cffd454191e066414d5658ed2518543a7efce7271f3281f1795ad866393550"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/ConsentViewController.zip",
            checksum: "fdfc17f59c786666825cffb4f6674287face3ea512b957ec35eb2ec534f5c917"
        ),
        .binaryTarget(
            name: "AATSPMobileCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/SPMobileCore.zip",
            checksum: "f51c0579624c6d24f8bab5f388c5924d7886201b8ba46af476be696300f15728"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/HyBid.zip",
            checksum: "cdb3a8c547d93924b2cdb99ca10caea7489369ba524963b1f98ed4c53245fe00"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OMSDK_Pubnativenet.zip",
            checksum: "b91c67e52558dc967c728a2a9bb013b90dcd4baedc28d0306342a484758f7a08"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/ATOM.zip",
            checksum: "c9cee8557aa41e099d51fd18b6e80d1b5298f0b718813777e34a134ade20785c"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/VisxSDK.zip",
            checksum: "2bd6738e3c640f63d1708885e637adec6f29c6bac84bc6197dcc2d754e0591ca"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/Utiq.zip",
            checksum: "8450d84c03bfb2ca50d054569058465708c7fdc985ebbe36bfb614c69a2922cc"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/PrebidMobile.zip",
            checksum: "13c8928f15cffe6cb45e5932079d372af8f32f55f683c35088dac99b3ecc9b2b"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATSourcePointCMPAdapter.zip",
            checksum: "49f60d8739525d657b1ecb8d15fa277a236e4dc3f75dba150b174102fea611d3"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAdMobDSPAdapter.zip",
            checksum: "11b1ad1bae29de58143a1bf655a6ab6c22f8418ccf63acf03fe6fa7516d4a0e8"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATSuperAwesomeAdapter.zip",
            checksum: "31273a9a380293a6b474e9e200134b1a9311b16f765447db7cb0aeb95fb18e57"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATGoogleAdsAdapter.zip",
            checksum: "64c70d4d971580aa38f8b7459ab31a3ac4caa6667909de577f85de466f769a35"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATDisplayIOAdapter.zip",
            checksum: "ab20c71ea8f633d86ac4b224111f99747283c0752da07e2bfa37318e4fe77b2e"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATPubNativeAdapter.zip",
            checksum: "3918549344e111e2085a04ac3af60bb283758d011f38475e6d429cf93ef56f22"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATMetaBiddingAdapter.zip",
            checksum: "92ed5ac8853c78b35dfb7381c0b8295c24fd394d0f0daab319c167a7c3af2108"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATVungleAdapter.zip",
            checksum: "f034eb6e959ba30f7b597382880a7eb9d7433d99f160a1afe1e94866cd0b5541"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATFacebookAdapter.zip",
            checksum: "bc4fdeaf70b639628bb34734d9caafdfb5229c975d2e87a4dc800730728b0cb8"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATFeedAdAdapter.zip",
            checksum: "48343e3a96e69643329868fbbbc2de94b5936751755f902e5bfe4a96bc1ddd59"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATMintegralAdapter.zip",
            checksum: "8e83bfcfad691f851e71d2c250e1b5638f306f06c33c5625e886c9277d9b0824"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATKidozAdapter.zip",
            checksum: "c6272b67b09c8a3d3281677a46781396ac0f6fc848fbbb6a117991a1f86beedf"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATGoogleCMPAdapter.zip",
            checksum: "e31f5beb244cbc228a72b5931cbc1bdd2f09e7583722006c79a0b2d98ab2130e"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAppConsentAdapter.zip",
            checksum: "210e89c5c7416e9d61c091b9578bd80233f90d70c3e5ddfc19bbbf674348ead7"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAdMobMediationAdapter.zip",
            checksum: "9f92d06a24412e7a9b7d4335bf9b107747cea6197136cd284cc01d34c6d1ddab"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATInMobiAdapter.zip",
            checksum: "12187869c3c15a8d5669f969177ee3f11f4ee2fe19f79feab842ad3a6fb4e24a"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATOguryAdapter.zip",
            checksum: "af97d11b82ac936e01965aa78d2e3664891ae9a0cbed5a07fbb5dbce090ef718"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATUTIQAdapter.zip",
            checksum: "3e4a070bb2572441dc34f3aa62caaeea5cf31fe51ec5c2044374ece1612ac539"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATYOCAdapter.zip",
            checksum: "33c6ae15a88e3b0becca45578263411d12156ff822a7793bbbee6a8487899d17"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATKit.zip",
            checksum: "a84ebd01fbd27d4274ddd66ae5b64975f0681ef66a4203ea0fb299d73bb9215e"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATTappxAdapter.zip",
            checksum: "368711a2dcc1ad787bbc2a6d392ddbaa7ed91532b633d5f04414d0c03790cade"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAppLovinAdapter.zip",
            checksum: "10f9f31278d85f31458b0d9fdc4a37122fd0b88e800d91aa9f9ed14270d61f32"
        ),
        .binaryTarget(
            name: "AATCriteoAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATCriteoAdapter.zip",
            checksum: "4d3e46696bc7f5107c0b4a32afebb3a208dfabe349fe4b1ace8c2c57844d00ff"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATAppHarbrAdapter.zip",
            checksum: "4c88a61a9606587b327ac925d80a7d7e5000de1bb10cc6b04c411c0c86c37697"
        ),
        .binaryTarget(
            name: "AATSmaatoAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATSmaatoAdapter.zip",
            checksum: "51ae3d020400bb5bb4f6e70f8be0ef150a48a9d9d0108454c91211961c6c7bf4"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AATTeadsAdapter.zip",
            checksum: "d54523a2411b3a6a3aca2caf1dad449ef7fd13e5aa6dacc967b746f7e5bf6671"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AppConsent.zip",
            checksum: "c76dcb59365fb4a3a474195f6eee2838006c65ac86bd6173ee640807118a1cad"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/UnityAds.zip",
            checksum: "adca80cb428aa4105d25971bddf8910c7a7c1c96a9f7905d4e1e078fad412c39"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OguryCore.zip",
            checksum: "014cda7b72ffed6842dfe35368fa9b4f8170c94cb758823e0c01e3c92c758bc7"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OMSDK_Ogury.zip",
            checksum: "4c1c640a6967cd062ac556cb34a8a6876eed3a63e62dd9f5e0a941ba1682c66b"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OguryAds.zip",
            checksum: "fc7239e9c306a9ecf3c33beb2520d9ace0509b439bfe8b42d39d96303e9fcf26"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/InMobiSDK.zip",
            checksum: "4439adb7e733827629cd7125deba7ffd32e611e4d7de654d4604afb209148e41"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/TeadsSDK.zip",
            checksum: "bad0318bcdc90ed18f9f20f50d332537643c4105231144bd43e199bcb0b59177"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OMSDK_Teadstv.zip",
            checksum: "a44bf2ef5503c361266620f77c17fd4fa87a74b0258bcc04fcc6a00b8b743454"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OgurySdk.zip",
            checksum: "6db3c56c0dfb88ec2324519222aa2948381da678b714a2f0c70479c2d21d77e9"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/FBAudienceNetwork.zip",
            checksum: "face8f553d985deefaab1c16ba603a77d73ec4ca9c373f97afd7edc52e87ac00"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/TappxFramework.zip",
            checksum: "0fc292259639800fa8efd5ae87182dd44edaabfa8fba9d3282ca77eb6437e349"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/OMSDK_Tappx.zip",
            checksum: "1d24f07eccd5f5830e0c64ce27a73fabbbf7fc1416e5dd53b29b9ab55ed3995f"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/VungleAdsSDK.zip",
            checksum: "1333ff9f2699976e0c3d1708f4231246bed9a4be48a5d5f894eb454806cb3a7e"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/IronSourceAdQualitySDK.zip",
            checksum: "3255f120b3ba1d0677e3414bbcc5fb047bd58c0b35d55eef674cf31c961dd75d"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/DTBiOSSDK.zip",
            checksum: "3ba78a745fcb69a1b56587127de636f8d1d598c318b7a5df57a886cd4028886f"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/KidozSDK.zip",
            checksum: "a5ac1578768ee504f5384804e6c0a038fdd5ce9d3b353c1dad966eb39d23c35d"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/FeedAd.zip",
            checksum: "0853dbf97288d9969dba10de86189902c6c500dd1d9b6a69b68593bd5e1ae381"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKInterstitialVideo.zip",
            checksum: "f33f797dd1094326771e9296c9af8ea53cc88d87bccdbb8133e8aff22c9dfa2d"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKBanner.zip",
            checksum: "84488ba3103dbd886e50c86a842ece24583094954be366282b0f3e9b7ffde437"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKBidding.zip",
            checksum: "9118ad17fa0cdba5fd97492a1b7975cba22d7d0bbbbeccfa662e5e79614cd5e0"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKReward.zip",
            checksum: "fc72dbb5dcad2021e20c11a2e9189ed276c80b9a2768b5efa22b035c9da9b3b8"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKNativeAdvanced.zip",
            checksum: "be954475a0638f05bf1b47b172f66e60b32f7e3d3452442c621dcb9570622aad"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKSplash.zip",
            checksum: "636e98555ad4a07b1b3e7b3332f9caf44023967257e2f2c6587e37c02a844a7d"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDKNewInterstitial.zip",
            checksum: "98199f9932a1af9cfa946db33053a65c2da54ae0eb09105728056b1a67e80c52"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MTGSDK.zip",
            checksum: "32bf4b12cbde37614f0b56bc75b461c253118be7624a0efb988f44357b786350"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/IronSource.zip",
            checksum: "f40d449356536829153fa515387aad983bb99a0eaec9342d262c0fa7c48bbac9"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/MolocoSDK.zip",
            checksum: "3dc8053629f2108cad6594e1d76a4d1ba8ca0f695044b2b7512b0ecd581fa9f1"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/AppNexusSDK.zip",
            checksum: "d51b0e39cbf68ae77917a6ed173756b2741af8898e7ce1372c179adc1fd18ad8"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.1/SASDisplayKit.zip",
            checksum: "4491963b6d0410cdbf86d459fdd53a483944c031e632262d904c122fa0e40139"
        ),
    ]
)
