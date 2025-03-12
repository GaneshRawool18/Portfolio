import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<void> sendEmailJS(
      String senderEmail, String subject, String message, String name) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': 'service_uwyp1i9',
        'template_id': 'template_1v4vpjn',
        'user_id': 'GMJSbUzvHmFtIP5Cz',
        'template_params': {
          'senderEmail': senderEmail,
          'name': name,
          'subject': subject,
          'message': message,
        }
      }),
    );

    if (response.statusCode == 200) {
      print('Email sent successfully!');
    } else {
      print('Failed to send email: ${response.body}');
    }
  }
}
