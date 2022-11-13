import 'package:kyan/manager/manager_address.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ManagerSocket {
  ManagerSocket._();
  static late IO.Socket socket;
  static Future<void> initSocket({int? idConversation, int? idChannel}) async {
    try {
      socket = IO.io(ManagerAddress.domain, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
        'forceNew': true,
        'reconnection': true,
        'reconnectionAttempts': 5,
        'reconnectionDelay': 5000,
        'reconnectionDelayMax': 10000,
        'timeout': 5000,
        'pingInterval': 25000,
        'pingTimeout': 60000,
        'path': '/socket.io',
        'query': {'idConversation': idConversation, 'idChannel': idChannel},
      });
      socket.connect();
      socket.on('connection', (_) {
        print('<-------------Connected socket------------->');
      });
    } catch (e) {
      print(e);
    }
  }
}
