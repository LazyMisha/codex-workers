# Style Guide

Use this style guide to design the web app with a clean Apple-like visual language.

## Core Direction

- Mode: light
- Feel: minimal, crisp, polished, product-first
- Overall tone: modern, restrained, and premium

## Color System

- Accent: `#0071e3`
- Background: `#ffffff`
- Text: `#1d1d1f`

Use the accent color sparingly for primary actions, active states, and key emphasis.

## Typography

### Headings

#### H1

- Font family: `SF Pro Text`
- Font size: `48px`
- Font weight: `700`
- Line height: `58px`
- Letter spacing: `0px`
- Fallbacks: `SF Pro Text`, `SF Pro Icons`, `Helvetica Neue`, `Helvetica`, `Arial`, `sans-serif`

#### H2

- Font family: `SF Pro Display`
- Font size: `40px`
- Font weight: `600`
- Line height: `52.0077px`
- Letter spacing: `-0.096px`
- Fallbacks: `SF Pro Display`, `SF Pro Icons`, `Helvetica Neue`, `Helvetica`, `Arial`, `sans-serif`

#### H3

- Font family: `SF Pro Display`
- Font size: `34px`
- Font weight: `600`
- Line height: `36px`
- Letter spacing: `0.064px`
- Fallbacks: `SF Pro Display`, `SF Pro Icons`, `Helvetica Neue`, `Helvetica`, `Arial`, `sans-serif`

#### H4

- Font family: `SF Pro Text`
- Font size: `29px`
- Font weight: `600`
- Line height: `35px`
- Letter spacing: `0px`
- Fallbacks: `SF Pro Text`, `SF Pro Icons`, `Helvetica Neue`, `Helvetica`, `Arial`, `sans-serif`

### Paragraphs

- Font family: `SF Pro Display`
- Font size: `24px`
- Font weight: `400`
- Line height: `36px`
- Letter spacing: `0.216px`
- Fallbacks: `SF Pro Display`, `SF Pro Icons`, `Helvetica Neue`, `Helvetica`, `Arial`, `sans-serif`

## Spacing

- XS: `8px`
- SM: `16px`
- MD: `24px`
- LG: `44px`
- XL: `70px`

Use spacing generously. Keep layouts airy and balanced.

## Shadows

- SM: `rgba(0, 0, 0, 0.22) 3px 5px 30px 0px`
- MD: `none`
- LG: `none`
- XL: `none`
- Inner: `none`

Keep surfaces flat and clean. Use the small shadow only when depth is needed.

## Components

### Primary Button

- Background: `#0071e3`
- Text color: `#ffffff`
- Border color: `transparent`
- Border radius: `980px`
- Border width: `1px`
- Border style: `solid`
- Padding: `11px 21px`
- Font size: `17px`
- Font weight: `400`
- Min width: `26px`
- Min height: `44px`
- Text decoration: `none`
- Box shadow: `none`
- Font family: `SF Pro Text`

CSS:

```css
box-sizing: border-box;
display: inline-block;
min-width: 26px;
min-height: 44px;
background-color: #0071e3;
color: #ffffff;
border: 1px solid transparent;
border-radius: 980px;
padding: 11px 21px;
font-size: 17px;
font-weight: 400;
font-family: "SF Pro Text", "SF Pro Icons", "Helvetica Neue", Helvetica, Arial, sans-serif;
text-decoration: none;
```

### Secondary Button

- Background: `transparent`
- Text color: `#0066cc`
- Border color: `#0066cc`
- Border radius: `980px`
- Border width: `1px`
- Border style: `solid`
- Padding: `11px 21px`
- Font size: `17px`
- Font weight: `400`
- Min width: `26px`
- Min height: `44px`
- Text decoration: `none`
- Box shadow: `none`
- Font family: `SF Pro Text`

CSS:

```css
box-sizing: border-box;
display: inline-block;
min-width: 26px;
min-height: 44px;
background-color: transparent;
color: #0066cc;
border: 1px solid #0066cc;
border-radius: 980px;
padding: 11px 21px;
font-size: 17px;
font-weight: 400;
font-family: "SF Pro Text", "SF Pro Icons", "Helvetica Neue", Helvetica, Arial, sans-serif;
text-decoration: none;
```

### Link Button

- Background: `transparent`
- Text color: `#1d1d1f`
- Border radius: `0px`
- Border width: `0px`
- Border style: `none`
- Padding: `0px`
- Font size: `17px`
- Font weight: `400`
- Min width: `0px`
- Min height: `0px`
- Text decoration: `underline`
- Box shadow: `none`
- Font family: `SF Pro Text`

