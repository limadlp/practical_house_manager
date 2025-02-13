import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/html.dart';

/// Cria um [WebSocketChannel] adequado para a plataforma.
/// Se for Web, usa [HtmlWebSocketChannel]; caso contrário, usa [IOWebSocketChannel].
WebSocketChannel createWebSocketChannel(String url, {Duration? pingInterval}) {
  if (kIsWeb) {
    return HtmlWebSocketChannel.connect(url);
  } else {
    return IOWebSocketChannel.connect(url, pingInterval: pingInterval);
  }
}
