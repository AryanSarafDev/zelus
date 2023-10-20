import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase/supabase.dart';

class AuthService {
  final _authClient = Get.find<SupabaseClient>();
  Future otp(String email,String otp) async {
    final AuthResponse res = await _authClient.auth.verifyOTP(
      type: OtpType.email,
      token: otp,
     email: email

    );
    return res;
  }
  Future sendOTP(String email,)
  async {
    final user = _authClient.auth.signInWithOtp(email: email);
  }
  Future createuser(String email,String name, String address,bool org)
  async {
    final response = await _authClient.from('Users').insert([
      {"address":address  ,"name": name, "Email": email,"isorg":org}
    ]);
    if (response.error == null) {
      return response;
    }
  }
}
