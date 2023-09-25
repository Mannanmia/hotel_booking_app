class GetProfileResponse {
  Data? data;
  int? status;

  GetProfileResponse({this.data, this.status});

  GetProfileResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? emailVerifiedAt;
  String? address;
  Null? address2;
  String? phone;
  String? birthday;
  String? city;
  Null? state;
  String? country;
  Null? zipCode;
  Null? lastLoginAt;
  String? avatarId;
  String? bio;
  String? status;
  Null? createUser;
  Null? updateUser;
  Null? vendorCommissionAmount;
  Null? vendorCommissionType;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  Null? paymentGateway;
  Null? totalGuests;
  Null? locale;
  Null? businessName;
  String? verifySubmitStatus;
  String? isVerified;
  String? avatarUrl;
  String? avatarThumbUrl;

  Data(
      {this.id,
        this.name,
        this.firstName,
        this.lastName,
        this.email,
        this.emailVerifiedAt,
        this.address,
        this.address2,
        this.phone,
        this.birthday,
        this.city,
        this.state,
        this.country,
        this.zipCode,
        this.lastLoginAt,
        this.avatarId,
        this.bio,
        this.status,
        this.createUser,
        this.updateUser,
        this.vendorCommissionAmount,
        this.vendorCommissionType,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.paymentGateway,
        this.totalGuests,
        this.locale,
        this.businessName,
        this.verifySubmitStatus,
        this.isVerified,
        this.avatarUrl,
        this.avatarThumbUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    address = json['address'];
    address2 = json['address2'];
    phone = json['phone'];
    birthday = json['birthday'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipCode = json['zip_code'];
    lastLoginAt = json['last_login_at'];
    avatarId = json['avatar_id'];
    bio = json['bio'];
    status = json['status'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    vendorCommissionAmount = json['vendor_commission_amount'];
    vendorCommissionType = json['vendor_commission_type'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    paymentGateway = json['payment_gateway'];
    totalGuests = json['total_guests'];
    locale = json['locale'];
    businessName = json['business_name'];
    verifySubmitStatus = json['verify_submit_status'];
    isVerified = json['is_verified'];
    avatarUrl = json['avatar_url'];
    avatarThumbUrl = json['avatar_thumb_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['address'] = this.address;
    data['address2'] = this.address2;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip_code'] = this.zipCode;
    data['last_login_at'] = this.lastLoginAt;
    data['avatar_id'] = this.avatarId;
    data['bio'] = this.bio;
    data['status'] = this.status;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['vendor_commission_amount'] = this.vendorCommissionAmount;
    data['vendor_commission_type'] = this.vendorCommissionType;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['payment_gateway'] = this.paymentGateway;
    data['total_guests'] = this.totalGuests;
    data['locale'] = this.locale;
    data['business_name'] = this.businessName;
    data['verify_submit_status'] = this.verifySubmitStatus;
    data['is_verified'] = this.isVerified;
    data['avatar_url'] = this.avatarUrl;
    data['avatar_thumb_url'] = this.avatarThumbUrl;
    return data;
  }
}
