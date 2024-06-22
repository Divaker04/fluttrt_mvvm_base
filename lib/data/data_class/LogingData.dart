/// status : true
/// message : "Login Successful"
/// data : {"msrNo":1,"memberID":"9999999999","memberName":"City Bazar","mobile":"9999999999","password":"123","transactionPassword":"123","balance":"506","status":"1","message":"Login Successful"}

class LogingData {
  LogingData({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LogingData.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
LogingData copyWith({  bool? status,
  String? message,
  Data? data,
}) => LogingData(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// msrNo : 1
/// memberID : "9999999999"
/// memberName : "City Bazar"
/// mobile : "9999999999"
/// password : "123"
/// transactionPassword : "123"
/// balance : "506"
/// status : "1"
/// message : "Login Successful"

class Data {
  Data({
      num? msrNo, 
      String? memberID, 
      String? memberName, 
      String? mobile, 
      String? password, 
      String? transactionPassword, 
      String? balance, 
      String? status, 
      String? message,}){
    _msrNo = msrNo;
    _memberID = memberID;
    _memberName = memberName;
    _mobile = mobile;
    _password = password;
    _transactionPassword = transactionPassword;
    _balance = balance;
    _status = status;
    _message = message;
}

  Data.fromJson(dynamic json) {
    _msrNo = json['msrNo'];
    _memberID = json['memberID'];
    _memberName = json['memberName'];
    _mobile = json['mobile'];
    _password = json['password'];
    _transactionPassword = json['transactionPassword'];
    _balance = json['balance'];
    _status = json['status'];
    _message = json['message'];
  }
  num? _msrNo;
  String? _memberID;
  String? _memberName;
  String? _mobile;
  String? _password;
  String? _transactionPassword;
  String? _balance;
  String? _status;
  String? _message;
Data copyWith({  num? msrNo,
  String? memberID,
  String? memberName,
  String? mobile,
  String? password,
  String? transactionPassword,
  String? balance,
  String? status,
  String? message,
}) => Data(  msrNo: msrNo ?? _msrNo,
  memberID: memberID ?? _memberID,
  memberName: memberName ?? _memberName,
  mobile: mobile ?? _mobile,
  password: password ?? _password,
  transactionPassword: transactionPassword ?? _transactionPassword,
  balance: balance ?? _balance,
  status: status ?? _status,
  message: message ?? _message,
);
  num? get msrNo => _msrNo;
  String? get memberID => _memberID;
  String? get memberName => _memberName;
  String? get mobile => _mobile;
  String? get password => _password;
  String? get transactionPassword => _transactionPassword;
  String? get balance => _balance;
  String? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msrNo'] = _msrNo;
    map['memberID'] = _memberID;
    map['memberName'] = _memberName;
    map['mobile'] = _mobile;
    map['password'] = _password;
    map['transactionPassword'] = _transactionPassword;
    map['balance'] = _balance;
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}