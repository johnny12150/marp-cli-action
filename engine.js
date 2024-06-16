const { Marp } = require('@marp-team/marp-core')
const { Marpit } = require('@marp-team/marpit')
const highlightLines = require('markdown-it-highlight-lines')

module.exports = (opts) => new Marp(opts)
  .use(highlightLines)
  .use(({ Marpit }) => {
      const { highlighter } = Marpit
  
      // Override Marp Core's highlighter to wrap each lines by ordered list items
      marpit.highlighter = (...args) => {
        const original = highlighter(...args)
        const listItems = original
          .split(/\n(?!$)/) // Don't split at the trailing newline
          .map((line) => `<li>${line}</li>`)
  
        return `<ol>${listItems.join('')}</ol>`
    }
