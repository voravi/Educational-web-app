import 'package:educational_web_app/screens/home_screen/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class EducationalWebScreen extends StatefulWidget {
  const EducationalWebScreen({Key? key}) : super(key: key);



  @override
  _EducationalWebScreenState createState() => _EducationalWebScreenState();
}

String? url;

class _EducationalWebScreenState extends State<EducationalWebScreen> {
  InAppWebViewController? webViewController;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    url = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Web App"),
        actions: [
          IconButton(
            onPressed: () {
              webViewController?.goBack();
            },
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              webViewController?.reload();
            },
            icon: Icon(Icons.restart_alt),
          ),
          IconButton(
            onPressed: () {
              webViewController?.goForward();
            },
            icon: Icon(Icons.arrow_forward),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(url!),
        ),
        initialOptions: options,
      ),
    );
  }
}
