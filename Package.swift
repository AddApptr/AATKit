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
        .package(url: "https://github.com/AddApptr/RTBSDK.git", exact: Version(1, 9, 0))
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
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATAmazonAdapter.zip",
            checksum: "5b4734ace39488e38457520e0898a36d5324a242a594b38d0347dbadec8554dc"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATUnityAdapter.zip",
            checksum: "4356e6b7e741029d86072d96e13b36174c3eec9b8269f09ebbd8005e103dc6d6"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATAppNexusAdapter.zip",
            checksum: "08cfb91881d46f875bd975ea4cf93b82abab027300126aab6a06b2ba03d53e3c"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATSmartAdAdapter.zip",
            checksum: "fb9eee41de43dca1b132cd10a3f9d420d2480a724a5c6ea1ea61e843a49a4e57"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATIronSourceAdapter.zip",
            checksum: "0de07c304710f7bbbfa5f6e1e8bb13af616332e2e6723f5e7b53959d9e89a89e"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATDFPPrebidAdapter.zip",
            checksum: "72d04871c4c432163ae735bc1eae3ce5f743ac5f3e9dbe4b4439aed17f288740"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATGraviteRTBAdapter.zip",
            checksum: "975107406d38d27390ad390569be015cb6f427cf040c38c8f2ad2952165ec3b5"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/HyBid.zip",
            checksum: "25122a31568b4728e7b41ba111e826e408b6ecee008587f6c79c0712978012b0"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/OMSDK_Pubnativenet.zip",
            checksum: "c815e4ab0078f5e76b99eec6980737e6f447bb5bb0b04281603b0e4deb26a017"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/ATOM.zip",
            checksum: "6a505e832fd79cfd3ea32fc717c4e7aaa7092da11b321c0a685d06f95ce19fbe"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/VisxSDK.zip",
            checksum: "43b3907077e119523a23fc18ac6178560b3da074dae8acd7586e0c0f03e57955"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/DIOSDK.zip",
            checksum: "c2eadf5e387feb9c659311a3141614220435a726e5dd142e2e8cc3aa716e0fae"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/OMSDK_Prebidorg.zip",
            checksum: "1988a38f92369a79533d671d222316f08707b8581dbc3e1ae357cecae7e3faa6"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/PrebidMobile.zip",
            checksum: "72cb01a2057dff7016d72a70e586356afcb670cf833e20604b24badfc9d0448b"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/Utiq.zip",
            checksum: "6a7c18afeacf64aaf40c4081abf83f68e7a1ff74314395523d710bb3d133ce6f"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/ConsentViewController.zip",
            checksum: "8c9773441b631d01e8071031848c0d8ee1036b9c5cd447019e4da85dd1aa14bb"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATSourcePointCMPAdapter.zip",
            checksum: "e7fc36eef85bb6fe09a760a768683af349c8f20cef477625f842c0b6ca5181ee"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATAdMobDSPAdapter.zip",
            checksum: "689ae237ff802313c689f3487ebbde8f0bbadb629e3f51e1f1ec68af0ed23069"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATSuperAwesomeAdapter.zip",
            checksum: "8059793a9b5f7723def186471032d339bff0f6bc230727a4bad6e1456c2d33a4"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATGoogleAdsAdapter.zip",
            checksum: "951d19c3439dafabcfcc651b75ad8fe3380cc4a1c967fd77153785fcdec3b728"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATDisplayIOAdapter.zip",
            checksum: "8d70633ffbc3683b9a394a02512ad3a7d0d979e0fc9a03440935f0fa7d4b6358"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATPubNativeAdapter.zip",
            checksum: "8ce816544b2110064a0d5829da4b603749553c8940b2e915b284d6e4bd57b848"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATMetaBiddingAdapter.zip",
            checksum: "1cbe55e746af09f69cc49d0ef324849904bbe60dee8c44318a8e5643df2ed634"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATVungleAdapter.zip",
            checksum: "07a68440edb0064d934fb65914a2e5fdaa328be7b33d704fad60861299071833"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATFacebookAdapter.zip",
            checksum: "1699f3a6e8435a0231607d29ff08e94b3c114706e678ed7e7eadd78f7f9139f6"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATFeedAdAdapter.zip",
            checksum: "c836684bc653ad270e316aaab6b3f74f72ff17011b182a0cdecbcdbf6f8e7fcf"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATMintegralAdapter.zip",
            checksum: "c0e06665307d60ad3d3d6602ac36a274f2e568d582de8f9b20784aab88cc3117"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATKidozAdapter.zip",
            checksum: "520827e5076305c7f901c562308b7b8e25b584bf9250edc3f936e12ab44a729b"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATGoogleCMPAdapter.zip",
            checksum: "a1f0be93a6a325aaf16e2b6482ac84096d508a88bc1359a1c6a1d1318e2e8a65"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATAppConsentAdapter.zip",
            checksum: "dde0e69845877a5e3e9e837a986fe312660c7d61bdf06e59f01a2a05c96f4d24"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATMolocoBiddingDSPAdapter.zip",
            checksum: "751aab3bfaf6f3500c07cb9edc9ae309a4e497a1280a5a849251afd5c273debc"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATAdMobMediationAdapter.zip",
            checksum: "b4b0085ac9d99b9e5cf5ba7264c76de0857cdf9c37ba2f0792747cd5d01ad2bc"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATInMobiAdapter.zip",
            checksum: "dc02674807cc082d477ae51df1b208833449e06df1b845be7fc6a243f0db5bc8"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATOguryAdapter.zip",
            checksum: "e8e62d5c56caf4b76dea2081c5ac9cae5674645a34a59338b66bba3383fabe26"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATUTIQAdapter.zip",
            checksum: "3a9d12def214bb424f17c4b7c68165aba5812fd377331af51dedbf3ae719ec58"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATYOCAdapter.zip",
            checksum: "471bd5674fad02ca015a2eb9a175e45ae3a3eae56e292fb41c3736f735c0a0e5"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATKit.zip",
            checksum: "c2ae5a8d4a5734f1e2668052da5e38968e9278bf009ad4bfd1c041c57201f69a"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATTappxAdapter.zip",
            checksum: "fa8d97514be2c39026f7c4bc3bc806d52c1bf663023920a3faf067ebdcf83e12"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATAppLovinAdapter.zip",
            checksum: "ee79f46844e0b2c5d75e9c24b759fc2b43322a06f9a3ffa7a6397d4b08fc4084"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATAppHarbrAdapter.zip",
            checksum: "19b409a0a93ea40e2b23e9a33c9a31c827c1f9d4ac38746cf6839218d7931111"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AATTeadsAdapter.zip",
            checksum: "e2b1dcf89a1f258aa6d0cf12a0f0ec17c685876f0dce40813cbd1c037c597efe"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AppConsent.zip",
            checksum: "925d42df518c311fe30d8c617c373be7934951e91f43bd6894041ad4be15e590"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/UnityAds.zip",
            checksum: "e292e9fbbbe09861a9f451a5bb7c00f744a0718c6ed6338f06af9f32c36c04dd"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/OguryCore.zip",
            checksum: "a3a0f9e2cfe79672779dbb7a9ec44814f16714faeb999261a36c4124c5c6f272"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/OMSDK_Ogury.zip",
            checksum: "933967f6173fdf2ac9bc87fdcb55df7494337806badd4aba032f15161bca6820"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/OguryAds.zip",
            checksum: "54c77603e06e4699b1b3fb4724d10840b9d881f05fbe7a99d231372e5af4162e"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/InMobiSDK.zip",
            checksum: "b63b770ab68aa05e4f517d919755bc85194e65f0f3a02b7e4770553ab5fc38ce"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/TeadsSDK.zip",
            checksum: "74b79944748fd762e496377cee98b8ea1f631390f44fb6bbeb3f8f021520c3d6"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/OMSDK_Teadstv.zip",
            checksum: "82b9a725d0cae411f18e154d6d9533c012975c4542dbe84701ec527bddaaf83d"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/OgurySdk.zip",
            checksum: "a6981e65d024b90d7634943cb997297fe4e245941ac7a4dc1670ef4e87b6996c"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/FBAudienceNetwork.zip",
            checksum: "1c0c07f8d4915696d74ff954d593bef4fdc58c4d344f03754a93310eacb83eb3"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/TappxFramework.zip",
            checksum: "1e17f156c0d768e51aeed5d95bfd8099256a03d03bfb637e57632d3c79d0249a"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/OMSDK_Tappx.zip",
            checksum: "a26f57168bafa9e1521e26811844769c57d17276f2805685f3d0ad8b11a5f4d2"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/VungleAdsSDK.zip",
            checksum: "a4b4dd32ed5037995ce473cebca70dc18f283141708a0c6eb757d3b3deb17c62"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/IronSourceAdQualitySDK.zip",
            checksum: "62bf73bae6ca79527272d0eac961e97cf7d7642f5e3fe18c756858298006ca6a"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/DTBiOSSDK.zip",
            checksum: "1c840cbe4eb1b840605a96ddb5b81fb2d4c9da6da6861ca34963d9c93a6e1bd5"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/KidozSDK.zip",
            checksum: "2752b40214ccaf1498f3352730738e47aa7c383c97b2780bec5d0f2752d4821a"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/FeedAd.zip",
            checksum: "3188631732cc3f96a7fe631b64b0ebf31da183533cf1b827cbef8ad3257fb412"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/MTGSDKInterstitialVideo.zip",
            checksum: "67c427b9767bd24284258efc43467a95d4b22be099d8728804e1eed7d0aeaf97"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/MTGSDKBanner.zip",
            checksum: "406b444e2688a548ea86f33058752051a553abf09bd213ce225cf047663b189c"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/MTGSDKBidding.zip",
            checksum: "c2d48f97b0882a1157a9178a48c63a177e24627cd540dbbba3347b9874dac96b"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/MTGSDKReward.zip",
            checksum: "fbec2c05105e93e1588526857329bf01b247b29a6d0cda03b8a5cacc2c28f896"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/MTGSDKNativeAdvanced.zip",
            checksum: "69db0825f979f761b8eba1b8bb4f420b910d24083cf78553f349d86951e4459d"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/MTGSDKSplash.zip",
            checksum: "ad23ff91d9c00fb26841786d8ae87e6c3153cc31c133be2bd74ab7c1cc5b0cc0"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/MTGSDKNewInterstitial.zip",
            checksum: "0f535c80533f9efe96b1222f4d90d578bdee7c4d55290300587ee7109be1f93c"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/MTGSDK.zip",
            checksum: "dd38b8c023ddfc3e909ca1ce0f33d05b3fc19335109b4d2bcb98a2f9c92aef50"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/IronSource.zip",
            checksum: "71db750ac6afdd14d36585c28fa88617bb235861270946a7a850046b20d2586c"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/MolocoSDK.zip",
            checksum: "182ca1cf64ecfd8fd27766fe6ab1b3e600f6660d89c6a2c85ab1434fa5941953"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/AppNexusSDK.zip",
            checksum: "747f4341f3cbc10a6f94e82f000b6a8ebe12549ae3797b72acf76e43ddc8e5d9"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://ios-sdk.aatkit.com/AATKit_SPM/3.15.1/SASDisplayKit.zip",
            checksum: "71e1d961e4097cf3c9a4527e58e368a5272db9b0b9a0fe68f0db4f432ca10862"
        ),
    ]
)
