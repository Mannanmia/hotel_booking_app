

class LoginResponse {
  final String access_token,token_type;
  final int status,expires_in;
  LoginResponse(
      this.status, this.access_token, this.token_type ,this.expires_in);
}