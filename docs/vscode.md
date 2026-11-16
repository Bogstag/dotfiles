# VSCode

## Color

### Plugins

I used to have a lot of plugins for managing colors in vscode, but now days it have some built ins functions. It have its own color picker, but the preview is to small for me so i still use the Color highlight (`naumovs.color-highlight`) plugin.

Color detection at the same time with Color Highlight (CH) and VSCode (VC).

#### Working combo

- Legend
  - VSCode has one function:
    - Add color picker when color detected
  - Color Highlight has two functions:
    - Color background to color
    - Make text visible (black/white) against current background color
      - Text dont change color when using HSL, LCH or oklch.
        - hsl(255 255 30), Below (xxx xxx 30) it is hard to read.
        - hsl(255 100% 100% / 20%), Below xxx xxx xxx / 20 it is hard to read.
        - lch(100% 100 334 / 20%), Below xxx xxx xxx / 20 it is hard to read.
- 🟩 = All functions works
- 🟨 = Some functions works
- 🟥 = None functions works

| Format                            | Color Highlight | VSCode | Notes     |
| --------------------------------- | --------------- | ------ | --------- |
| #123                              | 🟩              | 🟩     |           |
| #1234                             | 🟩              | 🟩     |           |
| #123456                           | 🟩              | 🟩     |           |
| #12345678                         | 🟩              | 🟩     |           |
| #ffffff                           | 🟩              | 🟩     |           |
| #ffffffff                         | 🟩              | 🟩     |           |
| `hsl(308, 100%, 30%)`             | 🟨 Black text   | 🟩     | \`color\` |
| hsl(308 100% 30%)                 | 🟨 Black text   | 🟩     |           |
| rgb(0, 0, 0)                      | 🟩              | 🟩     |           |
| rgb(255 0 221)                    | 🟩              | 🟩     |           |
| rgb(255, 0, 221)                  | 🟩              | 🟩     |           |
| `#ff00dd`                         | 🟩              | 🟥     | \`color\` |
| hwb(308, 0%, 0%)                  | 🟩              | 🟥     |           |
| lch(58.6% 100.4 334.0)            | 🟩              | 🟥     |           |
| lch(58.633% 100.425 334.065)      | 🟩              | 🟥     |           |
| oklch(59.690% 0.302 336.105)      | 🟩              | 🟥     |           |
| hsl(308 100 30)                   | 🟨 Black text   | 🟥     |           |
| hsl(308 100% 50% / 30%)           | 🟨 Black text   | 🟥     |           |
| hsla(308 100% 50% / 30%)          | 🟨 Black text   | 🟥     |           |
| lch(100% 100 334 / 20%)           | 🟨 Black text   | 🟥     |           |
| lch(58.63% 100.42 334.06 / .3)    | 🟨 Black text   | 🟥     |           |
| oklch(59.690% 0.302 336.105 / .3) | 🟨 Black text   | 🟥     |           |
| rgb(255 0 221 / 0.3)              | 🟨 Black text   | 🟥     |           |
| rgb(255 0 221 / 30%)              | 🟨 Black text   | 🟥     |           |
| rgb(255, 0, 221, 30%)             | 🟨 Black text   | 🟥     |           |

#### Dont work

None of the formats below works, but they are in a correct format (in CSS)

##### Named colors

aliceblue
rebeccapurple
red

##### RGB (Red, Green, Blue)

rgb(from #123456 calc(r + 40) calc(g + 40) b)
rgb(from green r g b / 0.5)
rgb(from hwb(120deg 10% 20%) r g calc(b + 200))

##### HSL (Hue, Saturation, Lightness)

hsl(120deg 75% 25% / 60%)
hsl(120deg 75% 25%)
hsl(120deg, 75%, 25%, 0.8)
hsl(from #123456 h s calc(l + 20))
hsl(from green h s l / 0.5)
hsl(from red 240deg s l)
hsl(from rgb(200 0 0) calc(h + 30) s calc(l + 30))
hsla(120deg 75% 25% / 60%)

##### HWB (Hue, Whiteness, Blackness)

hwb(.15turn 10% 25%)
hwb(0.1508rad 10% 25%)
hwb(0.15turn 10% 25%)
hwb(194 0% 0% / 0.5)
hwb(1turn 10% 25%)
hwb(270deg, 75%, 25%)
hwb(308 0% 0%)
hwb(90 0% 0%)
hwb(90 10% 10% / 0.5)
hwb(90 10% 10% / 50%)
hwb(90deg 50% 50%)
hwb(from green h w b / 0.5)

##### XYZ D50

color(xyz-d50 0.53953 0.26633 0.53032)

##### XYZ D65

color(xyz-d65 0.54292 0.26486 0.70646)

##### Lab (Lightness, A-axis, B-axis)

lab(29.2345% 39.3825 20.0664);
lab(50% 40 59.5 / 0.5)
lab(50% 40 59.5)
lab(52.2345% 40.1645 59.9971 / .5);
lab(52.2345% 40.1645 59.9971);
lab(from #123456 calc(l + 10) a b)
lab(from green l a b / 0.5)
lab(from hsl(180 100% 50%) calc(l - 10) a b)

##### LCH (Lightness, Chroma, Hue)

lch(from #123456 calc(l + 10) c h)
lch(from blue calc(l + 20) c h)
lch(from green l c h / 0.5)
lch(from hsl(180 100% 50%) calc(l - 10) c h)
lch(from var(--color-value) l c h / calc(alpha - 0.1))

##### Oklab (Lightness, A-axis, B-axis)

oklab(59.6%, 0.1007, 0.1191);
oklab(59.69% 0.1007 0.1191 / 0.5);
oklab(59.69% 0.1007 0.1191);
oklab(59% 0.1 0.1 / 0.5)
oklab(59% 0.1 0.1)
oklab(59%, 0.1, 0.1)

##### OkLCh (Lightness, Chroma, Hue)

oklab(from #123456 calc(l + 0.1) a b / calc(alpha * 0.9))
oklab(from green l a b / 0.5)
oklab(from hsl(180 100% 50%) calc(l - 0.1) a b)
oklch(from #123456 calc(l + 0.1) c h)
oklch(from green l c h / 0.5)
oklch(from hsl(180 100% 50%) calc(l - 0.1) c h)
oklch(from var(--color) l c h / calc(alpha - 0.1))

##### Others

light-dark(rgb(255 255 255), rgb(0 0 0))
light-dark(white, black)
