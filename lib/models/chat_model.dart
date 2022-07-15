class ChatModel{
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final bool isgroup;
  final String? status;

  ChatModel({this.status, required this.isgroup, required this.name, required this.message, required this.time, required this.avatarUrl});
}
  
class UserModel{
  final String name;
  final String? status;
  final String? message;
  final String time;
  final String? avatarUrl;
  final bool isgroup;
  bool? select=false;
  UserModel({this.message, required this.time, required this.isgroup, required this.name, this.status, this.avatarUrl, this.select = false});
}