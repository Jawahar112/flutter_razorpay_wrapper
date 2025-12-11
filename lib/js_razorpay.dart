import 'dart:js_interop';


class JsRazorpay {
  final Razorpay razorpay;

  JsRazorpay({
    required Map<dynamic, dynamic> options,
    required Function(dynamic) onFailed,
  }) : razorpay = Razorpay(
          options.jsify(),                 // <-- FIX
        )..on(
            'payment.failed',
            onFailed.toJS,                 // <-- FIX (replace allowInterop)
          );

  void open() => razorpay.open();
  void close() => razorpay.close();
}

@JS()
class Razorpay {
  external Razorpay(JSAny? options);
  external open();
  external on(String type, JSFunction onResponse);
    external close();
}

@JS('JSON.stringify')
external String stringify(Object obj);
