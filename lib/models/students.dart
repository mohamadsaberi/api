class Student {
  final int id;
  final String name; // Changed from firstName and lastName
  final int age;
  final String gender;
  final Address address; // Added Address class
  final String email;
  final String phone;
  final List<String> courses;
  final double gpa;
  final String image;

  Student({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,required this.address,
    required this.email,
    required this.phone,
    required this.courses,
    required this.gpa,
    required this.image,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      address: Address.fromJson(json['address']), // Parse address
      email: json['email'],
      phone: json['phone'],
      courses: List<String>.from(json['courses']), // Parse courses
      gpa: json['gpa'].toDouble(), // Parse gpa as double
      image: json['image'],
    );
  }
}

// Address class to represent the address object
class Address {
  final String street;
  final String city;
  final String zip;
  final String country;

  Address({
    required this.street,
    required this.city,
    required this.zip,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      zip: json['zip'],
      country: json['country'],
    );
  }
}