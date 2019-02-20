#!/bin/bash

# Setup custom keyboard mappings

caps_lock="0x700000039"
left_ctrl="0x7000000E0"
left_alt="0x7000000E2"
left_cmd="0x7000000E3"

mappings=$(cat <<EOF
{"UserKeyMapping":[
        {"HIDKeyboardModifierMappingSrc":$caps_lock,"HIDKeyboardModifierMappingDst":$left_ctrl},
        {"HIDKeyboardModifierMappingSrc":$left_alt,"HIDKeyboardModifierMappingDst":$left_cmd},
        {"HIDKeyboardModifierMappingSrc":$left_cmd,"HIDKeyboardModifierMappingDst":$left_alt}
]}
EOF
)

hidutil property --set "${mappings//[$'\r\n\t']}"
