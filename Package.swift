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
        .package(url: "https://github.com/AddApptr/RTBSDK.git", .upToNextMinor(from: "1.10.0-beta2"))
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
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATAmazonAdapter.zip",
            checksum: "4e7f5beb24f42caeb420d7b434c4feea3295758302ac028237fe515b534475b8"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATUnityAdapter.zip",
            checksum: "0ecb90142c5d6ca49e942fd9c2e9adac0a50e55179cb80f7f2023b0c6c466a8a"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATAppNexusAdapter.zip",
            checksum: "3226ba2becf0d9be696808df78d273793a67910019305ce7091796851634fee1"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATIronSourceAdapter.zip",
            checksum: "41b7829fc59fe2affd02d3782ffd26363b3fe29d91ea630d9489b461dc296a60"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATDFPPrebidAdapter.zip",
            checksum: "9c40898c3044eb658b6a4f717eeab456de1d5d040eea91afd92140b040b6813d"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATGraviteRTBAdapter.zip",
            checksum: "8267172acf14e8d1c3761a16f62bac9591ce96bb300f4eb6ea6c6f898f7ec8c9"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/HyBid.zip",
            checksum: "2a2ceb035b69827011b851df0d9668e41a69403287824fa22711dc66229c76c9"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/OMSDK_Pubnativenet.zip",
            checksum: "2facea57617a2dfee8d2f928f386583693aa7eba16553f45a3c597b40decd97d"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/ATOM.zip",
            checksum: "21c4eb541c7fc20fd99955c86c7de56e74a997511f5f0ce145566ef852596d2f"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/OMSDK_Prebidorg.zip",
            checksum: "383b32f7187f0398ebcf3e5abf1b5e451bd86e28ebde21326087ab23241afd90"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/PrebidMobile.zip",
            checksum: "145a56e5448d217d018c8316bc930c7017ce4f1c945ff1c4196f1d7c12c81965"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/DIOSDK.zip",
            checksum: "b564e36711bb9a40dffe556f6844678f8fe80a87b3b34fd8a02b0b9ef48b74bc"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/ConsentViewController.zip",
            checksum: "fe2f230f605dd0cdb391a0db74ba8de391cbf137b4e4bee923b26d2497b1e050"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/Utiq.zip",
            checksum: "b1f6c6077a99b4aa323f74a1696a2c5c54972aa80bb503cd8a502498c33af493"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATSourcePointCMPAdapter.zip",
            checksum: "23b2986d8178c48daa2840e73631b145948ecf470e34211eb0f424743c937ae9"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATAdMobDSPAdapter.zip",
            checksum: "28a8318726ce52a82a14aa8fe6dd5cae5afc540471f917e03ee5e20b35e45fce"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATGoogleAdsAdapter.zip",
            checksum: "0acf0e48201a1cdc6d94a2b51748018f5003bb6ca653d25ec81ead49d00e2437"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATDisplayIOAdapter.zip",
            checksum: "9248fa298a2a9cb22b1c3c0a4f43581e0ed9e1114e14318d7997b26a49330131"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATPubNativeAdapter.zip",
            checksum: "bbb279f772b6ea40d3304cb7d10bed9be0ffe11ccdf5a735a8a41b699528e70f"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATMetaBiddingAdapter.zip",
            checksum: "e1aaa4259d6cb01070b2ab4e77ebca16fb2d979af672c5a0090751cd299fb2cc"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATVungleAdapter.zip",
            checksum: "73c49cf71e787783b7af2b285484725b3ba90fd23a7be9ed397ef67e308581fd"
        ),
        .binaryTarget(
            name: "AATDigitalTurbineBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATDigitalTurbineBiddingAdapter.zip",
            checksum: "128b919611e785053fe52f07565d3433c2ee555d4eb7517f36e4b40bb621577c"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATMintegralAdapter.zip",
            checksum: "a1b47f5e7ae97d15407487384770363bd190620be691e4d30a52121ca42fdb3c"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATGoogleCMPAdapter.zip",
            checksum: "24a7fd173df89ac8552c0e40d1a54c35923a597eb5e82cc537e6ef465dd862e4"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATAppConsentAdapter.zip",
            checksum: "4bd3e4c7e52af6f906e78ebd80393019997c4efe7c7b166f3a594972a8a51897"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATMolocoBiddingDSPAdapter.zip",
            checksum: "1e1422e471af08e2afc639669340e748b41eae6413ee95741a333aadf565a271"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATAdMobMediationAdapter.zip",
            checksum: "cdbfc3cd3ba2d6e0644422af1b2e6719ebfb56025bb6337ba953d4096faa57d3"
        ),
        .binaryTarget(
            name: "AATVungleBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATVungleBiddingAdapter.zip",
            checksum: "f227e468a33503b7dea206f1459630de63fe24894369729d44f7f046e49d8b93"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATInMobiAdapter.zip",
            checksum: "6ea215b580d1c7fd0cfbd10f856f23dac627d302eac52a2868282818e5578a3d"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATUTIQAdapter.zip",
            checksum: "5463bffbf59adf6e8b860b4e1480b768f9742444bd6933efd5e9a460c3192c87"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATKit.zip",
            checksum: "901c102778e62bd77425ba7ef739dd035cdc46cb9383f08eb164a4dbb0373128"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATTappxAdapter.zip",
            checksum: "fe5a760bc73f4cf661c462414b4ec899d635448c647b8ef960012bc81e916322"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATAppLovinAdapter.zip",
            checksum: "fbb2ac4b6063e9c0fbf6231ff7c45be5cdce5dbc91d6ca8d46a68455a2a1db5c"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATAppHarbrAdapter.zip",
            checksum: "815f0e24b3f8d8ed09bc7a5681499f1c7d4d03a322151bcf50f91b787dda8aa7"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AATTeadsAdapter.zip",
            checksum: "a0548b4a0d7bd8decb6fef63e04e19812e4efcc6c67d6b78980882ff91f43067"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AppConsent.zip",
            checksum: "3536bbf31b8c43bd5fdd69c55bbf8146709f2c7c1fe18a8dddf7b3367824790a"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/UnityAds.zip",
            checksum: "4c2f9d77e63297865b32f03deb67d55a9b5695677d9fe2341041829db61b564b"
        ),
        .binaryTarget(
            name: "AATIASDKCore",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/IASDKCore.zip",
            checksum: "c10079651518e17651a41b68316d6f51f5b98d8e2ffb62d28aee534f1010886e"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/InMobiSDK.zip",
            checksum: "c8830dbb572be92c5c3ac95ffc876de09e1177e4b148c339c8ec3643d6f0d13f"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/TeadsSDK.zip",
            checksum: "1677f9340e1e6c94afd816a2453c7404f2d42fda0b0d91a429aa4c97305b8d95"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/OMSDK_Teadstv.zip",
            checksum: "d58d06de489c0d4d54e82799ccacb98d09f8aa4c056d8c52d74260cecbf933c4"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/FBAudienceNetwork.zip",
            checksum: "3765dbccbffffa5706f9985f043551a18f9e6238db110825a51441a84378dd9f"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/TappxFramework.zip",
            checksum: "16b295c499a22fd0fb4e86f5ee70b70c330d87198e9645d68eecdc223d2a6b17"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/OMSDK_Tappx.zip",
            checksum: "b75eba9d3140dada3fcab7f6b4935543c16277b8d1fb4563dcd5cc0867abc453"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/VungleAdsSDK.zip",
            checksum: "5397c910d69be70d8f4805942363b0137d29574ca86cd079aedda95ea51011e0"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/IronSourceAdQualitySDK.zip",
            checksum: "757ef8f1ed0cdb4ca93cf1a50317e373510d55fa5600d20310bff3482e10aa82"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/DTBiOSSDK.zip",
            checksum: "00549a0ca841ad71018ed8e680aa693650bff084258120ff18c4214b7ba03837"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/MTGSDKInterstitialVideo.zip",
            checksum: "52ff09816fecc47def9cfc8af20d03e04e921bc2dcbbd8575db278ad8f8675ad"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/MTGSDKBanner.zip",
            checksum: "ad3834e73db10c456aa2a73fd13317a0eaff041e27909370e6784df5f762ebe6"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/MTGSDKBidding.zip",
            checksum: "98543f6a8dd80ae3a203e17340d28bc754cca56b382b6726871e8297a6cd0546"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/MTGSDKReward.zip",
            checksum: "3fd05ebf0271f4d3c1a85e14589f93b64060f3818becd31326228addc6834c5d"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/MTGSDKNativeAdvanced.zip",
            checksum: "d29847c769fd5c8a09c380075c69afc83694b4e14d75976bfc8df2e43a16b03a"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/MTGSDKSplash.zip",
            checksum: "bde815cf7a1e14128fe08b4676ace043709d0d75e9cceee4665da7258cc49c9d"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/MTGSDKNewInterstitial.zip",
            checksum: "3637304549574df5061a1982a33e2eaa9f04e0688d06aee5c1b7caf384c119fe"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/MTGSDK.zip",
            checksum: "914f4f7808b0d61c67316dbfc764eb3641a1ba2b46e23bf87a8cf77bd9c6b96e"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/IronSource.zip",
            checksum: "cc3a4045f27fd0881a91dc433446d082492ca3fab23fbcc52b51d3c36b4ca34f"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/MolocoSDK.zip",
            checksum: "2f133961dbef8c52eddf3eec84cb317ac8a56e7406848ae2507a30678485c7c6"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/OMSDK_Microsoft.zip",
            checksum: "5d661d7d15aa76eb769cfea351d7efda3eb1b3abe6b9bf2aa27add8eb5a1cbc0"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.0-beta2/AppNexusSDK.zip",
            checksum: "fc41b3e46a1c83e462ab46986644cf2da3b6eb3245f8665181092d4b6c5777e9"
        ),
    ]
)
