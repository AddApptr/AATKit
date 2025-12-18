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
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: Version(13, 4, 0)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: Version(12, 13, 0)),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", exact: Version(1, 27, 0)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(url: "https://github.com/AddApptr/RTBSDK.git", exact: Version(1, 9, 1))
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATAmazonAdapter.zip",
            checksum: "eaf3f5b7f559047c8d54f3997c2888c4b904451df464c55fd62eb4c468f21052"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATUnityAdapter.zip",
            checksum: "57db515f893c5abd3e255b890809e6bb441a8237cded508b768d751d98861fe4"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATAppNexusAdapter.zip",
            checksum: "5ac4f291f5ced6a7ea1035656dac620e48aa8454a67ea5f3d00a4047bd850b85"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATSmartAdAdapter.zip",
            checksum: "ef00c595cbf55e4cd06f7be4e01c058f1bf70e966a38ce77c8dff9f36aecfcde"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATIronSourceAdapter.zip",
            checksum: "0cc2103baf1f49a21ce75124f90a623afed561f46b7c1e78bb18e498ac69877a"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATDFPPrebidAdapter.zip",
            checksum: "c968fd7a17e2d22f0c70b9f68cf5fdecf7c5329dd218a9ecaa8685276cf3400f"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATGraviteRTBAdapter.zip",
            checksum: "7f8db72704dd41a613b06463cba4238f6d54074aa67de3b5053a2b95a0d311b6"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/HyBid.zip",
            checksum: "eaaa6b73ba95d0ac6180676d0648d542a3363294cb758f1d41ecc3c8d662b0ca"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/OMSDK_Pubnativenet.zip",
            checksum: "9dd718212deafbadb72f47ebde24584a3e4e82175902e44ac209a5f42354eef2"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/ATOM.zip",
            checksum: "7dcae6b7613a124cca43f2e45066ccdeb356ba1a2765c8a705fe7e6758f1f185"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/VisxSDK.zip",
            checksum: "897cc610f4c18c555e9a85c7611bd0e412c559622a5fab5945d2122dcef3dd16"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/DIOSDK.zip",
            checksum: "cb6b3c370795757a4265eb1db39a665ca421a8e4aea45c382f5f643de0437bf6"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/OMSDK_Prebidorg.zip",
            checksum: "1807c6c35b90affafb34ab16fb1a872ae2ecc7c441f231a234e71279a02663ba"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/PrebidMobile.zip",
            checksum: "37cba4885512d9848767359e5ecc837a769ed7c2a9c0dbe6305ae7a96107d5e6"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/Utiq.zip",
            checksum: "c4dff68fa93f7c69e35c4bde72276c4fd7d52dc48059855d7fc33b8163f2f9e5"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/ConsentViewController.zip",
            checksum: "6382266727a72b2105ab2c07c77c0d54e6aaf66b9bb4771526df30f323f1c27d"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATSourcePointCMPAdapter.zip",
            checksum: "acc9ddba7bef551ab6706d28d8c834ae836da62ed1572bce6d308c0280ed918f"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATAdMobDSPAdapter.zip",
            checksum: "7e9ff013bf9aea1c7c355868b3bac937be6b6b4e6a8e9d6c5b2a829988e097cd"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATSuperAwesomeAdapter.zip",
            checksum: "308adf8de2fcf0c3009f420850a1341f4e247c3ffd5b72106a1e693bbf128d0c"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATGoogleAdsAdapter.zip",
            checksum: "c641dd639476093c988ecb471673a4055d252bc4f442452f5d71c2434eba3d40"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATDisplayIOAdapter.zip",
            checksum: "7d63b43f5acc9e75df7dbdb8d4b1b93b70c6fedff0a2773f37f124be1b28b481"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATPubNativeAdapter.zip",
            checksum: "cf071fbecb3f90478a9bd2eaba1548cb607bf9e76d409c2c04629dce9b50c68d"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATMetaBiddingAdapter.zip",
            checksum: "9491ea651665d40aca36dc473029119c45ddac446a4cc375e3d6d305f3289f45"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATVungleAdapter.zip",
            checksum: "49e94538bf0e12d3664207219ca151fd17aa49aebd8b5401307dea58ada5b0a1"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATFacebookAdapter.zip",
            checksum: "930cf92007ed48da9a890b033d1895be36260604c9a925fb5224b2b8265aadd5"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATFeedAdAdapter.zip",
            checksum: "6180595e9b258456c2ed34ea0436a5a23d227d30ddfd4123625a662f472c7415"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATMintegralAdapter.zip",
            checksum: "b88e11aa5153886145bdb919a1976d002d03828cb81e2788883a900963c6ff39"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATKidozAdapter.zip",
            checksum: "9a97feb6f89fa574191ad24f6a5c2062f3aeef0bfb422c8949dd5a65d8721fc6"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATGoogleCMPAdapter.zip",
            checksum: "d4842a3e110274700c8e32828e14680b11d4e104b86bfa1b563362b8926d8ed0"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATAppConsentAdapter.zip",
            checksum: "684eefbc1e5b237d4a7314b26efaff074d0ab2c2ddb720d902d732c115b2f28f"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATMolocoBiddingDSPAdapter.zip",
            checksum: "2379d33a8400f85846f5270d653a599028ab674b30111f7ed65a542019e8e193"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATAdMobMediationAdapter.zip",
            checksum: "0f9a805647b15e6e2310cd3fa8d3adfcabaca87bda5e764fc1b7d0d29b03268e"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATInMobiAdapter.zip",
            checksum: "3fbdb4bc7b31ee9db07356d1a9895acc93bcb9f18d27be0765e224418fd6f54a"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATOguryAdapter.zip",
            checksum: "8dd9603fca52ad9c4e5786dca0283811290f07018b29adef563614d488106730"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATUTIQAdapter.zip",
            checksum: "bcc2d291f6f12f308f4a22e290cf47fb20047ae490af0dbfc8fe5efdc63193a3"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATYOCAdapter.zip",
            checksum: "33b9cee9b896b8a1a61f069ab426ff8a836be6dbeee68bfa69ffd87f4271b882"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATKit.zip",
            checksum: "786cc675c973f259afcb4965eab36667156deb3454a5ae29edf6b1e4a18a33e0"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATTappxAdapter.zip",
            checksum: "6654b73ab3cd93a8891ec5c5c9c9f63ad4ae04bde5cef624c364c25ac7a20256"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATAppLovinAdapter.zip",
            checksum: "7a903abb1caa81786c5c75a465f9ed6974cd016f0dc43714c4cc79a52ac92412"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATAppHarbrAdapter.zip",
            checksum: "bb1754cb1147a5a619e3987483140543e197e0b81cd6dc74f304bfbec7e0c62b"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AATTeadsAdapter.zip",
            checksum: "bfef0185aec2fd579642dd7e89645340f42985b37599320068f1304378f172b0"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AppConsent.zip",
            checksum: "7b9c51b03a89e28512c44c745f5057ad536133c5d2100811f89aee9b7cf19533"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/UnityAds.zip",
            checksum: "941ae85558e7c3c9b33b2790b87491c9a34f1631cb8be376e3b176847da514ed"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/OguryCore.zip",
            checksum: "8a8f30d7f3fbc0d3ce5e720861ebd5b5df8b7d99ceb668a72e326de4a92b1cba"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/OMSDK_Ogury.zip",
            checksum: "fab6d01cc26bf024b692b7f6cc353108da253ac56d861cacdcbd65c56f5ee36f"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/OguryAds.zip",
            checksum: "d4070644369110d1dd07de87e1bf95e4be115c40ac8ac5c4c6795896a3b33b8e"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/InMobiSDK.zip",
            checksum: "d8e4a17db8f8443733c4acb0f7094f7a79f300779fb66abb7f13e2d7fd8eedac"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/TeadsSDK.zip",
            checksum: "dfc10922eacc13ad1bb62cde7f85893ed81cb71a3a457fcf824f172bcdb2ea3d"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/OMSDK_Teadstv.zip",
            checksum: "04eabe4144bbe25b10d98f6ba953a5aaf853f4bbf4b872c61fa72c372e1051f7"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/OgurySdk.zip",
            checksum: "08732eb0ba838f7b7ecfff99747e4378b9e8d8b8bcbd1b64947a5217a0ddfb00"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/FBAudienceNetwork.zip",
            checksum: "0d5f0f5e49624450625d2a55d5730e00ec0bde8f102cd03343a65bd2c3b4e843"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/TappxFramework.zip",
            checksum: "dc4e798203a746372c5e591e78fdc8e14eb0c55b0f092b207f8bbc486b939c92"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/OMSDK_Tappx.zip",
            checksum: "bfc041fd3ddba6718e3afba43b7db94052078ea0a066fd30eb3bc64512bd25ff"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/VungleAdsSDK.zip",
            checksum: "554697edbf7524d6655fbbd053868428573c809666d0c8f478b2a559e8106ccb"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/IronSourceAdQualitySDK.zip",
            checksum: "ba1d9ff6bd4a69a3256ac8527dbb5895c6914f5dccc4a174bc39b30418d28307"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/DTBiOSSDK.zip",
            checksum: "d9bec2b1f2fc2b07ffec70cf35f6e67e5ac16bb9beb53a5c02132523e7a88cef"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/KidozSDK.zip",
            checksum: "111f572423b2b71ea8d13c6edc8db78ba25929f66d476a603393c094bb258513"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/FeedAd.zip",
            checksum: "d0e9e5a2640fbe4ab5d84d5c52e9feb067982dd870e9ad713b312377296e6143"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/MTGSDKInterstitialVideo.zip",
            checksum: "f65e776a240ccf3df348f1c6786568e229a09207bd534de049619bdf99b5a3e7"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/MTGSDKBanner.zip",
            checksum: "b1905cf72e97dfc8598a30e754cb4a6488f2c8523299abe296f022055cea08f1"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/MTGSDKBidding.zip",
            checksum: "f2c6ef97caecd9afb2fdde51d70d18c609a8fb65b887d7698ccac62741faaa9a"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/MTGSDKReward.zip",
            checksum: "5bbac6d8a8aa7d1b0deb6c3a287b64dd22a7f1140c5b7b99bce59dc9a0969f68"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/MTGSDKNativeAdvanced.zip",
            checksum: "69db0825f979f761b8eba1b8bb4f420b910d24083cf78553f349d86951e4459d"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/MTGSDKSplash.zip",
            checksum: "b99de3a006c3f7ed9c27c3d3676da3620e0a183bdb57aab9ff991f800dc4dc9d"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/MTGSDKNewInterstitial.zip",
            checksum: "528dd31cdd6f05666689eb1aa26e2932a93f77d56bad80cc13702792590cc3ca"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/MTGSDK.zip",
            checksum: "f5565fa276d54075a131b95838cba8cdc98a6aefede4aed9c1b13d8035838f2c"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/IronSource.zip",
            checksum: "fb72c31e0af3f61fef1dcb36cb75b90bfe0fc6498604cd6731992f65940b4255"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/MolocoSDK.zip",
            checksum: "b40cab25a3ae288f27583daefd2e72ba35215cdae9f210525eed2d0ccd68a831"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/AppNexusSDK.zip",
            checksum: "02a867b9a8c03c98e6b53339d968011ce27926d3dd9833c596fc4a1f3ca282ed"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.16.0-beta1/SASDisplayKit.zip",
            checksum: "f8530b0dd286f71a2adaf2fd978471760714a451d9c7dd46adb31abced93243d"
        ),
    ]
)
