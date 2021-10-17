import path from 'path';
import fs from 'fs-extra';
import recursiveReaddirFiles from 'recursive-readdir-files';
import { create } from 'markdown-to-html-cli';

const options = {
  'github-corners': 'https://github.com/jaywcjlove/swiftui-example.git',
  document: {
    // style,
    link: [
      // { rel: 'shortcut icon', href: './favicon.ico' },
      // { rel: 'stylesheet', href: '//unpkg.com/gitalk/dist/gitalk.css' }
    ]
  },
  rewrite: (node) => {
    if (node.type === 'element' && node.tagName === 'body') {
      node.properties = { ...node.properties, id: 'totop' };
      // node.children = [topmenuElm, ...node.children, ...gitalk];
    }
    if (node.type === 'element' && node.properties.href && /.md$/.test(node.properties.href)) {
      if (/readme.md$/.test(node.properties.href.toLocaleLowerCase())) {
        node.properties.href = node.properties.href.toLocaleLowerCase().replace(/readme.md$/, 'index.html');
      } else {
        node.properties.href = node.properties.href.toLocaleLowerCase().replace(/.md$/, '.html');
      }
    }
  }
}

;(async () => {
  await fs.ensureDir('build');
  const pkg = await fs.readJson('package.json');
  const files = await recursiveReaddirFiles(process.cwd(), {
    ignored: /\/(node_modules|\.git|build)/,
    filter: (item) => /(.md|.jpg|.png)$/.test(item.path)
  });
  await Promise.all(files.map(async (item) => {
    const markdown = await fs.readFile(item.path);
    const outputPath = path.join('build', path.relative(process.cwd(), item.path).replace(/README.md$/, 'index.html'));
    await fs.ensureDir(path.dirname(outputPath));
    if (/.md$/.test(item.path)) {
      let title = markdown.toString().match(/^([\s\S]*?)---/)
      title = title ? title[1] : '';
      const html = create({
        markdown, ...options,
        document: {
          title: title ? `${title} - SwiftUI by Example` : 'SwiftUI by Example',
          ...options.document,
          meta: [
            { description: `SwiftUI 示例，技巧和技术集合，帮助我构建应用程序，解决问题以及了解 SwiftUI 的实际工作方式。${title} - SwiftUI by Example` },
            { keywords: 'SwiftUI,swift,Example,SwiftUI Example' }
          ]
        }
      });
      await fs.writeFile(outputPath, html);
      console.log(`♻️  create file: \x1b[32;1m ${outputPath} \x1b[0m`);
    } else {
      await fs.copyFile(item.path, outputPath);
      console.log(`🏞  copied file: \x1b[32;1m ${outputPath} \x1b[0m`);
    }
  }));

})();