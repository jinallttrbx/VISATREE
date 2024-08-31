import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileService {
  static const String baseUrl = 'https://your-api-endpoint.com'; // Replace with your API endpoint

  Future<void> updateProfileImageWithBodyData(String imagePath, String name, int age) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/updateProfile'));

      // Add image file to the request
      request.files.add(await http.MultipartFile.fromPath('profileImage', imagePath));

      // Add body data
      request.fields['name'] = name;
      request.fields['age'] = age.toString();

      var response = await request.send();

      if (response.statusCode == 200) {
        // Successfully updated the profile
        print('Profile updated successfully');
      } else {
        // Handle error
        print('Failed to update profile');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}

// Example usage
void main() async {
  String imagePath = 'path_to_your_image.jpg'; // Replace with the actual path of your image
  String name = 'John Doe';
  int age = 30;

  ProfileService profileService = ProfileService();
  await profileService.updateProfileImageWithBodyData(imagePath, name, age);
}
