import type { DefaultTheme, UserConfig } from "vitepress";
import type { VitePressSidebarOptions } from "vitepress-sidebar/types";

import { defineConfig } from "vitepress";
import { withSidebar } from "vitepress-sidebar";

const vitePressOptions: UserConfig<DefaultTheme.Config> = defineConfig({
  base: "/dotfiles/",
  description: "Small, practical notes about this repository.",
  head: [["link", { href: "/favicon.ico", rel: "icon" }]],
  ignoreDeadLinks: true,
  // Rewrites(page) {
  //   // The site root already has an index.md.
  //   Return page.replace(/(?<=\/)README\.md$/u, "index.md");
  // },
  // Rewrites(page) {
  //   Return page.replace(/(?<dir>[^/]+)\/\1\.md$/u, "$1/index.md");
  // },
  srcExclude: [
    "**/AGENTS.md",
    "**/node_modules/**",
    "**/dist/**",
    "notes.md",
    "home/dot_config/yazi/flavors/orlok.yazi/readonly_README.md",
  ],
  themeConfig: {
    logo: {
      dark: "/sipping-coffee-by-laptop.svg",
      light: "/sipping-coffee-by-laptop-light.svg",
    },
    nav: [
      { link: "/home", text: "~" },
      { link: "/docs", text: "Docs" },
    ],
    socialLinks: [
      {
        icon: {
          svg: '<svg xmlns="http://www.w3.org/2000/svg" width="39.3" height="32" viewBox="0 0 1227.825 1000"><path d="M0 0h1227.825v1000H0z" fill="none" /><path fill="currentColor" d="M1078.94-.985c-33.192-.491-110.295 10.777-239.027 96.936c-70.161-17.535-144.812-26.188-219.591-26.188c-82.278 0-165.425 10.448-242.965 31.719C192.534-24.605 110.955 1.234 110.955 1.234c-53.258 133.183-20.347 231.788-10.344 256.277C38.014 325.069-.2 411.338-.2 517.07c0 79.822 9.085 151.416 31.281 213.653c1.231 4.803.832 3.732 2.906 7.844c4.89 12.884 10.327 25.39 16.438 37.468c2.094 4.346 4 7.563 4 7.563c62.395 116.307 185.396 191.438 404.244 215.028l330.995.375c233.392-23.144 345.386-98.499 396.994-215.591l3.281-7.625c4.89-11.828 9.153-24.135 20.813-65.562s16.875-113.172 16.875-193.185c0-114.755-43.1-206.577-113.092-276.434c12.231-39.48 28.57-127.158-16.313-239.402c0 0-6.293-1.995-19.281-2.188zM818.1 420.133c53.893-.117 100.057 9.136 134.717 45.499v.031c43.369 45.541 68.749 100.525 68.749 159.778c0 276.658-177.932 284.183-397.4 284.183c-219.506 0-397.4-38.336-397.4-284.183c0-58.861 25.009-113.516 67.843-158.872c71.451-75.59 192.365-35.562 329.558-35.562c70.423-.011 136.564-10.75 193.935-10.875zm-408.807 81.468c-45.666 0-82.687 61.741-82.687 137.936c0 76.206 37.019 137.967 82.687 137.967c45.666 0 82.687-61.761 82.687-137.967c0-76.184-37.019-137.881-82.687-137.936m443.649 0c-45.666 0-82.687 61.741-82.687 137.936c0 76.206 37.019 137.967 82.687 137.967c45.666 0 82.687-61.761 82.687-137.967c0-76.184-37.019-137.881-82.687-137.936" /></svg>',
        },
        link: "https://github.com/Bogstag/dotfiles",
      },
    ],
  },
  title: "Dotfiles",
  vite: { assetsInclude: ["**/*.ico", "**/*.svg"], configFile: false },
});

const sidebarOptions: VitePressSidebarOptions = {
  // ============ [ RESOLVING PATHS ] ============
  documentRootPath: "/",
  // ScanStartPath: null,
  // ResolvePath: null,
  // BasePath: null,
  // SplitSidebarByFolder: true,
  // FollowSymlinks: false,

  // ============ [ GROUPING ] ============
  // CollapseFromLevel: 3,
  // Collapsed: true,
  // CollapseDepth: 2,
  rootGroupCollapsed: false,
  rootGroupText: "Table of Contents",
  // RootGroupLink: 'https://github.com/jooy2',
  splitSidebarRootGroupText: "◀ :title",

  // ============ [ GETTING MENU TITLE ] ============
  useFolderTitleFromIndexFile: true,
  useTitleFromFileHeading: true,
  // UseTitleFromFrontmatter: true,
  // FrontmatterTitleFieldName: 'title',
  // DynamicRouteTitleParam: 'title',

  // ============ [ GETTING MENU LINK ] ============
  // FolderLinkNotIncludesFileName: true,
  useFolderLinkFromIndexFile: true,
  // UseFolderLinkFromSameNameSubFile: true,
  // RemovePrefixFromLink: false,

  // ============ [ INCLUDE / EXCLUDE ] ============
  excludeByGlobPattern: [
    ".agents/",
    ".codegraph/",
    ".codex/",
    ".github/",
    ".ryl_cache/",
    "**/AGENTS.md",
    "**/dist/**",
    "**/node_modules/**",
    "home/dot_config/yazi/flavors/orlok.yazi/readonly_README.md",
    "notes.md",
  ],
  // ExcludeFilesByFrontmatterFieldName: 'exclude',
  // ExcludeByFolderDepth: undefined,
  // IncludeDotFiles: false,
  // IncludeEmptyFolder: false,
  // IncludeRootIndexFile: true,
  // IncludeFolderIndexFile: false,
  // IncludeDynamicRoutes: false,

  // ============ [ STYLING MENU TITLE ] ============
  // HyphenToSpace: false,
  // UnderscoreToSpace: false,
  capitalizeFirst: true,
  // CapitalizeEachWords: false,
  // KeepMarkdownSyntaxFromTitle: false,
  // RemovePrefixAfterOrdering: false,
  // PrefixSeparator: '.',

  // ============ [ SORTING ] ============
  manualSortFileNameByPriority: ["index.md", "**"],
  sortFolderTo: "top",
  sortMenusByName: true,
  // SortMenusByFileDatePrefix: false,
  // SortMenusByFrontmatterOrder: false,
  // FrontmatterOrderDefaultValue: 0,
  // SortMenusByFileCreateDate: false,
  // SortMenusByFileModifyDate: false,
  // SortMenusByFrontmatterDate: false,
  // SortMenusOrderByDescending: false,
  // SortMenusOrderNumericallyFromTitle: false,
  // SortMenusOrderNumericallyFromLink: false,
  // SortMenusByCustomFunction: (a, b) => a.fileName.localeCompare(b.fileName),

  // ============ [ MISC ] ============
  // DebugPrint: false,
};

// VitePress loads the site configuration through its default export.
// oxlint-disable-next-line import/no-default-export
export default withSidebar(vitePressOptions, sidebarOptions);
