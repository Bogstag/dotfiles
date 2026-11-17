import { defineConfig } from "vite-plus";

export default defineConfig({
  fmt: {
    extends: ["../../../.oxfmtrc.jsonc"],
    // Keeps undoing tombi format
    ignorePatterns: ["*.toml"],
    objectWrap: "collapse",
    overrides: [
      {
        files: ["**/*.jsonc", "[jsonc]", "**/*.json5", "[json5]"],
        options: { trailingComma: "none" },
      },
    ],
    // With collapse 100 is to long
    printWidth: 70,
    sortImports: true,
    sortPackageJson: { sortScripts: true },
  },
  lint: {
    categories: {
      correctness: "error",
      pedantic: "error",
      perf: "error",
      restriction: "error",
      style: "error",
      suspicious: "error",
    },
    jsPlugins: [
      { name: "vite-plus", specifier: "vite-plus/oxlint-plugin" },
    ],
    options: { typeAware: true, typeCheck: true },
    rules: {
      "sort-imports": "allow",
      "sort-keys": [
        "allow",
        "asc",
        {
          allowLineSeparatedGroups: true,
          caseSensitive: true,
          minKeys: 2,
          natural: true,
        },
      ],
      "sort-vars": "allow",
      "vite-plus/prefer-vite-plus-imports": "error",
    },
  },
  staged: {
    "*": "vp fmt --no-error-on-unmatched-pattern",
    "*.{js,jsx,ts,tsx,mjs,cjs}": "npm run check:oxlint",
  },
});
