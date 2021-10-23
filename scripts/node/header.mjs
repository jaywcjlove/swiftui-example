import { favicon } from './favicon.mjs';

export const header = (homeUrl) => {
  return {
      type: 'element',
      tagName: 'header',
      properties: { className: 'header', },
      children: [
        {
          type: 'element',
          tagName: 'article',
          properties: { className: 'inner', },
          children: [
            {
              type: 'element',
              tagName: 'a',
              properties: {
                className: 'logo',
                href: homeUrl || 'https://jaywcjlove.github.io/swiftui-example',
              },
              children: [
                {
                  type: 'element',
                  tagName: 'img',
                  properties: {
                    src: favicon,
                    alt: 'swiftui example logo',
                  },
                  children: []
                }
              ]
            }, {
              type: 'element',
              tagName: 'div',
              properties: {
                className: 'title',
              },
              children: [
                { type: 'text', value: 'SwiftUI Example' }
              ]
            }, {
              type: 'element',
              tagName: 'nav',
              properties: {
                className: 'nav',
              },
              children: [
                
              ]
            }
          ]
        }
      ]
  }
}