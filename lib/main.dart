import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thịnh đây',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF232323,
          <int, Color>{
            50: Color(0xFFFAFAFA),
            100: Color(0xFFF5F5F5),
            200: Color(0xFFEEEEEE),
            300: Color(0xFFE0E0E0),
            350: Color(0xFFD6D6D6),
            400: Color(0xFFBDBDBD),
            500: Color(0xFF363636),
            600: Color(0xFF757575),
            700: Color(0xFF616161),
            800: Color(0xFF424242),
            850: Color(0xFF303030),
            900: Color(0xFF212121),
          },
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          _BackgroundText(
            screenWidth: screenWidth,
            screenHeight: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: _isLargeScreen(screenWidth) ? 64 : 48,
                  backgroundColor: Colors.transparent,
                  foregroundImage: const AssetImage('assets/images/img_avatar.jpeg'),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(128)),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    'Nguyễn Đức Thịnh\n25/11/1997\nducthinhtrai@gmail.com\nfb.com/ducthinhtrai',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "RobotoMono",
                      fontSize: _isLargeScreen(screenWidth) ? 20 : 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundText extends StatefulWidget {
  const _BackgroundText({
    required this.screenWidth,
    required this.screenHeight,
  }) : super();

  final double screenWidth;
  final double screenHeight;

  @override
  State<StatefulWidget> createState() => _BackgroundTextState();
}

class _BackgroundTextState extends State<_BackgroundText> with SingleTickerProviderStateMixin {
  late Animation<int> _iconAnimation;
  late AnimationController _animationController;
  late int _columnCount;
  late int _itemCount;

  @override
  void initState() {
    super.initState();
    _itemCount = widget.screenHeight ~/ 40;
    _columnCount = _isLargeScreen(widget.screenWidth) ? 5 : 2;
    _animationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this)
      ..addListener(() {
        setState(() {});
      })
      ..repeat();
    _iconAnimation = IntTween(begin: 0, end: widget.screenHeight.toInt()).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        _itemCount,
        (position) => Positioned(
          top: (position * 40 + _iconAnimation.value) % widget.screenHeight,
          child: Wrap(
            spacing: 80,
            children: List.generate(
              _columnCount,
              (index) => Text(
                _backgroundText[(position * _columnCount + index) % _backgroundText.length],
                style: TextStyle(
                  fontFamily: "RobotoMono",
                  fontSize: _isLargeScreen(widget.screenWidth) ? 14 : 12,
                  color: const Color(0xff00ff00),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_isLargeScreen(double screenWidth) => screenWidth > 1080;

final List<String> _backgroundText = ("class MyHomePage extends StatefulWidget {\n" +
        "const MyHomePage({Key? key}) : super(key: key);\n" +
        "\n" +
        "@override\n" +
        "State<MyHomePage> createState() => _MyHomePageState();\n" +
        "}\n" +
        "\n" +
        "class _MyHomePageState extends State<MyHomePage> {\n" +
        "@override\n" +
        "Widget build(BuildContext context) {\n" +
        "final screenWidth = MediaQuery.of(context).size.width;\n" +
        "return Scaffold(\n" +
        "body: Stack(\n" +
        "children: [\n" +
        "Container(\n" +
        "color: Colors.black,\n" +
        "),\n" +
        "_BackgroundText(\n" +
        "screenWidth: screenWidth,\n" +
        "screenHeight: MediaQuery.of(context).size.height,\n" +
        "),\n" +
        "Center(\n" +
        "child: Row(\n" +
        "mainAxisAlignment: MainAxisAlignment.center,\n" +
        "children: <Widget>[\n" +
        "CircleAvatar(\n" +
        "radius: _isLargeScreen(screenWidth) ? 64 : 48,\n" +
        "foregroundImage: const AssetImage('images/img_avatar.jpeg'),\n" +
        "),\n" +
        "const SizedBox(\n" +
        "width: 8,\n" +
        "),\n" +
        "Container(\n" +
        "decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(128)),\n" +
        "padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),\n" +
        "child: Text(\n" +
        "'Nguyễn Đức Thịnh\\n25/11/1997\\nducthinhtrai@gmail.com\\nfb.com/ducthinhtrai',\n" +
        "textAlign: TextAlign.center,\n" +
        "style: TextStyle(\n" +
        "fontFamily: \"RobotoMono\",\n" +
        "fontSize: _isLargeScreen(screenWidth) ? 20 : 14,\n" +
        "color: Colors.black,\n" +
        "),\n" +
        "),\n" +
        "),\n" +
        "]," +
        "class _BackgroundText extends StatefulWidget {\n" +
        "const _BackgroundText({\n" +
        "required this.screenWidth,\n" +
        "required this.screenHeight,\n" +
        "}) : super();\n" +
        "\n" +
        "final double screenWidth;\n" +
        "final double screenHeight;\n" +
        "\n" +
        "@override\n" +
        "State<StatefulWidget> createState() => _BackgroundTextState();\n" +
        "}\n" +
        "\n" +
        "class _BackgroundTextState extends State<_BackgroundText> with SingleTickerProviderStateMixin {\n" +
        "late Animation<int> _iconAnimation;\n" +
        "late AnimationController _animationController;\n" +
        "late int _columnCount;\n" +
        "late int _itemCount;\n" +
        "\n" +
        "@override\n" +
        "void initState() {\n" +
        "super.initState();\n" +
        "_itemCount = widget.screenHeight ~/ 40;\n" +
        "_columnCount = _isLargeScreen(widget.screenWidth) ? 4 : 2;\n" +
        "_animationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this)\n" +
        "..addListener(() {\n" +
        "setState(() {});\n" +
        "})\n" +
        "..repeat();\n" +
        "_iconAnimation = IntTween(begin: 0, end: widget.screenHeight.toInt()).animate(_animationController);\n" +
        "}\n" +
        "\n" +
        "@override\n" +
        "Widget build(BuildContext context) {\n" +
        "return Stack(\n" +
        "children: List.generate(\n" +
        "_itemCount,\n" +
        "(position) => Positioned(\n" +
        "top: (position * 40 + _iconAnimation.value) % widget.screenHeight,\n" +
        "child: Wrap(\n" +
        "spacing: 80,\n" +
        "children: List.generate(\n" +
        "_columnCount,\n" +
        "(index) => Text(\n" +
        "_backgroundText[(position * _columnCount + index) % _backgroundText.length],\n" +
        "style: TextStyle(\n" +
        "fontFamily: \"RobotoMono\",\n" +
        "fontSize: _isLargeScreen(widget.screenWidth) ? 14 : 12,\n" +
        "color: const Color(0xff00ff00),\n" +
        "),\n" +
        "),\n" +
        "),")
    .split('\n');
