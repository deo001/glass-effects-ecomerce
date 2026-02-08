class Profile {
  String name;
  String email;
  String initials;
  bool isPremium;
  int orders;
  int wishlist;
  double spent;

  Profile({
    required this.name,
    required this.email,
    required this.initials,
    this.isPremium = false,
    this.orders = 0,
    this.wishlist = 0,
    this.spent = 0.0,
  });
}
