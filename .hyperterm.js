module.exports = {
  config: {

    // default font size in pixels for all tabs
    fontSize: 16,

    // font family with optional fallbacks
    fontFamily: 'Menlo, monospace',

    // terminal cursor background color (hex)
    cursorColor: 'black',

    // color of the text
    foregroundColor: 'black',

    // terminal background color
    backgroundColor: 'white',

    // border color (window, tabs)
    borderColor: 'white',

    // custom css to embed in the main window
    css: `
      .tab_textInner {
        color: black;
      }
    `,

    // custom css to embed in the terminal window
    termCSS: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // some color overrides. see http://bit.ly/29k1iU2 for
    // the full list
    colors: [
      '#171717',
      '#ce3a2f',
      '#56bd22',
      '#ffaf00',
      '#5c95da',
      '#80807f',
      '#8780c5',
      '#ebebeb',
      '#929292',
      '#d6d6d6',
      '#c0c0c0',
      '#e0e0e0',
      '#ebebeb',
      '#515151',
      '#333333',
      '#ffffff'
    ]
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyperterm-blink',
    'hyperterm-title',
    'hyperterm-dibdabs'
  ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [
    // '/Users/supercrabtree/dev/hyperterm-dibdabs'
  ]
};
