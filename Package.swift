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
        .package(url: "https://github.com/AddApptr/RTBSDK.git", .upToNextMinor(from: "1.9.7"))
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
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATAmazonAdapter.zip",
            checksum: "ff00690848a307c2b35cdea4728e0ed9c08c2f2680d2e42b1e281b369cf14ce4"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATUnityAdapter.zip",
            checksum: "9622d6ef376dd0e678d1757c0d39a3dbca4210ea577f2005c346c7f1ca9e55c4"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATAppNexusAdapter.zip",
            checksum: "6bf77457eec481b5f90a9bba0fee2c341c40d32f984741a24afd8d41061e686d"
        ),
        .binaryTarget(
            name: "AATSmartAdAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATSmartAdAdapter.zip",
            checksum: "ee43b7f0b510fecbb5a0c8d2c3f843d9fef4d1d00b5f19b9dba25b84b0317a43"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATIronSourceAdapter.zip",
            checksum: "5956ef2eb5518241e3ca282eb217b5ef7ec7f2bee452401d22ff6a7a232d70c4"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATDFPPrebidAdapter.zip",
            checksum: "3ee61c7932da4cbd5fcdfcfbf1ed4b93c0eeda7849595abf10ef1113f3e413a9"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATGraviteRTBAdapter.zip",
            checksum: "d3bc52dfdc377fc6d24b13cecc273dfe8eb756fd28f089179d9df241159dbe6f"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/DIOSDK.zip",
            checksum: "a59e59d3c50f7a7347c2f3e13c5c757195efa914406f62c5862265fca906e82f"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/HyBid.zip",
            checksum: "f5bfea1440e1ec3d112b5a283229057abba7580db521bc290b53c3996514620c"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/OMSDK_Pubnativenet.zip",
            checksum: "ef651dd1f09405bd118c4d97d7f91e90eaae1a5f909ea72b30b223451d0a42c0"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/ATOM.zip",
            checksum: "3ad9bae3cb675e38202e4edc430f07ea2483807d2ea1a9f55a8ff9adfff2a904"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/Utiq.zip",
            checksum: "0412863afd7e7e72a929244318c980f7cb5762f750489d502ec0d36b9f975cd1"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/ConsentViewController.zip",
            checksum: "77270293fe76639d48e2bbf8c861b62d01b663b068bc1800dc68cc804f6ee8d4"
        ),
        .binaryTarget(
            name: "AATVisxSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/VisxSDK.zip",
            checksum: "b055628911ca2e221344179c5478de6642de34174af0696465720c0256d16d7b"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/OMSDK_Prebidorg.zip",
            checksum: "8c0fd6adaec4200e19aee1d2e9ce5881d01e4535309d3b38cc593caf0b81b007"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/PrebidMobile.zip",
            checksum: "504f3a95814cda8f1f01fda4b71f8537ee3423a73bc90658b53c91202ba718f6"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATSourcePointCMPAdapter.zip",
            checksum: "2775ba87a260074ca9c6c9135ce09e775cdb865d52644b15be80b5dfabecc2e0"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATAdMobDSPAdapter.zip",
            checksum: "61ed2f8d2543fa164af0967761e1efb1617f725e78939959977ec0c120d72934"
        ),
        .binaryTarget(
            name: "AATSuperAwesomeAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATSuperAwesomeAdapter.zip",
            checksum: "fc3a4be52405487d6f45b8a57edce1d009908db7e9e50e89b5324a203e4e714d"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATGoogleAdsAdapter.zip",
            checksum: "045f815596575d307485db2db67347866f34d71a514085d9c1699937df3e9bd2"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATDisplayIOAdapter.zip",
            checksum: "827b43705048b432beb0b4324bfbad636469f1814016b125c2c8b4333f8d8432"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATPubNativeAdapter.zip",
            checksum: "7f2bf7a5b0fb57bd59b8905beaf29d87c0a0a4b86f45963ac14d9592f3131bf9"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATMetaBiddingAdapter.zip",
            checksum: "6b9cdd2e3dc14b8c71865731e2a1f77016384e7f7bcc7f98dfdf7ecde308dffb"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATVungleAdapter.zip",
            checksum: "9ff13cde83b31e5fadf05d54a0575997bd4c996379d823d36ec371c063176db6"
        ),
        .binaryTarget(
            name: "AATFacebookAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATFacebookAdapter.zip",
            checksum: "6d9dd6c84a1a48f6abf678aa86d6ac4d3d0e50edfc7a278945787d7519c59362"
        ),
        .binaryTarget(
            name: "AATFeedAdAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATFeedAdAdapter.zip",
            checksum: "06e18e02af60a43a88f4b6ed2853032ba401fe6bd4795b159e86aa7405d635c6"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATMintegralAdapter.zip",
            checksum: "5c1cbcd0697d27fcfa796f3a46c9a451cc258467960c6e6c80a1773a2147ff28"
        ),
        .binaryTarget(
            name: "AATKidozAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATKidozAdapter.zip",
            checksum: "039ac02af6dd2914262184f5497833fe1e7d75631c41df3ced7a9047cefa6106"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATGoogleCMPAdapter.zip",
            checksum: "d9422ace64c10ed96df1af6d9f9140dff24c478b13751bbaadcac7db92431393"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATAppConsentAdapter.zip",
            checksum: "b37ebf9794e52c7fc60eff48497174101385bb6cb809e0093e53615770c58aa9"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATMolocoBiddingDSPAdapter.zip",
            checksum: "2c0a85ee42a607d209b2095296d875a922d2865b1b0b2b9ec5a90c20d64beded"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATAdMobMediationAdapter.zip",
            checksum: "aefb6092598b9f2b13254f4556410fed84e16f21ce88c47ee82257d223277950"
        ),
        .binaryTarget(
            name: "AATVungleBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATVungleBiddingAdapter.zip",
            checksum: "67708043cbf2edffb091aa11becffc40d7d957ba3055b5a4d2f419725f30f3e9"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATInMobiAdapter.zip",
            checksum: "399c6f930640f7e14fbf3f4c4b68eef2b1205790c270793a240ccebca79f6f3c"
        ),
        .binaryTarget(
            name: "AATOguryAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATOguryAdapter.zip",
            checksum: "9fd729952d8f2a2956f4b859e845a1da0b0fd8ae4b921866c4a15257dce6a08f"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATUTIQAdapter.zip",
            checksum: "3f35a03419d8d3bef987f851f04214b36dbddca571c156a07f7b7fe67c5423a5"
        ),
        .binaryTarget(
            name: "AATYOCAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATYOCAdapter.zip",
            checksum: "34371029c5753046f935126ac6ac72f75e786ee8edbe3442a955a6a958f67478"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATKit.zip",
            checksum: "e60bf70fe2c252e091ec1f955423af2d36e73ccb6b1dfbf1e3d83f77a879eca6"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATTappxAdapter.zip",
            checksum: "80449f86bc105796389485ca2037ff45fd49e9fef1ac1c648a7cd80e11b5f6fa"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATAppLovinAdapter.zip",
            checksum: "0fbfcbd39f7414969ca1c3e4cc4ca4a50e769046898e9752fc8e5b7a1185ce96"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATAppHarbrAdapter.zip",
            checksum: "ca67015daa2cf5985ca762f7e0517466a1466d112d1ca5dc07f5928d9f1875c9"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AATTeadsAdapter.zip",
            checksum: "6cfdd7515260ddeb253661ed84a6fa7921a0b8fb0d3514d1093c620e024a41ce"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AppConsent.zip",
            checksum: "b89df71ffd58e875d103c50199de2a8ae57721a6453dc79ffbb367a7b058c9e0"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/UnityAds.zip",
            checksum: "578f1ffa1917b64aade334065120b58a926e45cbafd06e667dc4381c7485d8bd"
        ),
        .binaryTarget(
            name: "AATOguryCore",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/OguryCore.zip",
            checksum: "e40c570f2f72468c08cc15b1d4a61a60a9e3c3b1829c254e6d46e0f3d6e6a7f3"
        ),
        .binaryTarget(
            name: "AATOMSDK_Ogury",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/OMSDK_Ogury.zip",
            checksum: "d4ffb2bf931d2644d83855746dbff6cd2e20253eb18b739deca35f26f6483596"
        ),
        .binaryTarget(
            name: "AATOguryAds",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/OguryAds.zip",
            checksum: "98b1ee2d73c273137ed42ffd9b51f82db35a13ca148051eae3a44f689737b097"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/InMobiSDK.zip",
            checksum: "64e35f25492828c2fc21fe0ac0000b2dc4c52bcfcaf8a06cd2a5ebcd5170ddd8"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/TeadsSDK.zip",
            checksum: "9a53055341ad2e7e9e5417e7da4a5c920e7a8baa8a14d6481033be1dde619c7f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/OMSDK_Teadstv.zip",
            checksum: "e60fffe1d2500053e852a5480ecab2b837ec9e09abb78e83899d195dce8f9abe"
        ),
        .binaryTarget(
            name: "AATOgurySdk",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/OgurySdk.zip",
            checksum: "c5114c2e4de96aaab2709b187a8cb5470c2106cda8b766d1df4056e0cc3dda61"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/FBAudienceNetwork.zip",
            checksum: "96f9a6a5c38ae25a39b81372b7c94be1d6cc2d07efce70eeb75b099a8d4a6be3"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/TappxFramework.zip",
            checksum: "4a2922fd7b8c06d47d453f5ea7abc4cca6b6daa24f830c9c8a921f7cd0d1583f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/OMSDK_Tappx.zip",
            checksum: "4f70d41564309b0b968ae1980dea3344d1a8f7db7036e90f4ad5967f927faa5b"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/VungleAdsSDK.zip",
            checksum: "a04b95de45b3bf781c31343f57642d82ab1b4da9fae7e1a861493cdaf129094a"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/IronSourceAdQualitySDK.zip",
            checksum: "d6b7e6c2c69bd223f2b74097b836eb251fafc36cfae3d0fbb7aa5302ad3715ad"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/DTBiOSSDK.zip",
            checksum: "dd900e35b692824bfcf3dfa62c42df78586de67cb047c5cd0e0a85c30def7fdf"
        ),
        .binaryTarget(
            name: "AATKidozSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/KidozSDK.zip",
            checksum: "bed525845a0ab8b0dac57237f560e8bfae5d86d883b36a6203e63d3d9320f45a"
        ),
        .binaryTarget(
            name: "AATFeedAd",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/FeedAd.zip",
            checksum: "8b44922aa801f33635e7d9f3acd8cedf118072e545dd6e524a2637856c94a962"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/MTGSDKInterstitialVideo.zip",
            checksum: "e42199706aa680efa457a70e8d18485061171a7949e4c459be7097d2c6b534dd"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/MTGSDKBanner.zip",
            checksum: "722adec609104687dae165a71f811e98507d69d81f3858a8eeeb2466fc66f295"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/MTGSDKBidding.zip",
            checksum: "29671fa28f8f9dcb32bc4ef9b6c05dbe0b37391bd81bc2831c40a26a6c866328"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/MTGSDKReward.zip",
            checksum: "5697f37172969409b3cd7ac4c5d3dcbfe1440b7dca5c59ceee147f6bc72d9f6c"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/MTGSDKNativeAdvanced.zip",
            checksum: "7e3ef8dcca9cba49fcfcc2a4261ba994ddb663dcb1a932113ea355361cc31ee7"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/MTGSDKSplash.zip",
            checksum: "45f50a39308f6e25af2ec9bfd5c4ec026a03aa8ebf81f7ed710ce127658d0d85"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/MTGSDKNewInterstitial.zip",
            checksum: "1e32e38ae3ba929fb9c0ef572b4347798d71867346ed42ff1a0ad3dd6ad5d6e8"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/MTGSDK.zip",
            checksum: "b2c4f606e4eb7ba315184bf4a8cf90681d8b8c1f4d985a3a0b70d663305f426a"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/IronSource.zip",
            checksum: "0ccd14b96991326d265ea3e13ad11212994346c988bb8f3156dfefd97b22a3f5"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/MolocoSDK.zip",
            checksum: "cab630942802342be58dd64a171945332f96f42c77319f7dbe960cfb08e45ac5"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/OMSDK_Microsoft.zip",
            checksum: "7ea54662c0590e5dcff024a7ba5ad300a823553263bd12df36d2be5282418726"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/AppNexusSDK.zip",
            checksum: "16842273a7ad6377717673e98bc192e7196c0c658e6e950a3ef4bfce7f4574e9"
        ),
        .binaryTarget(
            name: "AATSASDisplayKit",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.16.4/SASDisplayKit.zip",
            checksum: "8205146e8531a526d8a0b14fc31fa356232a7442dd68a90b15bbd26e6d1df848"
        ),
    ]
)
