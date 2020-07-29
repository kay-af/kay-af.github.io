import 'dart:js' as js;

Future<void> gotoUrl(String url) async {
  js.context.callMethod("open", [url]);
}