CSS:

```css
color: #1d1d1f;
font-size: 17px;
font-weight: 400;
font-family: "SF Pro Text", "SF Pro Icons", "Helvetica Neue", Helvetica, Arial, sans-serif;
text-decoration: underline;
```

### Card

- Background: `#ffffff`
- Border color: `#e5e7eb`
- Border radius: `8px`
- Border width: `1px`
- Border style: `solid`
- Padding: `16px`
- Box shadow: `none`
- Text color: `#1d1d1f`

CSS:

```css
background-color: #ffffff;
color: #1d1d1f;
border: 1px solid #e5e7eb;
border-radius: 8px;
padding: 16px;
```

## Font Assets

Use these font sources if the design system needs custom font loading.

### SF Pro Text

- 100: https://www.apple.com/wss/fonts/SF-Pro-Text/v3/sf-pro-text_ultralight.woff2
- 200: https://www.apple.com/wss/fonts/SF-Pro-Text/v3/sf-pro-text_thin.woff2
- 300: https://www.apple.com/wss/fonts/SF-Pro-Text/v3/sf-pro-text_light.woff2
- 400: https://www.apple.com/wss/fonts/SF-Pro-Text/v3/sf-pro-text_regular.woff2
- 500: https://www.apple.com/wss/fonts/SF-Pro-Text/v3/sf-pro-text_medium.woff2
- 600: https://www.apple.com/wss/fonts/SF-Pro-Text/v3/sf-pro-text_semibold.woff2
- 700: https://www.apple.com/wss/fonts/SF-Pro-Text/v3/sf-pro-text_bold.woff2
- 800: https://www.apple.com/wss/fonts/SF-Pro-Text/v3/sf-pro-text_heavy.woff2
- 900: https://www.apple.com/wss/fonts/SF-Pro-Text/v3/sf-pro-text_black.woff2

### SF Pro Icons

- 100: https://www.apple.com/wss/fonts/SF-Pro-Icons/v3/sf-pro-icons_ultralight.woff2
- 200: https://www.apple.com/wss/fonts/SF-Pro-Icons/v3/sf-pro-icons_thin.woff2
- 300: https://www.apple.com/wss/fonts/SF-Pro-Icons/v3/sf-pro-icons_light.woff2
- 400: https://www.apple.com/wss/fonts/SF-Pro-Icons/v3/sf-pro-icons_regular.woff2
- 500: https://www.apple.com/wss/fonts/SF-Pro-Icons/v3/sf-pro-icons_medium.woff2
- 600: https://www.apple.com/wss/fonts/SF-Pro-Icons/v3/sf-pro-icons_semibold.woff2
- 700: https://www.apple.com/wss/fonts/SF-Pro-Icons/v3/sf-pro-icons_bold.woff2
- 800: https://www.apple.com/wss/fonts/SF-Pro-Icons/v3/sf-pro-icons_heavy.woff2
- 900: https://www.apple.com/wss/fonts/SF-Pro-Icons/v3/sf-pro-icons_black.woff2

### SF Pro Display

- 100: https://www.apple.com/wss/fonts/SF-Pro-Display/v3/sf-pro-display_ultralight.woff2
- 200: https://www.apple.com/wss/fonts/SF-Pro-Display/v3/sf-pro-display_thin.woff2
- 300: https://www.apple.com/wss/fonts/SF-Pro-Display/v3/sf-pro-display_light.woff2
- 400: https://www.apple.com/wss/fonts/SF-Pro-Display/v3/sf-pro-display_regular.woff2
- 500: https://www.apple.com/wss/fonts/SF-Pro-Display/v3/sf-pro-display_medium.woff2
- 600: https://www.apple.com/wss/fonts/SF-Pro-Display/v3/sf-pro-display_semibold.woff2
- 700: https://www.apple.com/wss/fonts/SF-Pro-Display/v3/sf-pro-display_bold.woff2
- 800: https://www.apple.com/wss/fonts/SF-Pro-Display/v3/sf-pro-display_heavy.woff2
- 900: https://www.apple.com/wss/fonts/SF-Pro-Display/v3/sf-pro-display_black.woff2

## Design Notes

- Prefer clean spacing over dense packing.
- Keep surfaces white and typography dark.
- Use the blue accent only where it matters.
- Favor rounded pill buttons and subtle borders.
- Keep shadows minimal or absent.
- Use the Apple-style font hierarchy consistently.
