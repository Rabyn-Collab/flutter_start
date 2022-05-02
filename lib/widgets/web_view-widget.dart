import 'package:flutter/material.dart';
import 'package:flutter_projects_start/provider/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';



class WebDetail extends StatelessWidget {
final String link;
WebDetail(this.link);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Consumer(
              builder: (context, ref, child) {
                final value = ref.watch(proProvider).value;
                return Column(
                  children: [
                    LinearProgressIndicator(
                      color: Colors.red,
                      value: value,
                    ),
                    Expanded(
                      child: WebView(
                        initialUrl: link,
                        javascriptMode: JavascriptMode.unrestricted,
                        onProgress: (val) {
                          final d = val/100;
                          ref.read(proProvider).changeValue(d);
                        },
                      ),
                    )
                  ],
                );
              }
            )
        )
    );
  }
}
