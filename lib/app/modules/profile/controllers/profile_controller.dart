import 'package:get/get.dart';
import 'package:glass/app/models/profile_model.dart';

class ProfileController extends GetxController {
  var profile = Profile(
    name: 'John Doe',
    email: 'john.doe@example.com',
    initials: 'JD',
    isPremium: true,
    orders: 12,
    wishlist: 8,
    spent: 2400.0,
  ).obs;

  void updateName(String name) {
    profile.update((p) {
      if (p != null) {
        p.name = name;
        p.initials = name.isNotEmpty
            ? name.trim().split(' ').map((e) => e[0]).take(2).join()
            : '';
      }
    });
  }

  void logout() {
    // Clear profile or navigate
    Get.offAllNamed('/login');
  }
}
