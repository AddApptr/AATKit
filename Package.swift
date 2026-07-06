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
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATAmazonAdapter.zip",
            checksum: "bb3b4260f84a719439db1569e562ea4fe9258edcfe43b28c0818eec1a80c336b"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATUnityAdapter.zip",
            checksum: "234520bf4701c7473ba36a7c3cf01e2a1173c366cb8972f5e5279c99d8c7946f"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATAppNexusAdapter.zip",
            checksum: "8cfb8e27c120b643a0acdfdee83c013ffd754c3b6e4d3542062412657d6ec22f"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATIronSourceAdapter.zip",
            checksum: "c79e9c89e63187b591fbe65a9b7c1a093c2670810b6027ecec6dc6170b16a895"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATDFPPrebidAdapter.zip",
            checksum: "e20921876a59e4b01448b1e5b17014404ae3c6e67b7e1940b19b42dcc57aafe6"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATGraviteRTBAdapter.zip",
            checksum: "9889ee7c996dff1499465bd84880bcebe95b1ed54895f4e2925dc9d29d70919a"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/HyBid.zip",
            checksum: "f9ab3762f81fb6d47b95e55ec12be6e574eab96a0fe5f1ad5af35be6c4cd4b39"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/OMSDK_Pubnativenet.zip",
            checksum: "e3cda3c4c5f0e6068116f578ee15599ae8c7c616eaef99157eaa73ea0d291483"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/ATOM.zip",
            checksum: "19290dd591a0f8a21cc59352e68dd00c1e4eb31634920458ac0a4aa6c79ebc6f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/OMSDK_Prebidorg.zip",
            checksum: "ad9c718f3b08e34703b7000d1213998edb422a10e6950c62293a0a6eb8306f33"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/PrebidMobile.zip",
            checksum: "aea882e50cf51695ea94161e409e2f65351f43f32e34fca4939c45696888f125"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/DIOSDK.zip",
            checksum: "1da8deb23c5256e27182b77b48b85963168cae4209ebd5ca4f276ee0de774ee6"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/ConsentViewController.zip",
            checksum: "9546de90357b02fd8062bd7fca1ee32ec8d8203b4f89c8fbafae06bfbbab7941"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/Utiq.zip",
            checksum: "3c78dd83054b70dbef57246247fa64d3b9f6f44496230c4843f0317305a214be"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATSourcePointCMPAdapter.zip",
            checksum: "96a66290562080088569362b791c326fbd643f591a249a2bfbe5afd44a1189a4"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATAdMobDSPAdapter.zip",
            checksum: "0e0cb014b39aa121cc0e3d33fa410e5604e70c619c91cb682a8f84dbf5d6dfed"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATGoogleAdsAdapter.zip",
            checksum: "bb1e3a32dbedcd4f32da5a4b6ecc81a34f0137a63e3ae8990d8ba76bf3385ba2"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATDisplayIOAdapter.zip",
            checksum: "8fb42fefcff9c311fc82273e90ee62e8f9e5c02d51fe8a4b14d98c5992961ebf"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATPubNativeAdapter.zip",
            checksum: "372ef1e2891611f5f6959e0214448ab7f31837a4c5fedd4648c13b0b1d091a44"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATMetaBiddingAdapter.zip",
            checksum: "a619b6a8258db24b0bb641327f5f4af000a7f062ec4e229e33175ea6552c3947"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATVungleAdapter.zip",
            checksum: "7c0081e283929d3c3bab6d6f0a702b59e184595d3e4ec7a5ed555a5cbf41c125"
        ),
        .binaryTarget(
            name: "AATDigitalTurbineBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATDigitalTurbineBiddingAdapter.zip",
            checksum: "20c8acd122077c6fefbe0134f51498c3e1319912657ca5ff4c134428711c14ef"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATMintegralAdapter.zip",
            checksum: "680bbdac260d602e04f692ff274f3e817cebda2f7bdd531069f97b0062ad03ed"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATGoogleCMPAdapter.zip",
            checksum: "d40fe3e63b2a054e7050f2e7bfb63a05e9aae053951faee438403764e41afe9a"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATAppConsentAdapter.zip",
            checksum: "86cf8fdbbd874c2a7983fc756769a743c084a4b69016577577e65792cb07b93b"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATMolocoBiddingDSPAdapter.zip",
            checksum: "fb692d45c179c6526fa4880c44e35a7d76b004caf6f1bfc14c0d5a072eca3db5"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATAdMobMediationAdapter.zip",
            checksum: "7055275d4a6fd523304411219b4b6f4686d4a9db5e621a6b358b86d00a13f0c5"
        ),
        .binaryTarget(
            name: "AATVungleBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATVungleBiddingAdapter.zip",
            checksum: "b9f04e4ac0514b993d344a4dcbf478c2fd00db4cc2e56f138d2a592b60ea58a6"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATInMobiAdapter.zip",
            checksum: "b2058e23656c0e88e0259849e446152640782bb53b49397664522b5975cee723"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATUTIQAdapter.zip",
            checksum: "71f60454103c6f5b6bdbdf53afb05790ea59f7c36d638cec67d72db9905ba357"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATKit.zip",
            checksum: "f29d8241284438c910775a67cc4fcef164f0d9e0a8bbac794469a974dad64622"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATTappxAdapter.zip",
            checksum: "fb0a85b147e6cbea9ff1ca46e939aefb2ef5b6379fbb3142535b856184bdbb28"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATAppLovinAdapter.zip",
            checksum: "4cf4d41490ddfa44bdc68201e3e3d5e8986d0c9a262922492a01b1e7273656ae"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATAppHarbrAdapter.zip",
            checksum: "23009ef47e57b1d5bd34e031b4aa11c16acc3ae309382f1f27fe82de73ae1328"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AATTeadsAdapter.zip",
            checksum: "7b66ba863af851c9acc17addc6fac26adaa0c304d8992cc70fda143c90419f1b"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AppConsent.zip",
            checksum: "bb70f829c340e7f16e5481a91e1071db211902a0da2980bfd79a13cc7859f40c"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/UnityAds.zip",
            checksum: "b607291ce1ff56dab5bc81673fbf787d90666a1b78701bb9d3b36a50116d7de7"
        ),
        .binaryTarget(
            name: "AATIASDKCore",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/IASDKCore.zip",
            checksum: "e6a83d9f27cb3d042ed6eba67580a40779754ebda9c681db60042530b01a6750"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/InMobiSDK.zip",
            checksum: "f082083c300b40d1f5ee73f45bc1cb115c27c657439937447a6ff764d785b6d5"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/TeadsSDK.zip",
            checksum: "a3f3295c07a017c13b7d418813d292ca653e0ad9c7b102301c210e07250c85d7"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/OMSDK_Teadstv.zip",
            checksum: "f4df55a935289f9ae9e86031b013ee73793971cec1ec4e487dfb6ea9db416e3f"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/FBAudienceNetwork.zip",
            checksum: "33102bcde7aadeacfa82ab46abd051bdc59c8e985e4282cecc91e062bdac078d"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/TappxFramework.zip",
            checksum: "5e9f0463f8759d0406e9cadf217bd885ee9a27752c087ad6c3f1dea45279c626"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/OMSDK_Tappx.zip",
            checksum: "5b55b66b3ac425fbd2926f80d3fe7d58cfd10fe6f1c82c7414f9b4264c390b9e"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/VungleAdsSDK.zip",
            checksum: "69dbbe37ab6331e996ee1587b6e958cc0fba19e1af6712332430aef0d2f0152c"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/IronSourceAdQualitySDK.zip",
            checksum: "f35b92742376dca533a30acb0661b7ae3bd6b9b95dbfc7bd819e849c01a8bab4"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/DTBiOSSDK.zip",
            checksum: "e9a3f2ee4de22a55719549ed7d433f3776a3624e32f6dd32427c01ac31640eeb"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/MTGSDKInterstitialVideo.zip",
            checksum: "291eab1a8ef7675c33b224e85e5269ef83ee51561c5c6e04dd3892ee1d655312"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/MTGSDKBanner.zip",
            checksum: "89fb5cc7997c48d02c3ed144f12d20d4f058cd56b3a3fbd7feb7e16c46b280d4"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/MTGSDKBidding.zip",
            checksum: "6bb575bb191e01fe5e46b0e7086e3f862de78a860f248bb70dd8fa43f7abc7fc"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/MTGSDKReward.zip",
            checksum: "46009c7d08ff2d935e436388572188e8195d768a738a706f5f662d70b862d51b"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/MTGSDKNativeAdvanced.zip",
            checksum: "cdc773b3535af3b030614a66272feb197eaad9d281da4c0f603c496b9b935d2a"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/MTGSDKSplash.zip",
            checksum: "d5f2f1e4cd40de34c751d02ad53637856b71f748d2a498cb5938546325682b85"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/MTGSDKNewInterstitial.zip",
            checksum: "9ac35898db86c6546f2df53c50f576d28cc3fa988a1c0ec746e07561b0dac2ad"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/MTGSDK.zip",
            checksum: "1d7f9faa26724642548aec5292f6ea96ace442f4da4353bd7dac0eac209568a9"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/IronSource.zip",
            checksum: "1aacd5da0fababcf90860da780a2bb53a01457c86845912128b5bdb5662a8915"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/MolocoSDK.zip",
            checksum: "d3da4e057a1d91c3722b1f2d69396e4b9e3d0f0f3bf56880fda7097096aedf35"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/OMSDK_Microsoft.zip",
            checksum: "cffff013d5ead85d394afebc1ed4a458b6742c49a67068801b889461919cd3c8"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0/AppNexusSDK.zip",
            checksum: "014b06663fe9780cf81c164b7a8fb16e44a312b1cb2ff495fb9ec0836131b50c"
        ),
    ]
)
