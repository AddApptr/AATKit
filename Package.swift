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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATAmazonAdapter.zip",
            checksum: "c4a3c7a0cf2fec3913ee58846d253fe71c2cae9a7abfe3aa0877e2b4518837e7"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATUnityAdapter.zip",
            checksum: "cac66da59ed028310c8a73844e84a2f077461330c1e734d73a6cec76ff0579a0"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATAppNexusAdapter.zip",
            checksum: "669e21c0d512d1bd9240b9afe5e2e2455c3c0146fcc4491e53de44991d3aff83"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATSmartAdAdapter.zip",
            checksum: "7bb1836740c31021cfb966cef50aedda63bb324fb43bc769e57f14424940c820"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATIronSourceAdapter.zip",
            checksum: "cc60e8f9bca5b8c1aaa797ffbd26c8cbffa9947e8e096c735a6d2a1d8e016cbb"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATDFPPrebidAdapter.zip",
            checksum: "edd7382276501acaaeab08f15980481ce36d4894b2949bc25f3b58c34d6d046a"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATGraviteRTBAdapter.zip",
            checksum: "a9e2611e1dfd409c077a78029640b4dfe24324c4a6b961df18a5915c13831b6b"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/HyBid.zip",
            checksum: "fa6e1cce89814c0b05ca9580e089ce29ad1a76e148a4c6496a460b7805188b3e"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/OMSDK_Pubnativenet.zip",
            checksum: "e65ca328237fc22ea2dacd1a776c8da5a1bd562bb5dd766cc21de326c55a6c87"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/ATOM.zip",
            checksum: "c49c93943de67f5f36fd35eeda26c7d5baabcf0dfda00a7faf59eb4d97a28b56"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/VisxSDK.zip",
            checksum: "36da2696e0cbfcf0ab696dc8c7a4af90334c3ac3f7e9a8c2b9731cffdc9b1596"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/DIOSDK.zip",
            checksum: "001866bb7e062b94558fa2f14fcb6cc6c2a6063f6087f1c653ca79d33dbfbd1b"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/OMSDK_Prebidorg.zip",
            checksum: "822c68072a15e796274e23426b96cd46a198a0a012370e12224edc2005b0d774"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/PrebidMobile.zip",
            checksum: "02bb1432fad39c36a5d40a008e1f4ca31235521ac7f400048d95bf51e3d8a5e5"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/Utiq.zip",
            checksum: "05b2d8168e9c220de93ded8a4ffcb5cf8f1dfeaa632c789882a9288afc23c144"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/ConsentViewController.zip",
            checksum: "77940a7b46198eec18535bf33ea89280736dfb45300911167b65d8e4ad8643a9"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATSourcePointCMPAdapter.zip",
            checksum: "15419b163ce04abfd84b672611672db7b4797c9afa4737e427abff8b4c8f0378"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATAdMobDSPAdapter.zip",
            checksum: "93db8491077b8dfd6ae1c9cb9c8eb90979a1364bafe176a2d0a8af93d568f1e5"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATSuperAwesomeAdapter.zip",
            checksum: "2984c2c52cb78c558a1a2d53b2ddafda1a8e7d32e49b33bf78888442ab8ce7cb"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATGoogleAdsAdapter.zip",
            checksum: "3f4ecbfd27ad0506f4864210a48f3f48daaa5f63ab8685b195e8273a89d115a7"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATDisplayIOAdapter.zip",
            checksum: "dadff639a62966ab0bf921f22e30668b1340a0b8c26c1492f843cd30b9eafd75"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATPubNativeAdapter.zip",
            checksum: "d8cbb46fd780fb9b3c4dffc0e46ade48cc938395053daabc20936ef8e84486c3"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATMetaBiddingAdapter.zip",
            checksum: "d75e742381a63e6e3de318fa5db87ac75c78aa34d063136b578610be55088764"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATVungleAdapter.zip",
            checksum: "d0362cfe479852df354acda6bfecf4067651e3898ffd7cb6e0422da66fa2ec4c"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATFacebookAdapter.zip",
            checksum: "a7c597a9164d2df1fdcfde0f6149017b4bae3759afe6fa313f72e69da6c81047"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATFeedAdAdapter.zip",
            checksum: "53dbb5f8a76c03d0dbcf16da4745ab54d8c3abf8a7ff165e04de5f778019d744"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATMintegralAdapter.zip",
            checksum: "302845991078b7b1280679d5b2bbe2b6b1dd1404ed0d8e1bf63d97797b8b3d99"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATKidozAdapter.zip",
            checksum: "fea194f604a35239036f5a5c523a7b85db8cf0ddea4f068b21b37288726c262e"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATGoogleCMPAdapter.zip",
            checksum: "9f7396c4d3d0105287eb5cbdbe4b0a335e0201a29f44406ff0a126499b2ae84f"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATAppConsentAdapter.zip",
            checksum: "8b6596fd36719154968d2eeef3abff8a8e8daa4863e0df899dc574af53eabe90"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATMolocoBiddingDSPAdapter.zip",
            checksum: "25088f9adcbc4f6c9fea788723cb1a2307d33124914ba199ea3e93d884b83ec8"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATAdMobMediationAdapter.zip",
            checksum: "00643e6069e62b314330d0f6449a0c3f4be8c3990858a1b99316c1b8e88810fd"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATInMobiAdapter.zip",
            checksum: "e5c58f8d02125f851cbc0ac8f16d70c5966ad9ab9ce85346bb20a60b4ac595e5"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATOguryAdapter.zip",
            checksum: "19d760d4cbeb9b5d21e5e96cb222f917a3b8d480ebb266d313695eb274aee53c"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATUTIQAdapter.zip",
            checksum: "0297c858906e4dbdc3301c9d81eaa09d2f3574c520faabe893cac749bba23bd1"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATYOCAdapter.zip",
            checksum: "566a784665b06c188e547192c9b55fd5a11c15cffcca1bec146faccbb21390b3"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATKit.zip",
            checksum: "901cde684b69153a179e52065b57daa851c3a3b00bb0871e75274eddeabf3956"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATTappxAdapter.zip",
            checksum: "fb6b640f3563a57bcb24c1814b8dc2be5ad744a1e374d63c0ad62e6929722cae"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATAppLovinAdapter.zip",
            checksum: "4761509d0505e21c449284a1faa4e29c24eec1402b6e3d9ffa5aa1895e12c72f"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATAppHarbrAdapter.zip",
            checksum: "ea2e22dd39585deea8b6c8a799a028327245f7f0122f408121eb22898d1f5743"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AATTeadsAdapter.zip",
            checksum: "6fa55b22a8e1ce06e2069442f1a3a939fed108d533a2fdb7e3bc715dda16451d"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AppConsent.zip",
            checksum: "0332e7b4619a07b884213239ec44399d9fdc1327d05619312903877bc426c825"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/UnityAds.zip",
            checksum: "94a46ce65cb2612731be027759392727978387f402c33740db16c39d8a697311"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/OguryCore.zip",
            checksum: "60a793181e02411e862e9bff946b9d223d640314d00d731112fa1d681816b30d"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/OMSDK_Ogury.zip",
            checksum: "d3292d5fe749d0f1f5286919406a5b8e3064663ba9eb0b1a3a225637226c08fa"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/OguryAds.zip",
            checksum: "89ef2f421702f38861529d4b77bf9b89b125fba65a55b7f30d40bb4dc759b760"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/InMobiSDK.zip",
            checksum: "732bc1c692aae41353c301360ec40718166f806f343a982524b9254da2e88ab2"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/TeadsSDK.zip",
            checksum: "e7e4f1dd5cf6d567b46255384d68e51e80e82d10bc5e79aba4a4933f1d6b8b50"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/OMSDK_Teadstv.zip",
            checksum: "b37cf74a2644a08c6d76cb226101a927b38646645aaab1a94b5d1fb1058b557c"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/OgurySdk.zip",
            checksum: "51715b9e1a11bbc8d8a2bf6f70b148311679bdb05e8a38b374d0670645fcde87"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/FBAudienceNetwork.zip",
            checksum: "63d8511c1dc42fec161a361011e38d539cde0ee9e8030fda22ea04ee8cf4f6ac"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/TappxFramework.zip",
            checksum: "523f7af2907e42a2cd7aebe4d2670587d0d29fe6b0c6fd742f370dfd1ab8f3fd"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/OMSDK_Tappx.zip",
            checksum: "d97bbf0f766487bf1a1c14e54346589314d1c48cb9d7b05174c4f37c5c833df6"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/VungleAdsSDK.zip",
            checksum: "b8d2e3331bbb52eff30b1371e0e171c62ad4463ac77f3dbfa38a4312a126e2d3"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/IronSourceAdQualitySDK.zip",
            checksum: "dff5774d7081a1c1b2b43e712189ac45d3a667dfb316051eba54943dc174eab8"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/DTBiOSSDK.zip",
            checksum: "558b699443fb9be6257d5e4c4cade67eef25f6b24533b198709eb0aff6730b75"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/KidozSDK.zip",
            checksum: "22260d0f75ecd597b9d4f2f85bb667fb215b4dc5878b47f64e47bafd0f48e413"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/FeedAd.zip",
            checksum: "93ee79e8ac4065236d256dad2f0fe3035b6d653532d7834de2e44be16178104d"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/MTGSDKInterstitialVideo.zip",
            checksum: "a48395ce83f4ce4a861db280c5d145c1b295adfc647fde95041617524493aa36"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/MTGSDKBanner.zip",
            checksum: "d83e6ba6f912dc8c720dfffa0d9134fce55698df59420b6367f4219af537847e"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/MTGSDKBidding.zip",
            checksum: "fd812f2ba1fbaf2b135c648e4bddffc8ee94d8aaeb62b526a0b521d12c482df2"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/MTGSDKReward.zip",
            checksum: "ffd4ae23ebae0e6dab349892b67b20891f5487858226b44720ad41cd6ccf4c63"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/MTGSDKNativeAdvanced.zip",
            checksum: "3a944c4302bb29720671edf0555df0458d03f7d0e0817d6ddddd90d5f6e0a787"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/MTGSDKSplash.zip",
            checksum: "04e1708e4ed0b95372a1df31e1e3045c7a8fb9a3128e9bd6eff8075c1a8ebe22"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/MTGSDKNewInterstitial.zip",
            checksum: "a95baa4fb33e88c83bbf794bf62c07899bcdf91d2faa1a9fd7bf1e9398ea0835"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/MTGSDK.zip",
            checksum: "0f3e715b917ba895e31c2e645bcd047943a34200150c9e4691f4fed5e5b3b6f2"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/IronSource.zip",
            checksum: "35183c48262978bb2227cd6c2221c03b9bdb2399203b71f346ccb9f847346483"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/MolocoSDK.zip",
            checksum: "7cd7da22922c7e7fb3dbabdfa361045a75f7a06692cd2850e56000b56db3b564"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/AppNexusSDK.zip",
            checksum: "a2e8ce8ff57c7e5585bfa3d28dc98a9b2dcee1b29ebdd6fda2abb57a021e1554"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.3/SASDisplayKit.zip",
            checksum: "d71339333b872eb66871eacd755207acf5f06f9f3e0f65d377a438b1a95fa7e2"
        ),
    ]
)
