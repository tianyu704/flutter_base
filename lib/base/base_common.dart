import 'package:flutter/material.dart';
import 'package:loading_dialog/loading_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'base_config.dart';
import 'base_widget.dart';

///
/// Create by Hugo.Guo
/// Date: 2019-08-12
///
abstract class BaseCommon {
  LoadingDialog _loadingDialog;
  State _baseWidgetState;
  BuildContext _context;

  bool _isShowError = false;
  bool _isShowEmpty = false;

  void init(BaseWidgetState baseWidgetState, BuildContext context) {
    this._baseWidgetState = baseWidgetState;
    this._context = context;
  }

  Widget buildWidget(BuildContext context);

  /// 显示加载框
  showLoading() {
    if (_loadingDialog == null) {
      _loadingDialog = LoadingDialog(
        buildContext: _context,
        width: BaseConfig.loadingWith,
        height: BaseConfig.loadingHeight,
      );
    }
    if (!_loadingDialog.isShowing()) {
      _loadingDialog.show();
    }
  }

  ///关闭加载框
  hideLoading() {
    if (_loadingDialog?.isShowing() ?? false) {
      _loadingDialog.hide();
    }
  }

  Widget getBaseView(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildWidget(),
        buildErrorWidget(),
        buildEmptyWidget(),
      ],
    );
  }

  /// 错误页
  Widget buildErrorWidget() {
    return Offstage(
      offstage: !_isShowError,
      child: BaseConfig.errorWidget ??
          Center(
            child: Icon(
              Icons.import_contacts,
              size: 60,
            ),
          ),
    );
  }

  ///空页面
  Widget buildEmptyWidget() {
    return Offstage(
      offstage: !_isShowEmpty,
      child: BaseConfig.emptyWidget ??
          Center(
            child: Icon(
              Icons.assignment,
              size: 60,
            ),
          ),
    );
  }

  /// 展示错误页面
  setErrorVisible(bool isVisible) {
    // ignore: invalid_use_of_protected_member
    _baseWidgetState.setState(() {
      if (isVisible) {
        _isShowEmpty = false;
      }
      _isShowError = isVisible;
    });
  }

  /// 展示空白页
  setEmptyVisible(bool isVisible) {
    // ignore: invalid_use_of_protected_member
    _baseWidgetState.setState(() {
      if (isVisible) {
        _isShowError = false;
      }
      _isShowEmpty = isVisible;
    });
  }

  /// 展示toast
  showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      fontSize: BaseConfig.toastFontSize,
    );
  }

  ///返回屏幕宽度
  double getScreenWidth() {
    return MediaQuery.of(_context).size.width;
  }

  ///返回屏幕高度
  double getScreenHeight() {
    return MediaQuery.of(_context).size.height;
  }


}
