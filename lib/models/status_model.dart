class StatusModel {
  String name;
  List<String> status = [];
  String caption;
  String time;
  String avatarUrl;
  StatusModel({
    required this.name,
    required this.time,
    required this.status,
    required this.caption,
    required this.avatarUrl,
  });
}
