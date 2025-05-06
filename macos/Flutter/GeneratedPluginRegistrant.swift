//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import audio_session
import flutter_local_notifications
import flutter_timezone
import just_audio
import path_provider_foundation

/// Registers all generated Flutter plugins with the provided plugin registry.
///
/// This function ensures that the necessary plugins are available for use in the Flutter macOS application by registering them with the given registry.
///
/// - Parameter registry: The Flutter plugin registry to register plugins with.
func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  AudioSessionPlugin.register(with: registry.registrar(forPlugin: "AudioSessionPlugin"))
  FlutterLocalNotificationsPlugin.register(with: registry.registrar(forPlugin: "FlutterLocalNotificationsPlugin"))
  FlutterTimezonePlugin.register(with: registry.registrar(forPlugin: "FlutterTimezonePlugin"))
  JustAudioPlugin.register(with: registry.registrar(forPlugin: "JustAudioPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
}
