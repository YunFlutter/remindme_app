//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_timezone/flutter_timezone_plugin_c_api.h>
#include <permission_handler_windows/permission_handler_windows_plugin.h>

/**
 * @brief Registers Flutter plugins with the provided plugin registry on Windows.
 *
 * Registers the Flutter Timezone and Permission Handler plugins so they can be used within the Flutter application.
 *
 * @param registry Pointer to the Flutter plugin registry where plugins will be registered.
 */
void RegisterPlugins(flutter::PluginRegistry* registry) {
  FlutterTimezonePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterTimezonePluginCApi"));
  PermissionHandlerWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
}
