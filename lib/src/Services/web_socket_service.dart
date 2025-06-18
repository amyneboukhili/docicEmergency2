// ignore_for_file: avoid_print

import 'dart:io';
import 'package:docicemergency2/src/Data/GlobalData.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketService {
  IOWebSocketChannel? _channel;

  Future<bool> connect({required void Function(String message) onMessage}) async {
    try {
       await GlobalData.init();
      final Map<String, dynamic>? profile = GlobalData.myprofile;
      String id =  profile!['id'].toString();
      final socket = await WebSocket.connect(
        'wss://b93d-197-20-181-148.ngrok-free.app/ws/ambulance/?id=$id',
        headers: {
          'Connection': 'upgrade',
        },
      );

      _channel = IOWebSocketChannel(socket);

      _channel!.stream.listen(
        (message) {
          print("------------------ Received from WebSocket: $message");
            onMessage(message);
          //  showEmergencyDialog();
        },
        onError: (error) {
          print("--------------------- WebSocket error: $error");
        },
        onDone: () {
          print("----------------- WebSocket connection closed");
        },
      );

      return true;
    } catch (e) {
      print("Error connecting: $e");
      return false;
    }
  }

  void send(String message) {
    if (_channel != null) {
      _channel!.sink.add(message);
    }
  }

  void disconnect() {
    _channel?.sink.close();
  }
}
