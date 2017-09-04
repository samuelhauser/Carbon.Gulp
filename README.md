Carbon/Gulp
===========

[![Latest Stable Version](https://poser.pugx.org/carbon/gulp/v/stable)](https://packagist.org/packages/carbon/gulp)
[![Total Downloads](https://poser.pugx.org/carbon/gulp/downloads)](https://packagist.org/packages/carbon/gulp)
[![License](https://poser.pugx.org/carbon/gulp/license)](LICENSE)

Carbon/Gulp is a delicious blend of tasks and build tools poured into Gulp to
form a full-featured modern asset pipeline for Flow Framework and Neos CMS.
Based on https://github.com/jonnitto/gulpfile.js and the inspiration of
[@dfeyer](https://github.com/dfeyer) from [ttree ltd](https://github.com/ttreeagency).

## Installation

```bash
composer require --dev carbon/gulp
```

When the package is installed you can copy the boilerplate files:

```bash
cp -R Build/Gulp/boilerplate/ ./
```

**Warning**: Check the content of the `boilerplate` directory to not override
important stuffs on your distribution. Your are free to not use the provided templates
or customize them to match your own requirements. The following document is based on the
official templates.


### Install Dependencies
Make sure Node & [Yarn](https://yarnpkg.com) installed. I recommend using [NVM](https://github.com/creationix/nvm) to manage versions.

```bash
# Enable the correct nvm
nvm use
# Install the package dependencies
yarn
# Show available tasks
yarn tasks

```

You must see something like this:

```bash
Tasks
├── build             Generates all Assets, Javascript and CSS files
│   --b, --beautify  … Beautify and dont't compress files
│   --d, --debug     … Files dont't get compressed
│   --n, --nomaps    … Don't write sourcemaps
├── compress         Compress all CSS/JS with Brotli and Zopfli
├── css              Render CSS Files
│   --b, --beautify  … Beautify and dont't compress files
│   --d, --debug     … Files dont't get compressed
│   --n, --nomaps    … Don't write sourcemaps
├─┬ default           Generates all Assets, Javascript and CSS files & watch them
│ │ --b, --beautify  … Beautify and dont't compress files
│ │ --d, --debug     … Files dont't get compressed
│ │ --n, --nomaps    … Don't write sourcemaps
│ └─┬ <series>
│   ├── build
│   └── watch
├── js               Render Javascript Files
│   --b, --beautify  … Beautify and dont't compress files
│   --d, --debug     … Files dont't get compressed
│   --n, --nomaps    … Don't write sourcemaps
├── lint             Lint Javascript and CSS files
├── optimizeImages   Optimize images and overrite them in the public folder
├─┬ pipeline         Build task for pipeline
│ └─┬ <series>
│   ├── build
│   └── optimizeImages
├── scss             Render _all.scss, _allsub.scss and _allFusion.scss Files
├── sprite           Create SVG Sprite
└── watch            Watch files and regenereate them

```

Add your own dependencies with [`yarn add`](https://yarnpkg.com/en/docs/usage).

### Overview of commands

Command         | Watcher | Behaviour
----------------| ------- | ---------------------------------------------------------------
`yarn start`    |    x    | Generates all Assets, Javascript and CSS files
`yarn tasks`    |         | Show all available tasks
`yarn beautify` |    x    | Beautify and dont't compress files
`yarn debug`    |    x    | Files dont't get compressed
`yarn nomaps`   |    x    | Don't write sourcemaps
`yarn build`    |         | Runs the build process for production
`yarn css`      |         | Render CSS Files
`yarn scss`     |         | Render `_all.scss`, `_allsub.scss` and `_allFusion.scss` Files
`yarn js`       |         | Render Javascript Files
`yarn images`   |         | Optimize images and overwrite them in the source folder
`yarn pipeline` |         | Build, optimize and compress (if enabled) files
`yarn compress` |         | Compress all CSS/JS with Brotli and Zopfli


## Overview of tools

Features       | Tools Used
-------------- | ---------------------
**CSS**        | [Sass](http://sass-lang.com) ([Libsass](http://sass-lang.com/libsass) via [node-sass](https://github.com/sass/node-sass)) and [PostCSS](http://postcss.org)
**Javascript** | [Rollup JS](http://rollupjs.org) with [Bublé](https://buble.surge.sh/guide) or [Babel](https://babeljs.io/)
**Images**     | Compression with [imagemin](https://www.npmjs.com/package/gulp-imagemin). Run width `gulp optimizeImages`. Overwrites files in the resource folder.
**Icons**      | Auto-generated [SVG Sprites](https://github.com/w0rm/gulp-svgstore) and/or [Icon Fonts](https://www.npmjs.com/package/gulp-iconfont)
**Lint**       | [ESLint](http://eslint.org/) and [stylelint](https://stylelint.io) included

## CSS

### SCSS

These small helpers can make your developer life much easier. These files get filled automatically by the task `scss`

Filename              | Description
--------------------- | ----------------------
**`_all.scss`**       | Every file from the same directory get an `@import` statement.
**`_allsub.scss`**    | Every file from sub directories get an `@import` statement.
**`_allFusion.scss`** | Every file from the Fusion folder get an `@import` statement.

Files and folders with beginning underscore (`_`) get ignored.

### PostCSS

Following plugins are included:

Plugin                                                                                  | Description
--------------------------------------------------------------------------------------- | ----------------------
**[postcss-rtl](https://www.npmjs.com/package/postcss-rtl)**                            | PostCSS plugin for RTL-optimizations. **Turned off by default**
**[postcss-assets](https://www.npmjs.com/package/postcss-assets)**                      | PostCSS plugin to manage assets
**[postcss-magic-animations](https://www.npmjs.com/package/postcss-magic-animations)**  | Plugin that adds `@keyframes` from [Magic Animations](https://github.com/miniMAC/magic)
**[postcss-vmax](https://www.npmjs.com/package/postcss-vmax)**                          | Use vmax units in Edge and Internet Explorer
**[postcss-short](https://www.npmjs.com/package/postcss-short)**                        | Short creates and extends shorthand properties in CSS
**[postcss-center](https://www.npmjs.com/package/postcss-center)**                      | PostCSS plugin to center elements
**[postcss-grid-kiss](https://www.npmjs.com/package/postcss-grid-kiss)**                | A PostCSS plugin to keep CSS grids stupidly simple
**[rucksack-css](https://simplaio.github.io/rucksack/)**                                | A little bag of CSS superpowers
**[postcss-flexbox](https://www.npmjs.com/package/postcss-flexbox)**                    | Flexbox layouts made easy with PostCSS
**[pleeease-filters](https://www.npmjs.com/package/pleeease-filters)**                  | Convert CSS shorthand filters to SVG ones
**[postcss-selector-matches](https://www.npmjs.com/package/postcss-selector-matches)**  | PostCSS plugin to transform :matches() W3C CSS pseudo class to more compatible CSS selectors
**[postcss-selector-not](https://www.npmjs.com/package/postcss-selector-not)**          | PostCSS plugin to transform :not() W3C CSS leve 4 pseudo class to :not() CSS level 3 selectors
**[postcss-pseudoelements](https://www.npmjs.com/package/postcss-pseudoelements)**      | PostCSS plugin to add single-colon CSS 2.1 syntax pseudo selectors (i.e. :before)
**[postcss-font-awesome](https://www.npmjs.com/package/postcss-font-awesome)**          | PostCSS plugin to pull in a Font Awesome's icon unicode using content.
**[postcss-custom-media](https://www.npmjs.com/package/postcss-custom-media)**          | PostCSS plugin to transform W3C CSS Custom Media Queries syntax to more compatible CSS
**[postcss-media-minmax](https://www.npmjs.com/package/postcss-media-minmax)**          | Writing simple and graceful media queries.
**[postcss-quantity-queries](https://www.npmjs.com/package/postcss-quantity-queries)**  | PostCSS plugin enabling quantity-queries
**[postcss-fixes](https://www.npmjs.com/package/postcss-fixes)**                        | PostCSS plugin to fix known Browser Bugs.
**[css-mqpacker](https://www.npmjs.com/package/css-mqpacker)**                          | Pack same CSS media query rules into one media query rule.
**[postcss-round-subpixels](https://www.npmjs.com/package/postcss-round-subpixels)**    | Plugin that rounds sub-pixel (eg: 12.87378px) values to the nearest full pixel.
**[postcss-reporter](https://www.npmjs.com/package/postcss-reporter)**                  | Log PostCSS messages in the console
**[postcss-pxtorem](https://www.npmjs.com/package/postcss-pxtorem)**                    | A plugin for PostCSS that generates rem units from pixel units.
**[cssnano](http://cssnano.co)**                                                        | Modern CSS compression


## Configuration

You can read the default configuration in `config.json`, if you need to override
the configuration for a specific site package, you can create a `Gulp.json` in
the `Configuration` directory, like this:

```json
{
    "root": {
        "inlineAssets": true
    },
    "tasks": {
        "js": {
            "rollup": {
                "plugins": {
                    "commonjs": {
                        "namedExports": {
                            "node_modules/barba.js/dist/barba.js": [ "Barba" ]
                        }
                    }
                }
            }
        }
    }
}
```

This configuration render the `*.js` and `*.css` into the given folder
and add a named export to `barba.js`

If you want to enable a few settings just for you and not all your
other workbuddies, you can create a `gulp.json` in your root directory.
The settings from the different jsons get merged together.

```json
{
    "root": {
        "notifications": true
    },
    "browserSync": {
        "proxyRootFolder": false
    }
}
```

This configuration enable notifications and disable the
proxy based by project folder name.
