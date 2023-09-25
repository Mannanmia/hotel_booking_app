class EventAvailabilityList {
  int? id;
  int? active;
  String? textColor;
  String? end;
  String? start;
  String? event;
  String? title;
  String? backgroundColor;
  String? borderColor;
  List<String>? classNames;

  EventAvailabilityList(
      {this.id,
        this.active,
        this.textColor,
        this.end,
        this.start,
        this.event,
        this.title,
        this.backgroundColor,
        this.borderColor,
        this.classNames});

  EventAvailabilityList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    textColor = json['textColor'];
    end = json['end'];
    start = json['start'];
    event = json['event'];
    title = json['title'];
    backgroundColor = json['backgroundColor'];
    borderColor = json['borderColor'];
    classNames = json['classNames'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['textColor'] = this.textColor;
    data['end'] = this.end;
    data['start'] = this.start;
    data['event'] = this.event;
    data['title'] = this.title;
    data['backgroundColor'] = this.backgroundColor;
    data['borderColor'] = this.borderColor;
    data['classNames'] = this.classNames;
    return data;
  }
}
