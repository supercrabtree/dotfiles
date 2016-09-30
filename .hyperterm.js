module.exports = {
  config: {

    // default font size in pixels for all tabs
    fontSize: 16,

    // font family with optional fallbacks
    // fontFamily: 'Fira Code, Menlo, monospace',
    fontFamily: 'SF Mono, Menlo, monospace',

    // terminal cursor background color (hex)
    cursorColor: 'rgba(0,0,0,0.4)',

    // color of the text
    foregroundColor: 'black',

    // terminal background color
    backgroundColor: 'white',

    // turn off bell
    bell: false,

    // border color (window, tabs)
    borderColor: 'white',

    // custom css to embed in the main window
    css: `
      .tab_tab:before {
        position: absolute;
        content: " ";
        border-bottom: 1px solid #808080;
        display: block;
        left: 0px;
        right: 0px;
        bottom: -1px;
      }
      .tab_textInner {
        font-family: sans-serif;
        font-size: 14px;
        color: #808080;
      }
      .tab_active .tab_textInner {
        color: black;
      }
      .tab_active,
      .tab_active:before {
        border-bottom: none !important;
      }
    `,

    // custom css to embed in the terminal window
    termCSS: `
      x-row span {
        font-weight: normal !important;
      }
    `,

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '5px 10px',

    windowSize: [800, 800],

    // some color overrides. see http://bit.ly/29k1iU2 for
    // the full list
    colors: {
      black:        '#000000',
      red:          '#bf2222',
      green:        '#4ead1f',
      yellow:       '#ffaf00',
      blue:         '#2275bf',
      magenta:      '#80807f',
      cyan:         '#8780c5',
      white:        '#ebebeb',
      lightBlack:   '#808080',
      lightRed:     '#bf2222',
      lightGreen:   '#4ead1f',
      lightYellow:  '#ffaf00',
      lightBlue:    '#2275bf',
      lightMagenta: '#80807f',
      lightCyan:    '#8780c5',
      lightWhite:   '#ebebeb'
    }
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: ['hyperterm-blink', 'hyperterm-title', 'hyperterm-dibdabs', "hypercwd"],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [
    // '/Users/supercrabtree/dev/hyperterm-dibdabs'
  ]
};
