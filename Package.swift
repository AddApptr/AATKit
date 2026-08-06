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
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(url: "https://github.com/AddApptr/RTBSDK.git", .upToNextMinor(from: "1.11.0-beta1"))
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
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATAmazonAdapter.zip",
            checksum: "732575038ac68ab2e944bdf7f4021dad16778dd41b186d1397c2ff4fff89c855"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATUnityAdapter.zip",
            checksum: "6092dfdffbefcd6c91511cf6d7f685c4e4bc16a23d677b4fc748741b728daf72"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATAppNexusAdapter.zip",
            checksum: "13fd81a2dcfb4feb0f2b2ed1b8722e096d23c5f3e9918d4eaf73e13cdb707ebc"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATIronSourceAdapter.zip",
            checksum: "8a1cacb7fa506991c45e79355378472370ce04aa32d65c53253c8cd970e5783a"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATDFPPrebidAdapter.zip",
            checksum: "bf7254209515297e05ec47c6f9806c5eccc2acb616631642871c55834982c334"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATGraviteRTBAdapter.zip",
            checksum: "22e1ba43ce29a6869f71b3e1f202a59222fa05af4350d096612280558a0c4ec8"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/HyBid.zip",
            checksum: "631224576360b0729bbdc92b68becfab958332781f850352adf5fb55025f6eab"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/OMSDK_Pubnativenet.zip",
            checksum: "0547e6a47bfc5229691b1093b2a910158b01fc13e296beda1be60ef2a4c70509"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/ATOM.zip",
            checksum: "abd62c855e3115964e2fe64527741a4a0aa25263585e670e74557cba9502ce94"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/OMSDK_Prebidorg.zip",
            checksum: "78468975a279519fd4663c6fa1edc0e10c9b74f436f149d0f1064bd6e2d7fe5d"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/PrebidMobile.zip",
            checksum: "4f912e08e9015ce795aaca8386df5be942c7961ef6fe00a9c4f9ce633063398c"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/DIOSDK.zip",
            checksum: "d4603329c8a8756cc36c43f9d82e85890c3829d2e231af9a04ac1de4681ae187"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/ConsentViewController.zip",
            checksum: "a75ff6ba70cbe8ba4dae6ebb2a759ee08c7970675d73072af6ed812504f4dc3a"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/Utiq.zip",
            checksum: "37ba22b95cb05df267729b417d26f92d483ba721bead7d8cfd26c5ce40aca996"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATSourcePointCMPAdapter.zip",
            checksum: "8db500fdb2a5d9332a24e4fa3032bf269a0fd8047c48fd17b4218c2dd4671e0e"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATAdMobDSPAdapter.zip",
            checksum: "b6c273d6494c3332f0c7eba96498595817b2f5cb5506d26294f8ace36530a688"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATGoogleAdsAdapter.zip",
            checksum: "342480a8808ec67b4568c2d1de791a259ee5dc21cedad93497e5be5de92a25f3"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATDisplayIOAdapter.zip",
            checksum: "299a9c76ad58eb8410c9f36b45b6b8c53e76216868a4b5df46de7b88cef58e42"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATPubNativeAdapter.zip",
            checksum: "a5a47348f0065e18797c53b6d08b5e7055c0e47c4ae2189d3a7f05b3f1c29971"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATMetaBiddingAdapter.zip",
            checksum: "ced14e129a7acac992ea0ca2d9a886c81543626068983915b538697373a7f558"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATVungleAdapter.zip",
            checksum: "cf00de31b727f7b8851536e91a122ff35bd1e67ccf851e50d58b82301d58e754"
        ),
        .binaryTarget(
            name: "AATDigitalTurbineBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATDigitalTurbineBiddingAdapter.zip",
            checksum: "78e28815472deefd90cce49f38c15c2c48899853f3175f9c9e4bef34aad2c29a"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATMintegralAdapter.zip",
            checksum: "9e348f487b48137fd4e7bc4f30aa8bf1cc1839e2734450a8acfb30b1e4e7b17c"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATGoogleCMPAdapter.zip",
            checksum: "7593ca79eeeaebcb4fc75716c410e97db31770c23888533d608ee4190910220c"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATAppConsentAdapter.zip",
            checksum: "8ee3a9f616112feea58f987d1d220943e3fa0a7e12aa07fd81c8313bd500087d"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATMolocoBiddingDSPAdapter.zip",
            checksum: "325aa911317532e2e1e70a9d1c8cb415a5d6883d8453c2d657073ee60de57ee2"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATAdMobMediationAdapter.zip",
            checksum: "f02a8e10a118c3ec7d9efc9e34bd4f47b7fe8ca0b220a6d1109438b2264a5730"
        ),
        .binaryTarget(
            name: "AATVungleBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATVungleBiddingAdapter.zip",
            checksum: "c3017dfa445c2571943668367fc69b1b996753e8b5d5100bb76a6910474b1e3d"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATInMobiAdapter.zip",
            checksum: "bb74fe2cb44a88e003c0f6ce375eeeafc403bd3cd71e996f2a61f1840ca64fbe"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATUTIQAdapter.zip",
            checksum: "bed09256c1f5c023568f035513560d7806104f7e3b8c2a7413efabb0b839bdd9"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATKit.zip",
            checksum: "11c31328dfb3d35fa26e537b116b6671ff43e17a7cce30aa93245e7b853b1209"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATTappxAdapter.zip",
            checksum: "895b21dc8558a29bc8e688a39768088c37e2e74493890642bd9f645978c531bd"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATAppLovinAdapter.zip",
            checksum: "ade3d232a6b637bdfd3163ed5298a70ca2cb0f12724f66b0a1a11c7c2dacd620"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AATTeadsAdapter.zip",
            checksum: "38ca9552bbd7b244c6503bf6660b5ff91cf43c34c451b6d727301074d5bc037c"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AppConsent.zip",
            checksum: "7dbda2ee21621afff0db28527247901dc4fe3d32008f6f96f286d05817b233ca"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/UnityAds.zip",
            checksum: "492e96c8c12fe6005041dab6a3cea940e10cf3b45b210f2998bc54f637f69042"
        ),
        .binaryTarget(
            name: "AATIASDKCore",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/IASDKCore.zip",
            checksum: "d7c4ab9a0ca87a5d2c21b0840ae18f149ad20fefe20aa6c857f6766924f70375"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/InMobiSDK.zip",
            checksum: "d3cb199e09b901c3934d814bb669afc79156885ea28c3252b9162f12f811ec8b"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/TeadsSDK.zip",
            checksum: "667eb00409bb7be292423ba5e07f38998cff3c4a7fdd3f50837ae52dea640a52"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/OMSDK_Teadstv.zip",
            checksum: "3baccaee9b75017804b48f4e43ffa10854a7372040d8f9a864c2b78a9c38e628"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/FBAudienceNetwork.zip",
            checksum: "b25813af9b412e2c6c25ce1b790bfb37f8889aec3cd0000cab2b12db7de08b0f"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/TappxFramework.zip",
            checksum: "f0a76919551290e4d960eaf7300aa9b4666caf32f256609ef173cd3b213e2b06"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/OMSDK_Tappx.zip",
            checksum: "2735c98536139716a3d9f93d3b7b1d5175a761826887f91fe4a173f56c0acf0c"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/VungleAdsSDK.zip",
            checksum: "343e9a6bb687819a627d4092ff55a61c4a76145757dfd948a899fc2b87097a50"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/IronSourceAdQualitySDK.zip",
            checksum: "a55f07887788e0971a383def198e13af87bec0f1a2ac31c35a61b5da3f4c0b2c"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/DTBiOSSDK.zip",
            checksum: "23a489a061d71d20adadd4332ffb25611fe45ba2b2762b70ecbbb959fa8fd693"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/MTGSDKInterstitialVideo.zip",
            checksum: "b6f3e87a98312c173f6044fe42c60a0fc8d6eb96a573b533d4c46e7e476df32a"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/MTGSDKBanner.zip",
            checksum: "1378c831d0c1477c0a3d3a7b3e3df2706c67b15932906225fff8af4242884149"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/MTGSDKBidding.zip",
            checksum: "c19252d4ea7c25cf6440aff073e6fe101f4981a27aff7f21f14ac72df9a5fb39"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/MTGSDKReward.zip",
            checksum: "882f16a712ce5d302b2813b7f53d46fd121bf9349fc1b5b59a3eaef94d4b7ba9"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/MTGSDKNativeAdvanced.zip",
            checksum: "e3c008ca86b3ae242c176c76f7c78e9d57f5ce82ce6090ed6e700a6f9d2d065a"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/MTGSDKSplash.zip",
            checksum: "8dcedf49d1463182e3e58887a6f412fe9e07ee4b781e19445c5bee068fe3875d"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/MTGSDKNewInterstitial.zip",
            checksum: "8776d1fd346cd1ea9c5fec72ae1fb22122da1e6d16e7291a30fef188d9822c86"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/MTGSDK.zip",
            checksum: "ab73b1e4a7e2fbb144cdc1638a0f50af3d817d4de6f5e8c8ba7baa8637ca87e9"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/IronSource.zip",
            checksum: "0c598f4f1246476229d849d5f0dcefbbc411c2f363e01e9c9bd65880c2fe2da6"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/MolocoSDK.zip",
            checksum: "f5cc0b993d8c2356f0d744e37194fd91c2e1fc948eeb2f131d45aca8a867efd6"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/OMSDK_Microsoft.zip",
            checksum: "e39679cff0c44cdedc0c60e59000cda9f23612eceabaae52e4e4da23d49fde46"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta1/AppNexusSDK.zip",
            checksum: "d6c61b9d0f330e87149fc952167d474253c43abb6b4aadb98d96005970368654"
        ),
    ]
)
