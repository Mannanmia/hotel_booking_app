class BookingHistoryResponse {
  String? page;
  List<Rows>? rows;
  int? uid;
  List<String>? statues;
  int? status;

  BookingHistoryResponse(
      {this.page, this.rows, this.uid, this.statues, this.status});

  BookingHistoryResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
    uid = json['uid'];
    statues = json['statues'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    data['uid'] = this.uid;
    data['statues'] = this.statues;
    data['status'] = this.status;
    return data;
  }
}

class Rows {
  int? id;
  String? title;
  String? date;
  String? startDate;
  String? endDate;
  String? duration;
  String? total;
  String? paid;
  String? due;
  String? status;
  String? name;
  String? email;
  String? phone;
  Gateway? gateway;

  Rows(
      {this.id,
        this.title,
        this.date,
        this.startDate,
        this.endDate,
        this.duration,
        this.total,
        this.paid,
        this.due,
        this.status,
        this.name,
        this.email,
        this.phone,
        this.gateway});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    duration = json['duration'];
    total = json['total'];
    paid = json['paid'];
    due = json['due'];
    status = json['status'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gateway =
    json['gateway'] != null ? new Gateway.fromJson(json['gateway']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['duration'] = this.duration;
    data['total'] = this.total;
    data['paid'] = this.paid;
    data['due'] = this.due;
    data['status'] = this.status;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.gateway != null) {
      data['gateway'] = this.gateway!.toJson();
    }
    return data;
  }
}

class Gateway {
  String? name;
  bool? isOffline;

  Gateway({this.name, this.isOffline});

  Gateway.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isOffline = json['is_offline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['is_offline'] = this.isOffline;
    return data;
  }
}
