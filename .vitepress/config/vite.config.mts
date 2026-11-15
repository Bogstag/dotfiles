import { defineConfig } from "vite";

const viteConfig = defineConfig({
  devtools: {
    apply: "serve",
    embeddedVisibility: "normal",
    dockPreferences: {
      defaultMode: "edge",
      defaultPosition: "bottom",
    },
    build: {
      // Generate DevTools output during `vite build`
      withApp: true,
      injection: false,
      // OutDir: 'custom-dir',
    },
  },
});
export default viteConfig;

// För segt
// "editor.inlineSuggest.minShowDelay": 2000
// "editor.inlineSuggest.minShowDelay": 5000,
// "editor.hover.delay": 2000,
// "editor.hover.hidingDelay": 1500
// "editor.hover.hidingDelay": 100,
// Nya tester:
// Default: "editor.hover.delay": 300 => 1000
