//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_timezone/flutter_timezone_plugin.h>

/**
 * @brief Registers all supported Flutter plugins with the given plugin registry.
 *
 * This function ensures that the FlutterTimezonePlugin is registered and available for use within the Flutter application on Linux.
 *
 * @param registry Pointer to the Flutter plugin registry.
 */
void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) flutter_timezone_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterTimezonePlugin");
  flutter_timezone_plugin_register_with_registrar(flutter_timezone_registrar);
}
