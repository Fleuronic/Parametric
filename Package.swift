// swift-tools-version:5.8
import PackageDescription

let package = Package(
	name: "Parametric",
	platforms: [
		.iOS(.v16)
	],
	products: [
		.library(
			name: "Parametric",
			targets: ["Parametric"]
		)
	],
	dependencies: [.package(url: "https://github.com/Fleuronic/Metric", branch: "main")],
	targets: [
		.target(
			name: "Parametric",
			dependencies: ["Metric"]
		),
		.testTarget(
			name: "ParametricTests",
			dependencies: ["Parametric"]
		)
	]
)
