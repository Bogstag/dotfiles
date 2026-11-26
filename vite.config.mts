import { defineConfig } from "vite-plus";

// Vite+ loads the toolchain configuration through its default export.
export default defineConfig({
  fmt: {
    allowSeparatedGroups: true,
    checkExportFrom: true,
    extendDefaultStyles: false,
    ignoreDeclarationSort: true,
    ignorePatterns: [
      "*.min.js",
      // TOML formatting is handled by Tombi.
      "*.toml",
      "coverage/**",
      "dist/**",
      // Chezmoi script with a YAML target.
      "home/dot_config/lazygit/modify_config.yml",
      "test/snapshots/**",
      "vendor/**",
    ],
    objectWrap: "collapse",
    overrides: [
      {
        files: ["**/*.jsonc", "[jsonc]", "**/*.json5", "[json5]"],
        options: { trailingComma: "none" },
      },
    ],
    printWidth: 75,
    sortImports: {
      groups: [
        "type-import",
        ["value-builtin", "value-external"],
        { newlinesBetween: true },
        "type-internal",
        "value-internal",
        { newlinesBetween: true },
        ["type-parent", "type-sibling", "type-index"],
        ["value-parent", "value-sibling", "value-index"],
        { newlinesBetween: true },
        "unknown",
      ],
      newlinesBetween: true,
    },
    sortPackageJson: { sortScripts: true },
  },
  lint: {
    categories: {
      correctness: "error",
      pedantic: "warn",
      perf: "warn",
      restriction: "warn",
      style: "warn",
      suspicious: "warn",
    },
    env: { builtin: true, esnext: true },
    ignorePatterns: [
      "*.min.js",
      "coverage/**",
      "dist/**",
      "test/snapshots/**",
      "vendor/**",
    ],
    jsPlugins: [
      { name: "vite-plus", specifier: "vite-plus/oxlint-plugin" },
    ],
    options: {
      reportUnusedDisableDirectives: "error",
      typeAware: true,
      typeCheck: true,
    },
    overrides: [{ files: ["**/*.test.mjs", "cli/*.ts", "utils/*.ts"] }],
    plugins: ["eslint", "import", "node", "oxc", "typescript", "vitest"],
    rules: {
      "eslint/func-style": ["error", "declaration"],
      "eslint/no-console": ["warn", { allow: ["info", "error"] }],
      "eslint/one-var": "allow",
      "eslint/sort-imports": ["allow", { allowSeparatedGroups: true }],
      "import/no-default-export": "off",
      "import/no-named-export": "off",
      "import/no-nodejs-modules": [
        "error",
        {
          allow: [
            "node:assert/strict",
            "node:child_process",
            "node:fs",
            "node:fs/promises",
            "node:os",
            "node:path",
            "node:test",
          ],
        },
      ],
      "import/prefer-default-export": "off",
      "no-continue": "warn",
      "no-duplicate-imports": [
        "error",
        { allowSeparateTypeImports: true },
      ],
      "node/no-sync": "allow",
      "node/no-top-level-await": "allow",
      "oxc/no-async-await": "allow",
      "oxc/no-optional-chaining": "off",
      "sort-imports": "allow",
      "sort-keys": [
        "error",
        "asc",
        { allowLineSeparatedGroups: true, natural: true },
      ],
      "sort-vars": "error",
      "typescript/no-magic-numbers": [
        "error",
        {
          ignoreArrayIndexes: true,
          ignoreClassFieldInitialValues: true,
          ignoreDefaultValues: true,
          ignoreEnums: true,
        },
      ],
      "typescript/prefer-readonly-parameter-types": "allow",
      "vite-plus/prefer-vite-plus-imports": "error",
    },
  },
  staged: { "*": "vp check --fix" },
});
