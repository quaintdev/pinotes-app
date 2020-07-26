import 'package:grpc/grpc.dart';

class GRPCFlutterClient {
  static ClientChannel client;
  static ClientChannel getClient() {
    if (client == null) {
      client = ClientChannel("192.168.137.254",
          port: 9009,
          options: ChannelOptions(
              credentials: ChannelCredentials.insecure(),
              idleTimeout: Duration(minutes: 1)));
    }
    return client;
  }
}
