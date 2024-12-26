class AuthUserDto {
  final String id;
  final String name;
  final String token;


  const AuthUserDto({
    this.id = '',
    this.name = '',
    this.token =''
  });

  @override
  String toString() {
    return 'AuthUserDto{id: $id, name: $name}';
  }
}
