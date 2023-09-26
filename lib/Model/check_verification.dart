

class VerificationResponse {
  String? phoneNumber;
  bool isIdcardVarified;
  bool isTradeLicenceVerified;
  bool isPhoneVarified;

  VerificationResponse(this.phoneNumber,this.isIdcardVarified,this.isTradeLicenceVerified,this.isPhoneVarified);
}