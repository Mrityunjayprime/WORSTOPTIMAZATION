# WORSTOPTIMAZATION 1.0.0

A **client-side Minecraft Fabric mod** targeting Minecraft Java Edition **1.21.11** and Java **21**. This is a Java project, not a website, launcher, dashboard, or AI service.

## Included in this development source release

- FPS HUD sampled from real client HUD-frame timestamps: instantaneous FPS, rolling average, frame time, optional 1% low estimate.
- JVM heap usage split from the maximum heap limit; it is not total physical device RAM.
- O opens the settings screen; F8 toggles the overlay.
- Persistent JSON settings with validation, malformed-file preservation, and backup-on-save.
- Reversible LOW-END, BALANCED, and HIGH FPS presets that show the planned changes before applying them. They change supported vanilla options only: render distance, simulation distance, and global particle quality.
- Restore previous settings from a saved snapshot.
- Compatibility report for Minecraft target, Fabric Loader/API, Sodium, and BadOptimizations; optional mods are not bundled.
- Automated JUnit tests and GitHub Actions build/artifact workflow.

## Dependencies

- Minecraft Java Edition 1.21.11
- Java 21
- Fabric Loader compatible with 1.21.11
- Fabric API 0.141.6+1.21.11 (declared in `gradle.properties`)
- Optional: a Sodium release marked for Fabric 1.21.11; an appropriate BadOptimizations release. Check the in-game Compatibility page.

The build uses **Mojang official mappings** throughout. It uses the Fabric Loom remapping plugin ID for obfuscated Minecraft versions (`net.fabricmc.fabric-loom-remap`).

## Build and install

Read [`docs/BUILD_GUIDE.md`](docs/BUILD_GUIDE.md) and [`docs/INSTALLATION.md`](docs/INSTALLATION.md). The expected installable output is `build/libs/worstoptimazation-1.0.0.jar`. Never rename a source ZIP and treat it as a mod JAR.

The current execution environment did not have Gradle installed and could not resolve Maven hosts, so no compiled JAR or successful Gradle build is claimed in this source package. Push this project to GitHub to use `.github/workflows/build.yml`; on a successful run, download the artifact named `worstoptimazation-1.0.0-jar` from the Actions run's Artifacts section. The exact commands and validation status are recorded in [`BUILD_STATUS.md`](BUILD_STATUS.md).

## Honest feature boundaries

The release does not implement per-category particles, texture-animation interception, custom entity/chunk rendering, CPU/GPU boost, RAM cleaning, hardware temperature, or invented performance estimates. The standard Minecraft particle option is global; the UI changes that real setting instead of pretending it can isolate weather, potion, block, or explosion particles. No custom Mixin is shipped in 1.0.0 because untested rendering hooks could conflict with Sodium and resource packs.

No FPS improvement claim has been benchmarked yet. See [`docs/PERFORMANCE_TESTING.md`](docs/PERFORMANCE_TESTING.md).
