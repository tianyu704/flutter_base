const int pageSize = 30;

///地址数据
class Address {
  static const String host = "https://sleep.jappstore.com/";

  ///获取用户信息
  static loginUser() {
    return "${host}api/sessions";
  }

  ///获取用户信息
  static getUserInfo() {
    return "${host}api/users/info";
  }


}
