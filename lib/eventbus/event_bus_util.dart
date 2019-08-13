import 'dart:async';

import 'package:event_bus/event_bus.dart';

///
/// Create by Hugo.Guo
/// Date: 2019-06-26
///
EventBus eventBus = EventBus();

class EventBusUtil {
  static StreamSubscription<T> listen<T>(void onData(T event)) {
    return eventBus.on<T>().listen(onData);
  }

  /// example
  static fireRefreshLike() {
//    eventBus.fire(RefreshLike());
  }
}
