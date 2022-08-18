import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/models/status_model.dart';

List<StatusModel> statusModel = [
  StatusModel(
    time: "25",
    status: ["assets/img/status/whatsapp-status-1.jpg"],
    caption: "This is my status",
    name: "Vashnavi thakur",
  ),
  StatusModel(
    time: "5:50",
    status: [
      "assets/img/status/whatsapp-status-1.jpg",
      "assets/img/status/whatsapp-status-2.jpg",
      "assets/img/status/whatsapp-status-5.jpg",
      "assets/img/status/whatsapp-status-7.jpg",
    ],
    caption: "This is my status",
    name: 'Abhishek Gupta',
  ),
  StatusModel(
    time: "2:15",
    status: [
      "assets/img/status/whatsapp-status-1.jpg",
      "assets/img/status/whatsapp-status-4.jpg",
      "assets/img/status/whatsapp-status-6.jpg"
    ],
    caption: "This is my status",
    name: 'Viraj bisht',
  ),
  StatusModel(
      time: "14:05",
      status: [
        "assets/img/status/whatsapp-status-1.jpg",
        "assets/img/status/whatsapp-status-8.jpg",
        "assets/img/status/whatsapp-status-10.jpg",
      ],
      caption: "This is my status",
      name: "Imran"),
  StatusModel(
      time: "6:14",
      status: [
        "assets/img/status/whatsapp-status-12.jpg",
        "assets/img/status/whatsapp-status-13.jpg",
        "assets/img/status/whatsapp-status-16.jpg",
      ],
      caption: "status",
      name: "Anshul"),
];

List<ChatModel> chatModel = [
  ChatModel(
    name: "Vikram Negi",
    message: "Hey, How do you do?",
    time: "15: 20",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 1,
  ),
  ChatModel(
    name: "Vashnavi thakur",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 2,
  ),

  //   ChatModel(
  //   name : "vishwaas singh",
  //   message : "ha ha ha!!",
  //   time : "17: 17",
  //   avatarUrl : "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg", isgroup: true, id: 15,
  // ),
];
List<UserModel> userModel = [
  UserModel(
    name: "Vikram Negi",
    status: "U may call me VICTAR",
    message: "Hey, How do you do?",
    time: "15: 20",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 3,
  ),
  UserModel(
    name: "Vashnavi thakur",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 4,
  ),
  //   UserModel(
  //   name : "vishwaas singh",
  //   message : "ha ha ha!!",
  //   time : "17: 17",
  //   avatarUrl : "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg", isgroup: true, id: 5,
  // ),
  UserModel(
    name: "Abhishek Gupta",
    status: "U may call me VICTAR",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 6,
  ),
  UserModel(
    name: "Cyber wala",
    status: "At Work",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 7,
  ),
  UserModel(
    name: "Grish Singh",
    status: "Busy",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 8,
  ),
  UserModel(
    name: "Aman yadav",
    status: "Like a sun",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 9,
  ),
  UserModel(
    name: "Anshul",
    status: "Single hi hu",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 10,
  ),
  UserModel(
    name: "Diksha singh",
    status: "A for apple, b for ball duniya is goal",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 11,
  ),
  UserModel(
    name: "Imran",
    status: "..For everyone",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 12,
  ),
  UserModel(
    name: "Kritek",
    status: "Har Har Mahadev",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 13,
  ),
  UserModel(
    name: "Mayank",
    status: "The most powerful words other than I LOVE YOU vujgug hvug ",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 14,
  ),
  UserModel(
    name: "Nainsi",
    status: "Breaks your limits and outgrow yourself",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 15,
  ),
  UserModel(
    name: "Nikhil",
    status: "Konichiwa meena san",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 16,
  ),
  UserModel(
    name: "Viraj bisht",
    status: "It's only and only about me",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 17,
  ),
  UserModel(
    name: "Sarvesh",
    status: "Urgent call only",
    message: "Are you ready!!!",
    time: "17: 14",
    avatarUrl:
        "https://1.bp.blogspot.com/-W_7SWMP5Rag/YTuyV5XvtUI/AAAAAAAAuUQ/hm6bYcvlFgQqgv1uosog6K8y0dC9eglTQCLcBGAsYHQ/w1200-h630-p-k-no-nu/Best-Profile-Pic-For-Boys%2B%25281%2529.jpg",
    isgroup: false,
    id: 18,
  ),
];
