import 'package:flutter/material.dart';
import 'package:lifecycle_state/lifecycle_state.dart';
import 'base_config.dart';
import 'base_common.dart';

///
/// Create by Hugo.Guo
/// Date: 2019-08-12
///
abstract class BaseWidgetState extends LifecycleState<StatefulWidget>
    with BaseCommon {
  @override
  void onCreate() {
    // TODO: implement onCreate
    super.onCreate();
    init(this, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: getBaseView(context),
      floatingActionButton: buildFloatingActionButton(),
      backgroundColor:
          BaseConfig.backgroundColor ?? Theme.of(context).backgroundColor,
    );
  }

  /// appbar
  Widget buildAppBar() {
    return null;
  }

  /// floatingActionButton
  Widget buildFloatingActionButton() {
    return null;
  }
}