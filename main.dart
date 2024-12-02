import 'package:flutter/material.dart';

void main() => runApp(NotificationApp());

class NotificationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, String>> notificationsLeft = [
    {"type": "admin", "message": "Admin ___ zadal pokutu uživateli ___ 200 Kč."},
    {"type": "info", "message": "Máte nově zadanou pokutu. Přejít k platbě ➡"},
    {"type": "user", "message": "Uživatel ___ zaplatil pokutu 200 Kč."},
    {"type": "admin", "message": "Admin ___ zadal pokutu uživateli ___ 200 Kč."},
  ];

  List<Map<String, String>> notificationsRight = [
    {"message": "Uživatel ___ zaplatil pokutu 800 Kč za 2x bag a pozdní příchod."},
    {"message": "Uživatel ___ zaplatil pokutu 200 Kč za pozdní příchod."},
    {"message": "Uživatel ___ zaplatil pokutu 200 Kč za pozdní příchod."},
    {"message": "Uživatel ___ zaplatil pokutu 700 Kč za pozdní příchod a 3x sprosté slovo."},
  ];

  void removeNotification(List<Map<String, String>> notifications, int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Oznámení"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          bottom: TabBar(
            tabs: [
              Tab(text: "Member"),
              Tab(text: "Owner"),
            ],
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: [
            // Left design
            NotificationList(
              notifications: notificationsLeft,
              isDetailed: false,
              onRemove: (index) => removeNotification(notificationsLeft, index),
            ),
            // Right design
            NotificationList(
              notifications: notificationsRight,
              isDetailed: true,
              onRemove: (index) => removeNotification(notificationsRight, index),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          ],
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  final List<Map<String, String>> notifications;
  final bool isDetailed;
  final void Function(int index) onRemove;

  const NotificationList({
    required this.notifications,
    required this.isDetailed,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.lightBlueAccent,
          child: ListTile(
            contentPadding: EdgeInsets.all(16),
            title: Text(
              notification["message"]!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () => onRemove(index),
            ),
            leading: isDetailed
                ? null
                : notification["type"] == "info"
                    ? Icon(Icons.info, color: Colors.white)
                    : null,
          ),
        );
      },
    );
  }
}
