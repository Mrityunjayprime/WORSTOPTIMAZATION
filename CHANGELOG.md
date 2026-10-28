# Changelog

## 1.0.0 — initial development release

- Client-only Fabric entry point for Minecraft Java 1.21.11.
- Real HUD frame sampling with current/average FPS, frame time, and 1% low estimate.
- JVM heap used/committed/maximum values (not physical device RAM).
- Persistent, versioned JSON configuration with corruption recovery and backup.
- Preset confirmation flow; applies supported vanilla render/simulation distance and global particle options.
- Restore snapshot for the previous preset and video settings.
- Sodium / BadOptimizations presence and version diagnostics; neither is bundled.
- Individual texture-animation and granular particle-category toggles are intentionally not advertised in 1.0.0 because they need further target-version-specific implementation and runtime testing.
