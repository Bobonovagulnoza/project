import '../models/user.dart';
import '../network/doi.dart';

class UserRepository {
  final DioClient dioClient;

  UserRepository({required this.dioClient});

  Future<List<User>> fetchUsers() async {
    final response = await dioClient.dio.get('https://jsonplaceholder.typicode.com/users');
    return (response.data as List).map((json) => User.fromJson(json)).toList();
  }
}
