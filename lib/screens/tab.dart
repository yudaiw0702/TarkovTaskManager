import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Sample'),
        bottom: TabBar(
          controller: _controller,
//          tabs: _buildSimpleTabs(), // (1)一般的なタブ
//        tabs: _buildCustomTabsWithError(), // (2)Iconを[Image.asset]に変えるとうまくいかない
          tabs: _buildCustomTabs(), // (3)[AnimatedBuilder]を使って[Tab]を生成
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: _buildTabPages(),
      ),
    );
  }

  /// (1)Tabの配列を生成
  List<Widget> _buildSimpleTabs() {
    return [
      Tab(icon: Icon(Icons.home), text: 'HOME'),
      Tab(icon: Icon(Icons.map), text: 'MAP'),
    ];
  }

  /// (2)IconをImage.assetに変えると、タブの選択状態によって色が変わらない
  List<Widget> _buildCustomTabsWithError() {
    return [
      // MaterialIcon : https://material.io/resources/icons/?style=baseline
      Tab(icon: Image.asset('images/soccer.png')),
      Tab(icon: Image.asset('images/rugby.png')),
    ];
  }

  /// (3)[AnimatedBuilder]を使ってTabを生成
  List<Widget> _buildCustomTabs() {
    return [
      Tab(child: _buildAnimatedWidget(Image.asset('images/soccer.png'), 0)),
      Tab(child: _buildAnimatedWidget(Image.asset('images/rugby.png'), 1)),
    ];
  }

  /// [AnimatedBuilder]でラップすることにより、タブの位置に応じて[child]のopacityを変化させます。
  /// [index]はタブのインデックスです
  Widget _buildAnimatedWidget(Widget child, int index) {
    return AnimatedBuilder(
      animation: _controller.animation,
      builder: (_, __) {
        return Opacity(
          child: child,
          opacity: _calculateOpacity(index, _controller.animation.value),
        );
      },
    );
  }

  /// 現在選択されているタブの[index]と、タブのスクロール位置を示す[value]から、Tab内のWidgetのOpacityを算出します。
  double _calculateOpacity(int index, double value) {
    if (index - 1 <= value && value <= index + 1) {
      // 選択状態および隣のタブにフォーカスが当たっている状態
      final abs = (index - value).abs();
      // quiver/iterablesと衝突するため、`math`を付与
      return math.max(math.min(1.0 - abs, 1.0), 0.5);
    } else {
      // 非選択状態
      return 0.5;
    }
  }

  /// タブの中身として表示するPage(Widget)の配列を生成
  List<Widget> _buildTabPages() {
    return [
      Container(color: Colors.grey, key: ValueKey(0)),
      Container(color: Colors.lightBlueAccent, key: ValueKey(1)),
    ];
  }
}