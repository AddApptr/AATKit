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
        .library(name: "AATKit-GraviteRTB", targets: ["AATKit-GraviteRTB"]),
        .library(name: "AATKit-Moloco", targets: ["AATKit-Moloco"]),
        .library(name: "AATKit-InMobi", targets: ["AATKit-InMobi"]),
        .library(name: "AATKit-IronSource", targets: ["AATKit-IronSource"]),
        .library(name: "AATKit-PubNative", targets: ["AATKit-PubNative"]),
        .library(name: "AATKit-Prebid", targets: ["AATKit-Prebid"]),
        .library(name: "AATKit-Tappx", targets: ["AATKit-Tappx"]),
        .library(name: "AATKit-Teads", targets: ["AATKit-Teads"]),
        .library(name: "AATKit-Unity", targets: ["AATKit-Unity"]),
        .library(name: "AATKit-Vungle", targets: ["AATKit-Vungle"]),
        .library(name: "AATKit-Mintegral", targets: ["AATKit-Mintegral"]),
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
                                                   "AATKit-InMobi",
                                                   "AATKit-IronSource",
                                                   "AATKit-PubNative",
                                                   "AATKit-Unity",
                                                   "AATKit-Vungle",
                                                   "AATKit-Mintegral",
                                                   "AATKit-GooglePartnerBidding",
                                                   "AATKit-Tappx",
                                                   "AATKit-AppNexus",
                                                   "AATKit-Prebid",
                                                   "AATKit-AATMetaBiddingAdapter",
                                                   "AATKit-Moloco"
                                                  ]),

    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", .upToNextMinor(from: "13.6.2")),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .upToNextMinor(from: "13.4.0")),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", .upToNextMinor(from: "1.33.1")),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(url: "https://github.com/AddApptr/RTBSDK.git", .upToNextMinor(from: "1.10.1"))
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

            .target(name:"AATKit-GraviteRTB",
                    dependencies: [
                        .product(name: "RTBSDK", package: "RTBSDK"),
                        "AATGraviteRTBAdapter"
                    ],
                    path: "./Sources/GraviteRTB"),

            .target(name:"AATKit-GoogleCMP",
                    dependencies: [
                        .product(name: "GoogleUserMessagingPlatform", package: "swift-package-manager-google-user-messaging-platform"),
                        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                        "AATGoogleCMPAdapter"
                    ],
                    path: "./Sources/GoogleCMPSources"),


        // AATMetaBiddingAdapter
        .target(name: "AATKit-AATMetaBiddingAdapter",
                dependencies: [
                    "AATKit",
                    "AATKit-GraviteRTB",
                    "AATFBAudienceNetwork",
                    "AATMetaBiddingAdapter"
                ], path: "./Sources/MetaBidingSources"),

            .target(name:"AATKit-Moloco",
                    dependencies: ["AATMolocoBiddingDSPAdapter", "AATMolocoSDK", "AATKit", "AATKit-GraviteRTB",],
                    path: "./Sources/MolocoSources"),

            .target(name:"AATKit-Tappx",
                    dependencies: ["AATTappxFramework", "AATOMSDK_Tappx", "AATTappxAdapter"],
                    path: "./Sources/Tappx"),

            .target(name:"AATKit-Teads",
                    dependencies: ["AATTeadsSDK", "AATOMSDK_Teadstv", "AATTeadsAdapter"],
                    path: "./Sources/TeadsSources"),

            .target(name:"AATKit-InMobi",
                    dependencies: ["AATInMobiSDK", "AATInMobiAdapter"],
                    path: "./Sources/InMobiSources"),

            .target(name:"AATKit-IronSource",
                    dependencies: ["AATIronSource", "AATIronSourceAdapter"],
                    path: "./Sources/IronSourceSources"),

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
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATAmazonAdapter.zip",
            checksum: "888a98d76f1e10bd3ab299ad5ace1036e9b10c66b88aa4f5e6e387756baf1398"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATUnityAdapter.zip",
            checksum: "5f2f918990e058ac7469e8b7c6e2fc2526421129f3d0b8b45d0b74b8f9e986e7"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATAppNexusAdapter.zip",
            checksum: "86fc1c39bda65fa32423130b7f9c294d8afc479dd1c2345014647afe6d61492b"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATIronSourceAdapter.zip",
            checksum: "7931db4228e7f02546b0b7052fa1af65317cf7515989d340e2f2f52d923c073b"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATDFPPrebidAdapter.zip",
            checksum: "d5adeeca9a95c96501611c793f99e38f5c19a24df59a16e60526c98bd6b083dc"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATGraviteRTBAdapter.zip",
            checksum: "8b097a8098ed780240f2fd2e066c79c426402bb31937b0dc87a50175a1f3a815"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/HyBid.zip",
            checksum: "70bd459b2901f2dec7549e9f59d9a19aa461913e74ce814aad3d47cb40aa2441"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/OMSDK_Pubnativenet.zip",
            checksum: "abda17775830a13a25667038a81954d6142f59a5687ef4d96bb9218d29701c10"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/ATOM.zip",
            checksum: "2faf72c5bd7f349903c27dfd7df52e407831d88795781849b5683f5d6a445e2f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/OMSDK_Prebidorg.zip",
            checksum: "df40eb66eee0c7d5f3b55649b5457c31ea0eec8559bfc8a19240e0aed525639c"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/PrebidMobile.zip",
            checksum: "835536d74a8b54384bce2c5e6a1f79929f7a486e6d69ec2c3260fb0ea2f61853"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/DIOSDK.zip",
            checksum: "7301c68f59b26042a8f18a715aa4f207707b31e49ec6cca25b7a477737d80361"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/ConsentViewController.zip",
            checksum: "4f1ca440d83b68737b7707990eb5c52bba1f8f1e3f111f7d879df55e89c1c523"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/Utiq.zip",
            checksum: "5fd57876214d5e9dd345d65d08097e1b23c60262e6d84d69dc96d1a6bc07eefe"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATSourcePointCMPAdapter.zip",
            checksum: "e65a9159f4cce383d11da91ce2866cc4d78f0ff3e1c4c23c63b66d19b4428b20"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATAdMobDSPAdapter.zip",
            checksum: "7987793e8124e42134fc2c32542a4e58e91154a39cc72fb796c6f1e08372eba0"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATGoogleAdsAdapter.zip",
            checksum: "270bb75b78604dd71982b24cf13a05145791472072185641471e5564f33d12c5"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATDisplayIOAdapter.zip",
            checksum: "adb9da44c159a5896bb7d50fec41455a165928afe657b1657f1853042d0b7b43"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATPubNativeAdapter.zip",
            checksum: "10e5c9298fe6d3e72cea050bb7c92272188eaf3d91ea9b5c2505da19759837e9"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATMetaBiddingAdapter.zip",
            checksum: "3f97e261ae9e566c0662526759b1f28356e3c3fa0b3ab1bf8012836c68c955c7"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATVungleAdapter.zip",
            checksum: "5692c82aa8406f2c332ef9323686c5417dd60fa389ba8ee76aec1c7a0a46e8c9"
        ),
        .binaryTarget(
            name: "AATDigitalTurbineBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATDigitalTurbineBiddingAdapter.zip",
            checksum: "250f3c6785dd9f69061b56e473f1c412715b5227f6b7ae0e33c60f1d218ccbd6"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATMintegralAdapter.zip",
            checksum: "9758240bae9d167787b69e16c96093aae4554c07e73d15fa350e297ca8fb04de"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATGoogleCMPAdapter.zip",
            checksum: "26a570e4ae26bf5fd47cf4d1f48c546e217713a4a9eb98a529d36fb3dce8f749"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATAppConsentAdapter.zip",
            checksum: "3a0bdf4943032a456f84e136c994c3d39b762c0e5314cb056ebaa62bfbf942d6"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATMolocoBiddingDSPAdapter.zip",
            checksum: "2de1ab96c1ce40b5265763062a2de664f463cdda376def9db5eebcff33f86314"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATAdMobMediationAdapter.zip",
            checksum: "c59a52ae6162edb9fc495301e91107e4ca126d7ec144d20e091caff71d262d6f"
        ),
        .binaryTarget(
            name: "AATVungleBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATVungleBiddingAdapter.zip",
            checksum: "48f838fae8034f1ed208c77bd15913da68bbcb45a32faf1b49732401c52a18a1"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATInMobiAdapter.zip",
            checksum: "4ff927e01dda6123c82a66fd7d1946a7f68257de080c7f278e138682eba88f0e"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATUTIQAdapter.zip",
            checksum: "e92572b9d9746489fe3082eca561f278bb91a1c5a034e56d52a51476c0bdb12e"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATKit.zip",
            checksum: "1276e2ad443369bfd245abb78be4fa4c2024855d262395beb1e2cd113415ebc4"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATTappxAdapter.zip",
            checksum: "7b4e2bb9732851d8df9575d2aaa5585380f6e927b8cf1ababcc6a229e595b6e4"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATAppLovinAdapter.zip",
            checksum: "e7bc1274d5e33e9300391d9ded3a1044df5b1df6c6e98a9faceb73b59abd931c"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATAppHarbrAdapter.zip",
            checksum: "745c3f3892caa0f6ed3ce21bc6383d539dda15f53680bc81aa662a3d1461610e"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AATTeadsAdapter.zip",
            checksum: "4e13886bfef88823a143d3c688d81f23462b423396f7eef3684e5085cf88ac96"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AppConsent.zip",
            checksum: "1c8eaf816ddfbff9b70e9a28ce4f03a7ff45f17ad6f4c9976e05d326fe38f964"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/UnityAds.zip",
            checksum: "6f6ab2c998305e4e30d9e444f58a735ee82b1c83fcc2df8132a07c945e9b788c"
        ),
        .binaryTarget(
            name: "AATIASDKCore",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/IASDKCore.zip",
            checksum: "92089bbbb7505be2b725b82c963d88457491de7b399d2d73a671731035bd362a"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/InMobiSDK.zip",
            checksum: "648c298744088b8d9885bc2a3ed88b456e3db66aa681f4d36a7c4ff3e3f643d0"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/TeadsSDK.zip",
            checksum: "3c3c3e38b7e05648238abd960607d4edb19fa6c9a58c4222d8bd7fa74f074c7f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/OMSDK_Teadstv.zip",
            checksum: "0679d3e5a6171613443e8dc1ff7888a61c6fd40e40b19505d8615dad164b745f"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/FBAudienceNetwork.zip",
            checksum: "4551f30e22dcfce2b5b031326c1142c68346f8edb96efb7d701d96a4bb57dc95"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/TappxFramework.zip",
            checksum: "dd269cb67822a69cead99e94e5f9b5908f4c431b34d2ff9e5ea8b1a8596ca584"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/OMSDK_Tappx.zip",
            checksum: "78d898a2e3d3ea82c01e5a7964f51fbc8270f291a022084a33541685d0004888"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/VungleAdsSDK.zip",
            checksum: "1203987b0fc0553bd28c2322c8dbbaf90c1fb2686711c4608e488cd25a10f940"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/IronSourceAdQualitySDK.zip",
            checksum: "0a63f3a2ad18c99accd90b1bbb57b8908f1b25d11c9e31a5050b98bc57983748"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/DTBiOSSDK.zip",
            checksum: "a592c9b3980094534c26930f0295390727c751bc45dfd8f1a7c25309a3952ddc"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/MTGSDKInterstitialVideo.zip",
            checksum: "44ea342e4b68c13c9c7f1d517c91f8750b4227feb1d2878710958cc3e3041537"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/MTGSDKBanner.zip",
            checksum: "3154f002560e1d1ec83fe995ea2f1e2fe3b1e3964e5c67b22fe31843738536ac"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/MTGSDKBidding.zip",
            checksum: "dcc2469f4d4a9a86bf2e3fdfd9ea9256afca081cccde5fb1e89c25902a5d1363"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/MTGSDKReward.zip",
            checksum: "457821e621d475ca89100cecfd79aef2b4cc0d2c6621754b5820a41c22f1c012"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/MTGSDKNativeAdvanced.zip",
            checksum: "e3c008ca86b3ae242c176c76f7c78e9d57f5ce82ce6090ed6e700a6f9d2d065a"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/MTGSDKSplash.zip",
            checksum: "aa403c654cf3c55cfd79a975ec71038385eb5e7ac638107267183746ab8fde2d"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/MTGSDKNewInterstitial.zip",
            checksum: "1d552fb4e2a1f542fd484d4cb4ce49ec8c9d11deaeb95731bea1923dee4e01df"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/MTGSDK.zip",
            checksum: "7d39fe92cbff1ff3f0047fd151e47d600d9f970309e20122ff715f401ce8275e"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/IronSource.zip",
            checksum: "60b298bce82279dafea818605d18cb7bad53cd8071c1f1faab2865124659de6e"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/MolocoSDK.zip",
            checksum: "ee8d08aeaebc7800f9cbabe6f641c56f02d97f95c7c42889b8b8fd5f3104125d"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/OMSDK_Microsoft.zip",
            checksum: "52731c82e40b30c99acdfe3d11a02513843caff6281a560e814170a369a445ae"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.1/AppNexusSDK.zip",
            checksum: "230ecca0c810bff35db5c7f2f543e3f0cc4fc2e67a3e5dd4b2b0b8a620577c5c"
        ),
    ]
)
