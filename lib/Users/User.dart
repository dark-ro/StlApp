class StylisteUser {
  final String? email;
  final String? password;
  // String societyName;
  String? uid;

  StylisteUser({
    this.email,
    this.password,
    this.uid,
    // required this.societyName,
  });

  set SetUid(value) => {
        (uid = value),
      };
  // set SetSociety(value) => {
  //       (societyName = value),
  //     };

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        //'society': societyName,
        'uid': uid,
      };
}
