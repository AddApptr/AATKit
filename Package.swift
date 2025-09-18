// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATAmazonAdapter.zip",
            checksum: "0fd2e885c3ca4292b1d7aea5a6ddc1a506460665e36b769ea87ca94d2070e98a"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATUnityAdapter.zip",
            checksum: "6e62dcb7abe2a367f50f02d0fac8dc37f4046397471f3c03ce7fca84e6da08fe"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATAppNexusAdapter.zip",
            checksum: "de7575b7fa8e18773082be9374228713ee3bb7a5e0f53e11dc6afb97104e67bb"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATSmartAdAdapter.zip",
            checksum: "e252a0e7d86b7e1c1bb2499c419766af2b8a48dcead643da48c79d0a9d3e95d0"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATIronSourceAdapter.zip",
            checksum: "58513e876b321b7fc38063ae52cbbbf8cf6dbc9b195b7c4695fb9175016eac30"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATDFPPrebidAdapter.zip",
            checksum: "309d088194a9bb52369ebfea3b6fec65307748cc4a0b9c2c8ae33b72b51dd21e"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATGraviteRTBAdapter.zip",
            checksum: "ee2ff89bfe2323612f59d476cba12dd8be1df2b2ed71e049ec00737d7fc6ca36"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/DIOSDK.zip",
            checksum: "76cffd454191e066414d5658ed2518543a7efce7271f3281f1795ad866393550"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/ConsentViewController.zip",
            checksum: "fdfc17f59c786666825cffb4f6674287face3ea512b957ec35eb2ec534f5c917"
        ),
        .binaryTarget(
            name: "AATSPMobileCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/SPMobileCore.zip",
            checksum: "f51c0579624c6d24f8bab5f388c5924d7886201b8ba46af476be696300f15728"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/HyBid.zip",
            checksum: "cdb3a8c547d93924b2cdb99ca10caea7489369ba524963b1f98ed4c53245fe00"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/OMSDK_Pubnativenet.zip",
            checksum: "b91c67e52558dc967c728a2a9bb013b90dcd4baedc28d0306342a484758f7a08"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/ATOM.zip",
            checksum: "c9cee8557aa41e099d51fd18b6e80d1b5298f0b718813777e34a134ade20785c"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/VisxSDK.zip",
            checksum: "2bd6738e3c640f63d1708885e637adec6f29c6bac84bc6197dcc2d754e0591ca"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/Utiq.zip",
            checksum: "8450d84c03bfb2ca50d054569058465708c7fdc985ebbe36bfb614c69a2922cc"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/PrebidMobile.zip",
            checksum: "13c8928f15cffe6cb45e5932079d372af8f32f55f683c35088dac99b3ecc9b2b"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATSourcePointCMPAdapter.zip",
            checksum: "49f60d8739525d657b1ecb8d15fa277a236e4dc3f75dba150b174102fea611d3"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATAdMobDSPAdapter.zip",
            checksum: "11b1ad1bae29de58143a1bf655a6ab6c22f8418ccf63acf03fe6fa7516d4a0e8"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATSuperAwesomeAdapter.zip",
            checksum: "31273a9a380293a6b474e9e200134b1a9311b16f765447db7cb0aeb95fb18e57"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATGoogleAdsAdapter.zip",
            checksum: "64c70d4d971580aa38f8b7459ab31a3ac4caa6667909de577f85de466f769a35"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATDisplayIOAdapter.zip",
            checksum: "ab20c71ea8f633d86ac4b224111f99747283c0752da07e2bfa37318e4fe77b2e"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATPubNativeAdapter.zip",
            checksum: "3918549344e111e2085a04ac3af60bb283758d011f38475e6d429cf93ef56f22"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATMetaBiddingAdapter.zip",
            checksum: "92ed5ac8853c78b35dfb7381c0b8295c24fd394d0f0daab319c167a7c3af2108"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATVungleAdapter.zip",
            checksum: "f034eb6e959ba30f7b597382880a7eb9d7433d99f160a1afe1e94866cd0b5541"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATFacebookAdapter.zip",
            checksum: "bc4fdeaf70b639628bb34734d9caafdfb5229c975d2e87a4dc800730728b0cb8"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATFeedAdAdapter.zip",
            checksum: "48343e3a96e69643329868fbbbc2de94b5936751755f902e5bfe4a96bc1ddd59"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATMintegralAdapter.zip",
            checksum: "8e83bfcfad691f851e71d2c250e1b5638f306f06c33c5625e886c9277d9b0824"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATKidozAdapter.zip",
            checksum: "c6272b67b09c8a3d3281677a46781396ac0f6fc848fbbb6a117991a1f86beedf"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATGoogleCMPAdapter.zip",
            checksum: "e31f5beb244cbc228a72b5931cbc1bdd2f09e7583722006c79a0b2d98ab2130e"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATAppConsentAdapter.zip",
            checksum: "210e89c5c7416e9d61c091b9578bd80233f90d70c3e5ddfc19bbbf674348ead7"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATAdMobMediationAdapter.zip",
            checksum: "9f92d06a24412e7a9b7d4335bf9b107747cea6197136cd284cc01d34c6d1ddab"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATInMobiAdapter.zip",
            checksum: "12187869c3c15a8d5669f969177ee3f11f4ee2fe19f79feab842ad3a6fb4e24a"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATOguryAdapter.zip",
            checksum: "af97d11b82ac936e01965aa78d2e3664891ae9a0cbed5a07fbb5dbce090ef718"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATUTIQAdapter.zip",
            checksum: "3e4a070bb2572441dc34f3aa62caaeea5cf31fe51ec5c2044374ece1612ac539"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATYOCAdapter.zip",
            checksum: "33c6ae15a88e3b0becca45578263411d12156ff822a7793bbbee6a8487899d17"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATKit.zip",
            checksum: "a84ebd01fbd27d4274ddd66ae5b64975f0681ef66a4203ea0fb299d73bb9215e"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATTappxAdapter.zip",
            checksum: "368711a2dcc1ad787bbc2a6d392ddbaa7ed91532b633d5f04414d0c03790cade"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATAppLovinAdapter.zip",
            checksum: "10f9f31278d85f31458b0d9fdc4a37122fd0b88e800d91aa9f9ed14270d61f32"
        ),
        .binaryTarget(
            name: "AATCriteoAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATCriteoAdapter.zip",
            checksum: "4d3e46696bc7f5107c0b4a32afebb3a208dfabe349fe4b1ace8c2c57844d00ff"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATAppHarbrAdapter.zip",
            checksum: "4c88a61a9606587b327ac925d80a7d7e5000de1bb10cc6b04c411c0c86c37697"
        ),
        .binaryTarget(
            name: "AATSmaatoAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATSmaatoAdapter.zip",
            checksum: "51ae3d020400bb5bb4f6e70f8be0ef150a48a9d9d0108454c91211961c6c7bf4"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AATTeadsAdapter.zip",
            checksum: "d54523a2411b3a6a3aca2caf1dad449ef7fd13e5aa6dacc967b746f7e5bf6671"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AppConsent.zip",
            checksum: "6c42360dce322948dc50c84b94c72f3a85e5ad2077ca492004d995d67a11a213"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/UnityAds.zip",
            checksum: "1b9c1c5b3613aced0cdcc46f6f4306da098880020b62d5889f6acac7b1ef2e67"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/OguryCore.zip",
            checksum: "8c346ccf84ed5cba1175897e7791b6dee2c57c5cda56350e53bd76a5a10b9dfa"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/OMSDK_Ogury.zip",
            checksum: "874e83f22b7fa4607f403f1058db93618b16b4e5ad057b9a96a585056124a54c"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/OguryAds.zip",
            checksum: "33387390426a4a5563e10b7d93c1317ac04e5f27d159723fbceb57f03357222e"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/InMobiSDK.zip",
            checksum: "d44166b6c90b3203abb4679b3748c69f18dfcc3ed644aa71b768f3e497ece3e7"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/TeadsSDK.zip",
            checksum: "2afbf89df17861f1f71676444ebaeab1811d7854575ea01dd9abf39d1b8bb01a"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/OMSDK_Teadstv.zip",
            checksum: "2b23b1d424889e5c8756b3fa151ec4ca9e7edd92e541bc929494fd200feb6d83"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/OgurySdk.zip",
            checksum: "e1361cfdab261891d60fb3383b339c7268b174cef8087dde58f299618a120eb6"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/FBAudienceNetwork.zip",
            checksum: "4f6d845961c3e4e9635a885c5078f322adabc3e8a710197ce3cb337da4d1d369"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/TappxFramework.zip",
            checksum: "38b67fbf597ec3068926bd6df3d7f420b8e9bab9296a3a2f25768bc13d153b60"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/OMSDK_Tappx.zip",
            checksum: "3655d4698af82d23bb9ff2698bba7257f2697383b6752b97c0e05a07661e287f"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/VungleAdsSDK.zip",
            checksum: "bdad76470a407ddfc5b4fbfbc37c017b1ca6d57801d34c6237d644196d8b5c66"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/IronSourceAdQualitySDK.zip",
            checksum: "50b87e2f5ad442c53d8244d4983ed7a15df32ef293de266c519f1198c85cc80c"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/DTBiOSSDK.zip",
            checksum: "65abbba5040a86a321c16670505ac05280839289fd7c0b5297ab54b308eb28e1"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/KidozSDK.zip",
            checksum: "fe1b52d97908af56233032257641952f700aae83d717484a893c1697271305f7"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/FeedAd.zip",
            checksum: "d0fdf4bfbd3a340156fa4bf2805215082632c1a0029736a34c82dc62ea3e8b67"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/MTGSDKInterstitialVideo.zip",
            checksum: "bcfe2b2461c275b9029362761f0bf2166ab6305bcec17042edb899e8dbf40647"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/MTGSDKBanner.zip",
            checksum: "8c73aa80bbefd7b647b5406af901fea1d9ccd107ac459c29949c20bc6f2cf774"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/MTGSDKBidding.zip",
            checksum: "2c8dc66354b163ec102624ec87a08adb88db59411b6272c388a83b700ebc533a"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/MTGSDKReward.zip",
            checksum: "438ed7f26dbfda1fecc5be23796ed469fb690b62354ccd7245fe486efe143b28"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/MTGSDKNativeAdvanced.zip",
            checksum: "be954475a0638f05bf1b47b172f66e60b32f7e3d3452442c621dcb9570622aad"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/MTGSDKSplash.zip",
            checksum: "add6ff9082851374df7f9d21c36ed9d2e30e9faf16f6dfcbd8f59d6962b78a48"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/MTGSDKNewInterstitial.zip",
            checksum: "02522669a455df698ea2f3181404354d323e184fab49171ffc5088570a19d690"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/MTGSDK.zip",
            checksum: "bd292aaef76bb472511ee2ba9652f6bac91599b2304a49ad1b8b45facd706556"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/IronSource.zip",
            checksum: "083d30299b675dca6f872dadd1158b1a3d84562bbdb475ca6303653e085dcbfd"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/MolocoSDK.zip",
            checksum: "f58ab08baf761678954ffaac283772f416b4a3a126aa84e1f1379ce21fb461b9"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/AppNexusSDK.zip",
            checksum: "dee52839a750b4a0a03af541225fa3a6ba45b9667550b603a3955a85d1067384"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.14.3/SASDisplayKit.zip",
            checksum: "0f1d4417172cba86c01ac4c6ab6fd29fbff2d950f21264baf257cc0c6bf4dd75"
        ),
    ]
)
