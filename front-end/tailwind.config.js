/*
** TailwindCSS Configuration File
**
** Docs: https://tailwindcss.com/docs/configuration
** Default: https://github.com/tailwindcss/tailwindcss/blob/master/stubs/defaultConfig.stub.js
*/

module.exports = {
  theme: {
    colors: {
      indigo: '#240D4D',
      lightBlue: '#F3FCFF',
      hoverBlue: '#05AFF2',
      blue: '#0468BF',
      white: '#fff',
      lightGray: '#DFE3EA'
    },
    fontSize: {
      xxs: '0.625rem',
      xs: '0.75rem',
      sm: '0.8125rem',
      smBase: '0.875rem',
      baseSm: '1rem',
      base: '1.125rem',
      baseLg: '1.5rem',
      md: '1.75rem',
      lg: '2.0625rem',
      xl: '2.5rem'
    },
    boxShadow: {
      default: '0px 2px 3px rgba(0, 0, 0, 0.08)',
      md: '0px 4px 16px rgba(0, 0, 0, 0.12), 0px 4px 4px rgba(0, 0, 0, 0.25)'
    },
    extend: {
      fontFamily: {
        sans: ['Noto Sans JP'],
      },
    }
  },
  variants: {
    borderColor: ['responsive', 'hover', 'focus', 'last'],
    borderWidth: ['responsive', 'hover', 'focus', 'last'],
    margin: ['responsive', 'hover', 'focus', 'last'],
    boxShadow: ['responsive', 'hover', 'focus', 'last']
  },
  purge: {
    // Learn more on https://tailwindcss.com/docs/controlling-file-size/#removing-unused-css
    enabled: process.env.NODE_ENV === 'production',
    content: [
      'components/**/*.vue',
      'layouts/**/*.vue',
      'pages/**/*.vue',
      'plugins/**/*.js',
      'nuxt.config.js'
    ]
  }
}
