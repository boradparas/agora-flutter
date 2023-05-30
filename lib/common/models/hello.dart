class Hello {
  Hello({
    required this.name,
  });

  final String name;

  String sayHello() => 'Hello $name';

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  factory Hello.fromJson(Map<String, dynamic> json) => Hello(
        name: json['name'] as String,
      );
}
