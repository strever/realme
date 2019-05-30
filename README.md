# cn.strever.realme

![Flutter logo](https://flutter-io.cn/images/flutter-mark-square-100.png#100x100)

_一款使用flutter打造的跨平台应用_

# Flutter打造跨平台应用

- [方永祥]<FANGYONGXIANG325@pingan.com.cn>

- [x] Cupertino
- [x] Material

## Requirements

- flutter sdk >= 1.5.0
- android sdk >= api 28
- xcode
- cocoapods[ios toochain]
- [android toolchain]

## 数据表

```
CREATE TABLE IF NOT EXISTS realme_note (
        id INTEGER PRIMARY KEY,
        title TEXT,
        note TEXT,
        synced INTEGER,
        deleted INTEGER,
        synced_at TEXT,
        created_at TEXT,
        updated_at TEXT
      );
      
INSERT INTO realme_note (title, note, synced, deleted, synced_at, created_at, updated_at) VALUES("markdown笔记","这里是笔记内容", 0, 0, "", "2019-05-29 12:12:12", "2019-05-29 12:12:12")'

```

## flutter是什么


- 为移动应用、浏览器应用、嵌入式应用及桌面应用打造的的便捷响应式UI框架。
  Flutter is Google’s portable UI toolkit for building beautiful, natively-compiled applications for mobile, web, and desktop from a single codebase.
- 由谷歌打造
- 跨平台-一套代码，多平台部署 Fuchsia、android、ios、web、embedded 

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## flutter项目结构

ios为iOS部分代码，使用CocoaPods管理依赖，android为Android部分代码，使用Gradle管理依赖，lib为dart代码，使用pub管理依赖。类似iOS中Cocoapods的Podfile和Podfile.lock，pub下对应的是pubspec.yaml和pubspec.lock。

## 拓展

- 混合开发 
- - flutter_boost



## Markdown widget

This is an example of how to create your own Markdown widget:

    new Markdown(data: 'Hello _world_!');

## Code blocks
Formatted Dart code looks really pretty too:

```
void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: new Markdown(data: markdownData)
    )
  ));
}
```

Enjoy!