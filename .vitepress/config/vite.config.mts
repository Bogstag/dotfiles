import { defineConfig } from "vite";

const viteConfig = defineConfig({
  devtools: {
    apply: "serve",
    build: { injection: false, withApp: true },
    dockPreferences: {
      defaultMode: "edge",
      defaultPosition: "bottom",
    },
    embeddedVisibility: "normal",
  },
});

export default viteConfig;
