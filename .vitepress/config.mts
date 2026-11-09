import { defineConfig } from "vitepress";

export default defineConfig({
  base: "/dotfiles/",
  title: "Dotfiles",
  description: "Small, practical notes about this repository.",
  srcExclude: ["**/AGENTS.md"],
});
