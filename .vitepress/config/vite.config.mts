import type { UserConfig } from "vite-plus";

export const viteConfig: UserConfig = {
  assetsInclude: ["**/*.ico", "**/*.svg"],
  // ConfigFile: false,
} satisfies UserConfig;
