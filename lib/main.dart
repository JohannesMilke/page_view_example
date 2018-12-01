import 'package:advent1_page_view/data/data.dart';
import 'package:advent1_page_view/widget/page_circle_indicator.dart';
import 'package:advent1_page_view/widget/page_entry_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'PageView';
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appTitle,
        theme: ThemeData(primaryColor: Colors.teal),
        home: MainPage(appTitle: appTitle),
      );
}

class MainPage extends StatefulWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ValueNotifier currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.appTitle),
        ),
        body: Stack(
          children: <Widget>[
            PageView.builder(
              onPageChanged: (int index) {
                currentPageNotifier.value = index;
              },
              controller: PageController(
                initialPage: currentPageNotifier.value,
              ),
              itemBuilder: (BuildContext buildContext, int index) =>
                  PageEntryWidget(entry: pages[index]),
              itemCount: pages.length,
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 8.0,
              child: PageCircleIndicator(
                itemCount: pages.length,
                currentPageNotifier: currentPageNotifier,
              ),
            ),
          ],
        ),
      );
}
