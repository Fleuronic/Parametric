// swift-tools-version:5.6
import PackageDescription

let package = Package(
	name: "Parametric",
	platforms: [
		.iOS(.v14)
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
