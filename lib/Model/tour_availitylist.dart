class TourAvailibility {
  int? id;
  int? active;
  String? price;
  bool? isDefault;
  String? textColor;
  String? priceHtml;
  String? maxGuests;
  String? event;
  String? title;
  String? end;
  String? start;
  String? backgroundColor;
  String? borderColor;
  List<String>? classNames;

  TourAvailibility(
      {this.id,
        this.active,
        this.price,
        this.isDefault,
        this.textColor,
        this.priceHtml,
        this.maxGuests,
        this.event,
        this.title,
        this.end,
        this.start,
        this.backgroundColor,
        this.borderColor,
        this.classNames});

  TourAvailibility.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    price = json['price'];
    isDefault = json['is_default'];
    textColor = json['textColor'];
    priceHtml = json['price_html'];
    maxGuests = json['max_guests'];
    event = json['event'];
    title = json['title'];
    end = json['end'];
    start = json['start'];
    backgroundColor = json['backgroundColor'];
    borderColor = json['borderColor'];
    classNames = json['classNames'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['price'] = this.price;
    data['is_default'] = this.isDefault;
    data['textColor'] = this.textColor;
    data['price_html'] = this.priceHtml;
    data['max_guests'] = this.maxGuests;
    data['event'] = this.event;
    data['title'] = this.title;
    data['end'] = this.end;
    data['start'] = this.start;
    data['backgroundColor'] = this.backgroundColor;
    data['borderColor'] = this.borderColor;
    data['classNames'] = this.classNames;
    return data;
  }
}
