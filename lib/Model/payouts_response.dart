class PayoutsResponse {
   Database? paysdata;
  int? status;

  PayoutsResponse({this.paysdata, this.status});

  PayoutsResponse.fromJson(Map<String, dynamic> json) {
  paysdata = json['0'] != null ? new Database.fromJson(json['0']) : null;
  status = json['status'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (this.paysdata != null) {
  data['0'] = this.paysdata!.toJson();
  }
  data['status'] = this.status;
  return data;
  }
}

class Database {
List<Payouts>? payouts;
List<Rows>? rows;
Mothods? mothods;
int? availablePayoutAmount;

Database({this.payouts, this.rows, this.mothods, this.availablePayoutAmount});

Database.fromJson(Map<String, dynamic> json) {
if (json['payouts'] != null) {
payouts = <Payouts>[];
json['payouts'].forEach((v) { payouts!.add(new Payouts.fromJson(v)); });
}
if (json['rows'] != null) {
rows = <Rows>[];
json['rows'].forEach((v) { rows!.add(new Rows.fromJson(v)); });
}
mothods = json['mothods'] != null ? new Mothods.fromJson(json['mothods']) : null;
availablePayoutAmount = json['available_payout_amount'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if (this.payouts != null) {
data['payouts'] = this.payouts!.map((v) => v.toJson()).toList();
}
if (this.rows != null) {
data['rows'] = this.rows!.map((v) => v.toJson()).toList();
}
if (this.mothods != null) {
data['mothods'] = this.mothods!.toJson();
}
data['available_payout_amount'] = this.availablePayoutAmount;
return data;
}
}

class Payouts {
String? id;
String? name;
String? desc;
String? min;
Null? order;

Payouts({this.id, this.name, this.desc, this.min, this.order});

Payouts.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
desc = json['desc'];
min = json['min'];
order = json['order'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['desc'] = this.desc;
data['min'] = this.min;
data['order'] = this.order;
return data;
}
}

class Rows {
int? id;
String? vendorId;
String? amount;
String? status;
String? payoutMethod;
String? accountInfo;
Null? noteToAdmin;
Null? noteToVendor;
Null? lastProcessBy;
Null? payDate;
String? createUser;
Null? updateUser;
String? createdAt;
String? updatedAt;

Rows({this.id, this.vendorId, this.amount, this.status, this.payoutMethod, this.accountInfo, this.noteToAdmin, this.noteToVendor, this.lastProcessBy, this.payDate, this.createUser, this.updateUser, this.createdAt, this.updatedAt});

Rows.fromJson(Map<String, dynamic> json) {
id = json['id'];
vendorId = json['vendor_id'];
amount = json['amount'];
status = json['status'];
payoutMethod = json['payout_method'];
accountInfo = json['account_info'];
noteToAdmin = json['note_to_admin'];
noteToVendor = json['note_to_vendor'];
lastProcessBy = json['last_process_by'];
payDate = json['pay_date'];
createUser = json['create_user'];
updateUser = json['update_user'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['vendor_id'] = this.vendorId;
data['amount'] = this.amount;
data['status'] = this.status;
data['payout_method'] = this.payoutMethod;
data['account_info'] = this.accountInfo;
data['note_to_admin'] = this.noteToAdmin;
data['note_to_vendor'] = this.noteToVendor;
data['last_process_by'] = this.lastProcessBy;
data['pay_date'] = this.payDate;
data['create_user'] = this.createUser;
data['update_user'] = this.updateUser;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
}

class Mothods {
Bank? bank;
Bank? bkash;

Mothods({this.bank, this.bkash});

Mothods.fromJson(Map<String, dynamic> json) {
bank = json['bank'] != null ? new Bank.fromJson(json['bank']) : null;
bkash = json['bkash'] != null ? new Bank.fromJson(json['bkash']) : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if (this.bank != null) {
data['bank'] = this.bank!.toJson();
}
if (this.bkash != null) {
data['bkash'] = this.bkash!.toJson();
}
return data;
}
}

class Bank {
String? id;
String? name;
String? desc;
String? min;
Null? order;
String? user;

Bank({this.id, this.name, this.desc, this.min, this.order, this.user});

Bank.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
desc = json['desc'];
min = json['min'];
order = json['order'];
user = json['user'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['desc'] = this.desc;
data['min'] = this.min;
data['order'] = this.order;
data['user'] = this.user;
return data;
}
}