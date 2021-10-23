
export const footer = (editPath) => {
  return {
    type: 'element',
    tagName: 'div',
    properties: {
      className: 'footer',
    },
    children: [
      {
        type: 'element',
        tagName: 'a',
        properties: {
          'data-edit': true,
          title: `https://github.com/jaywcjlove/swiftui-example/edit/main/${editPath}`, 
          href: `https://github.com/jaywcjlove/swiftui-example/edit/main/${editPath}`,
        },
        children: [ { type: 'text', value: '编辑当前页面' } ]
      },
      {
        type: 'element',
        tagName: 'a',
        properties: {
          href: 'https://jaywcjlove.gitee.io/swiftui-example/',
        },
        children: [ { type: 'text', value: '国内镜像站点 🇨🇳' } ]
      },
      {
        type: 'element',
        tagName: 'a',
        properties: {
          href: 'https://github.com/jaywcjlove/swiftui-example',
        },
        children: [ { type: 'text', value: 'Github' } ]
      },
      {
        type: 'element',
        tagName: 'a',
        properties: {
          href: 'https://gitee.com/jaywcjlove/swiftui-example',
        },
        children: [ { type: 'text', value: 'Gitee' } ]
      },
      {
        type: 'element',
        tagName: 'div',
        properties: {
          className: 'copyright',
        },
        children: [
          { type: 'text', value: 'Copyright © 2021. All rights reserved.' }
        ]
      }
    ]
  }
}