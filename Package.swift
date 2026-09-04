// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
// This is the core AATKit package. It ships AATKit and nothing else — every ad
// network and CMP lives in its own AATKit-<Network> package, so integrators only
// pull in the third-party SDKs they actually use.
//
// The generated blocks below — the target's dependencies and the binary targets —
// are written by BuildScripts/SPM_scripts/BinariesGenerator in the AATKit
// repository, from the routing table in PackageManifest.swift. Keep every Mark
// comment exactly as it is, keep the binary targets last in the file, and never
// repeat a Mark comment's text elsewhere in the file — the generator locates them
// by string match.

import PackageDescription

let package = Package(
    name: "AATKit",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AATKit-Core", targets: ["AATKit-Core"]),
    ],
    // Mark: Targets
    targets: [
        // AATKit target
        .target(name: "AATKit-Core",
                dependencies: [
                    // Mark: Target Dependencies Begin
                    "AATKit",
                    // Mark: Target Dependencies End
                ],
                path: "./Sources/AATKit"),

        // Mark: Binary Targets
        .binaryTarget(
            name: "AATKit",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/aatkit/ios/spm/3.18.0-beta3/AATKit.zip",
            checksum: "d9fcbdf6964afeb51c3d2165b6d002869907f0fefe805bd5fc72b06a314d7225"
        ),
    ]
)
