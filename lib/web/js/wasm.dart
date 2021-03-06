@JS()
library wasm;

import 'package:openpgp/web/js/promise.dart';
import 'package:js/js.dart';

@JS('WebAssembly')
class WebAssembly {
  external static Promise<InstanceResult> instantiateStreaming(
    dynamic source,
    dynamic importObject,
  );
  external static Promise<InstanceResult> instantiate(
    dynamic bufferSource,
    dynamic importObject,
  );
}

@JS()
class InstanceResult {
  external dynamic get module;
  external dynamic get instance;
}
