# WORSTOPTIMAZATION 1.0.0 — build status

Checked: 2026-10-27

## Result

**No compiled mod JAR was produced in the authoring environment.** `build/libs/worstoptimazation-1.0.0.jar` is intentionally not included because no actual successful Gradle build created it.

## What was executed

- `./gradlew clean test build` — attempted; the bootstrap could not download the pinned Gradle distribution because DNS resolution for `services.gradle.org` failed (`curl: (6) Could not resolve host`). No system Gradle executable was installed, so Gradle tests and the Minecraft remapping compilation never began.
- Standalone `javac` + Java smoke test for the dependency-free frame-time monitor — **passed**. It exercised current FPS, average FPS, frame time, 1% low calculation, and the unavailable state with deterministic frame timestamps.
- JSON validation — **passed** for `fabric.mod.json` and both language files. The icon was verified to be a valid PNG header with 128×128 dimensions.
- Source parser scan — no Java syntax/parser diagnostics were reported, but the full source could not be type-checked because the Minecraft/Fabric dependencies are not available locally.
- JUnit tests included in `src/test/java` — **not executed** in this environment.
- In-game launch test, Sodium/BadOptimizations interaction test, and before/after FPS benchmark — **not executed**.

## Reproducible build path

The GitHub Actions workflow installs Java 21 and Gradle 9.4.0, generates the official Gradle Wrapper on the runner, runs `./gradlew clean test build`, checks that the remapped JAR contains both `fabric.mod.json` and `ClientInitializer.class`, and uploads the resulting JAR only when those checks pass. A successful workflow run is needed before calling this release compiled or game-tested.
