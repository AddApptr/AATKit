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
        .library(name: "AATKit-DigitalTurbineBidding", targets: ["AATKit-DigitalTurbineBidding"]),

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
                                                   "AATKit-Moloco",
                                                   "AATKit-DigitalTurbineBidding"
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
                dependencies: ["AATKit-GoogleMobileAds", "AATKit", "AATAdMobMediationAdapter"],
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

            // AATIASDKCore is the Fyber Marketplace SDK the adapter links against —
            // the CocoaPods subspec pulls it in as the Fyber_Marketplace_SDK pod.
            .target(name:"AATKit-DigitalTurbineBidding",
                    dependencies: ["AATDigitalTurbineBiddingAdapter",
                                   "AATIASDKCore",
                                   "AATKit",
                                   "AATKit-GraviteRTB"],
                    path: "./Sources/DigitalTurbineBiddingSources"),

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

            // Waterfall and bidding share the Vungle SDK binary, so they ship in one
            // target — mirrors the AATKit/Vungle and AATKit/AATVungleBiddingAdapter
            // subspecs, both of which are in the CocoaPods Default subspec.
            .target(name:"AATKit-Vungle",
                    dependencies: ["AATVungleAdsSDK",
                                   "AATVungleAdapter",
                                   "AATVungleBiddingAdapter",
                                   "AATKit",
                                   "AATKit-GraviteRTB"],
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
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATAmazonAdapter.zip",
            checksum: "f13d4bf62fed607cb7840d647555f2adcd5ca2ee838f7118e817b9776f97ca3d"
        ),
        .binaryTarget(
            name: "AATUnityAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATUnityAdapter.zip",
            checksum: "ad1f0005315fd9a76b614726c457130dadcb877d9bad6e2ccb002ec5ec6bc98a"
        ),
        .binaryTarget(
            name: "AATAppNexusAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATAppNexusAdapter.zip",
            checksum: "5a10527bc32ee6b54a2512f1ecf25659505a6cb66683a602b93614ef4a2d8a97"
        ),
        .binaryTarget(
            name: "AATIronSourceAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATIronSourceAdapter.zip",
            checksum: "a79a07e87bc958f3aaa880db9c81e534716d5cd24c16106ab00f7c40334f104c"
        ),
        .binaryTarget(
            name: "AATDFPPrebidAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATDFPPrebidAdapter.zip",
            checksum: "d43d05fe3be98bf6c76f6d60a256cf60f5957503c571a8ddd8a9a83711b7391c"
        ),
        .binaryTarget(
            name: "AATGraviteRTBAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATGraviteRTBAdapter.zip",
            checksum: "94c9364cad20b9f642ddb644f7c634281cb7dc7fb934cdbb88dc171d3eaab836"
        ),
        .binaryTarget(
            name: "AATHyBid",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/HyBid.zip",
            checksum: "6ee006cbf2cbb7aacdb6d72c93620afea89f3da610036f4308dee5353ef1b98c"
        ),
        .binaryTarget(
            name: "AATOMSDK_Pubnativenet",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/OMSDK_Pubnativenet.zip",
            checksum: "b711617df549e86ac1e1f9d21c9e569dea1a0c035c21450ba684993fd21b38cf"
        ),
        .binaryTarget(
            name: "AATATOM",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/ATOM.zip",
            checksum: "ee14a0a7fa2668a4de1c07b63896537700a3677cb3cf9b96ca8f0c1661a1471e"
        ),
        .binaryTarget(
            name: "AATOMSDK_Prebidorg",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/OMSDK_Prebidorg.zip",
            checksum: "765024ece255c9df435928675af07ea5b905e95c94c683fb2f5c6b0c85c0b072"
        ),
        .binaryTarget(
            name: "AATPrebidMobile",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/PrebidMobile.zip",
            checksum: "0c48288bf5c78642df52ba6b2756734471d34b1232341d04337eb781cfb7f3a7"
        ),
        .binaryTarget(
            name: "AATDIOSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/DIOSDK.zip",
            checksum: "27e2e0508ad18930dbd3743c1691c51bd6a1458b5b3fb6330633835b02a2c30e"
        ),
        .binaryTarget(
            name: "AATConsentViewController",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/ConsentViewController.zip",
            checksum: "4cb302b252f5b123d75efccc2f09a566a1c2f6b599b3ede94abe3fb828b00766"
        ),
        .binaryTarget(
            name: "AATUtiq",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/Utiq.zip",
            checksum: "8ad67df809a9261f731cb721e2444ff91ed8b24a78d46e6db579e501b1255df9"
        ),
        .binaryTarget(
            name: "AATSourcePointCMPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATSourcePointCMPAdapter.zip",
            checksum: "b124b88b8e78d0dba754123afe0192d6d6aa148490aa10ab7d19eb7606883030"
        ),
        .binaryTarget(
            name: "AATAdMobDSPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATAdMobDSPAdapter.zip",
            checksum: "a5a5ddfa46fd45bbc3492bc17593e52a748e020794eb4521f33bcdc022d75c5b"
        ),
        .binaryTarget(
            name: "AATGoogleAdsAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATGoogleAdsAdapter.zip",
            checksum: "80efd1d74da73a616ca27152f1202ac5435c4bb7e301376baa774ac7ebccbb60"
        ),
        .binaryTarget(
            name: "AATDisplayIOAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATDisplayIOAdapter.zip",
            checksum: "353d42951d4df7c1fdddffd5f619bf3c98db800b968d249c9d356772ccdcbb42"
        ),
        .binaryTarget(
            name: "AATPubNativeAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATPubNativeAdapter.zip",
            checksum: "4cbdb7186373e36e8626aecc5acbd2661c3a869d166d9b9be44823bc1e987b4f"
        ),
        .binaryTarget(
            name: "AATMetaBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATMetaBiddingAdapter.zip",
            checksum: "cb6c510956b68ec6dc4853f0277e150fad9393c6f01b890e031044320f01d085"
        ),
        .binaryTarget(
            name: "AATVungleAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATVungleAdapter.zip",
            checksum: "dcf41a225ddc5bc79274d44d79126d556fcf36ae9b38791184db677b0d656f81"
        ),
        .binaryTarget(
            name: "AATDigitalTurbineBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATDigitalTurbineBiddingAdapter.zip",
            checksum: "fa3ad4c1211ce96335a1acd8349f3e1a148387939a656d7c09ee81f29cd03b9e"
        ),
        .binaryTarget(
            name: "AATMintegralAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATMintegralAdapter.zip",
            checksum: "f85e2dd4cdf51193847be8e5ef51b65d2306dc027ddc0e8fc6711b6fa882e434"
        ),
        .binaryTarget(
            name: "AATGoogleCMPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATGoogleCMPAdapter.zip",
            checksum: "b72bfc80653bc810af9a594ad5456bd1588101ec19006584fd0b0ba085e977c4"
        ),
        .binaryTarget(
            name: "AATAppConsentAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATAppConsentAdapter.zip",
            checksum: "671874ba237b19dbf5aab78565ffd23c1874c5f6b4a0d3fcc711c4133e343b27"
        ),
        .binaryTarget(
            name: "AATMolocoBiddingDSPAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATMolocoBiddingDSPAdapter.zip",
            checksum: "7a1b3a9643fa2bdb3355a70ca1b0d2c2b3b9e05b934022a92642e9ded0b5d012"
        ),
        .binaryTarget(
            name: "AATAdMobMediationAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATAdMobMediationAdapter.zip",
            checksum: "56d168ec96675220019b6fcf077ed0b00a0184ef2bb1c3af6b8d15a77d8730ce"
        ),
        .binaryTarget(
            name: "AATVungleBiddingAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATVungleBiddingAdapter.zip",
            checksum: "ccfd2a3d27ac56df41d01ff0148dd04077356719bd3ca0f79f3f7ba2d9359bc0"
        ),
        .binaryTarget(
            name: "AATInMobiAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATInMobiAdapter.zip",
            checksum: "35b15fbe13c573fed69028e7d5c540033029f35c57ef46a5934176a5bb5c6dfb"
        ),
        .binaryTarget(
            name: "AATUTIQAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATUTIQAdapter.zip",
            checksum: "6b372afb6c21765cc7687950f1a9518bed5ab47e712a3505546afcf4656d4487"
        ),
        .binaryTarget(
            name: "AATKit",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATKit.zip",
            checksum: "2f3a3b8200c56b56493c8cb8c3598f382789942a8743a824d7277e93fc884f55"
        ),
        .binaryTarget(
            name: "AATTappxAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATTappxAdapter.zip",
            checksum: "7cbb256074ec7570bb7b9c6022aeec42c29a74482c5ff8d294eec687f8a1380a"
        ),
        .binaryTarget(
            name: "AATAppLovinAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATAppLovinAdapter.zip",
            checksum: "1660df6fae6d85051f045943b358a31b7cf5c679234c6fd932b57a1e437cc101"
        ),
        .binaryTarget(
            name: "AATAppHarbrAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATAppHarbrAdapter.zip",
            checksum: "3e54479f91673a50d6dc89a46ad92fb75af6f4e490d6047e5b9dadf160e507a7"
        ),
        .binaryTarget(
            name: "AATTeadsAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AATTeadsAdapter.zip",
            checksum: "404cb45aff8c215670a77cf9bc5bec9b8dbec8523876e33c12fa0bd4e7cf5488"
        ),
        .binaryTarget(
            name: "AATAppConsent",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AppConsent.zip",
            checksum: "8171f88caf9f8263215e122f9733f94606a9552f8c23b15ccbd32d4ca96a0349"
        ),
        .binaryTarget(
            name: "AATUnityAds",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/UnityAds.zip",
            checksum: "e4010143b7de6d4e85391f2d219c7683889738ea0c5ddf8d12c8035f0acfe2d1"
        ),
        .binaryTarget(
            name: "AATIASDKCore",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/IASDKCore.zip",
            checksum: "141322a1840568ae1edcd0ef63a1c098dc546348bce009d0426d45dd063f4e61"
        ),
        .binaryTarget(
            name: "AATInMobiSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/InMobiSDK.zip",
            checksum: "42cb0cc9696036b7316b6232c9389149b89e2ebc2e1cb152717644e4248cf353"
        ),
        .binaryTarget(
            name: "AATTeadsSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/TeadsSDK.zip",
            checksum: "63dcae19626edcf76957af9cc586a7cef9990ac2818f3f431fbffe96496c51e8"
        ),
        .binaryTarget(
            name: "AATOMSDK_Teadstv",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/OMSDK_Teadstv.zip",
            checksum: "48ea6b40dd0405b132eb47a8f72cc91ab9659d6706ccc2a6f9ec3c7c5395f719"
        ),
        .binaryTarget(
            name: "AATFBAudienceNetwork",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/FBAudienceNetwork.zip",
            checksum: "73b3f377064a314a69d1e8550c992d6813a77841d9def7c5339f59a9ba3f360b"
        ),
        .binaryTarget(
            name: "AATTappxFramework",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/TappxFramework.zip",
            checksum: "de38918f5e9a3dd7db3e9e9286a8a9230cedcf51690cf4a1bdd02877f22de033"
        ),
        .binaryTarget(
            name: "AATOMSDK_Tappx",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/OMSDK_Tappx.zip",
            checksum: "ea7e41cd63b0e2f7f3d2e32b11e704814809647733d53e7dd0008b2ea70b5803"
        ),
        .binaryTarget(
            name: "AATVungleAdsSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/VungleAdsSDK.zip",
            checksum: "097c9f2dd57060c509c26bb0edbdd4ca6c319e2e3552be8de83a6b35eda46ad9"
        ),
        .binaryTarget(
            name: "AATIronSourceAdQualitySDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/IronSourceAdQualitySDK.zip",
            checksum: "a7b0de84bdd8ef564182f7b03273bcdc7dbc8af0909c945f79ddf469439c8bdb"
        ),
        .binaryTarget(
            name: "AATDTBiOSSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/DTBiOSSDK.zip",
            checksum: "27f8dde3172a33f3664851574641c8f60522c5f6b082f7a55fb2475497166396"
        ),
        .binaryTarget(
            name: "AATMTGSDKInterstitialVideo",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/MTGSDKInterstitialVideo.zip",
            checksum: "48bf154fa50f2d791281a0ffd4485b52a82ed2584deb80ee98d5f13de45adc2d"
        ),
        .binaryTarget(
            name: "AATMTGSDKBanner",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/MTGSDKBanner.zip",
            checksum: "7666ca4fffbc79196a28da7c90602385fbaa6f95cdf00c38f1c6f723848f1e4d"
        ),
        .binaryTarget(
            name: "AATMTGSDKBidding",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/MTGSDKBidding.zip",
            checksum: "233f8119ebba9f466a7bf6112802b34dd9330dc0defdada0009a3a939923296b"
        ),
        .binaryTarget(
            name: "AATMTGSDKReward",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/MTGSDKReward.zip",
            checksum: "9a10f894722028982e97dd7ce597a73192193ce35d1da55bf2743c214865dc47"
        ),
        .binaryTarget(
            name: "AATMTGSDKNativeAdvanced",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/MTGSDKNativeAdvanced.zip",
            checksum: "e3c008ca86b3ae242c176c76f7c78e9d57f5ce82ce6090ed6e700a6f9d2d065a"
        ),
        .binaryTarget(
            name: "AATMTGSDKSplash",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/MTGSDKSplash.zip",
            checksum: "94ce3df8496bf22bc1338b87955b83be7445d435e4444fd2eb08492853c49a1c"
        ),
        .binaryTarget(
            name: "AATMTGSDKNewInterstitial",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/MTGSDKNewInterstitial.zip",
            checksum: "46fd88b19f6cefbd5183a4cef65d9bd71842e1f861a2c6e55a52509fa94199cf"
        ),
        .binaryTarget(
            name: "AATMTGSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/MTGSDK.zip",
            checksum: "d414b5c191edccc895d14e895809577d9bb7596990977971aa2d4abcb5da7918"
        ),
        .binaryTarget(
            name: "AATIronSource",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/IronSource.zip",
            checksum: "b4243ba0b6c71862eb0906c7c42061423e5807c5133ebeee60e959d03e57f1c4"
        ),
        .binaryTarget(
            name: "AATMolocoSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/MolocoSDK.zip",
            checksum: "ba4be88d2e02d4d3c319dab9853da976d0259e02d6dd2f05926f685c8a9f11c9"
        ),
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/OMSDK_Microsoft.zip",
            checksum: "b88d2311e317d5074e23139a9f3b5fc03d703cfbb6f38ece5a3f5951f223f471"
        ),
        .binaryTarget(
            name: "AATAppNexusSDK",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.17.2/AppNexusSDK.zip",
            checksum: "48d7c58514940bb624da90f6b2d1b9457903c427dacbbe0b311fe9a5fd2ee310"
        ),
    ]
)
