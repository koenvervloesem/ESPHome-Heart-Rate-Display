##########################
ESPHome Heart Rate Display
##########################

.. image:: https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/workflows/Build/badge.svg
   :target: https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/actions
   :alt: Continuous integration

.. image:: https://img.shields.io/github/license/koenvervloesem/ESPHome-Heart-Rate-Display.svg
   :target: https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/blob/main/LICENSE
   :alt: License

This `ESPHome <https://esphome.io/>`_ configuration builds firmware that shows the heart rate sent by a Bluetooth Low Energy heart rate sensor on the display of an M5Stack Core or LilyGO TTGO T-Display ESP32.

This looks like this on an M5Stack Core:

.. image:: https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/raw/main/m5stack.jpg
   :alt: An M5Stack Core as a heart rate display

And like this on a LilyGO TTGO T-Display ESP32:

.. image:: https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/raw/main/tdisplay.jpg
   :alt: A LilyGO TTGO T-Display ESP32 as a heart rate display

And like this on a SH1106 1.3 inch OLED display:

.. image:: https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/raw/main/sh1106.jpg
   :alt: A 1.3 inch OLED display as a heart rate display

************
Requirements
************

- M5Stack Core, LilyGO TTGO T-Display ESP32 or a 1,3 inches SH1106 OLED display and an ESP32
- ESPHome 1.19.0 or later
- A heart rate sensor that implements the Heart Rate Measurement characteristic of Bluetooth Low Energy.

***********
Limitations
***********

* This configuration doesn't enable Wi-Fi because the combination of the BLE client, display and Wi-Fi components uses too much memory, resulting in a boot loop. See issues `#1336 <https://github.com/esphome/issues/issues/1336>`_, `#1731 <https://github.com/esphome/issues/issues/1731>`_ and `#2045 <https://github.com/esphome/issues/issues/2045>`_.
* On older M5Stack Core models, the colors are inverted. See issue `#1893 <https://github.com/esphome/issues/issues/1893>`_. One solution is to copy the ``ili9341`` directory from your ESPHome installation's components directory and put it in a directory ``custom_components`` next to your YAML file. Then change the line ``this->invert_display_(true);`` in the file ``custom_components/ili9341/ili9341_display.cpp`` to ``this->invert_display_(false);``. When compiling the firmware again, ESPHome uses your custom component instead of the default one.

*****
Usage
*****

There are three example configurations in this repository:

- `m5stack_example.yaml <https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/blob/main/m5stack_example.yaml>`_ for the M5Stack Core
- `tdisplay_example.yaml <https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/blob/main/tdisplay_example.yaml>`_ for the TTGO T-Display ESP32
- `SH1106_example.yaml <https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/blob/main/SH1106_example.yaml>`_ for the OLED Display and an ESP32

Change the ``ble_mac`` substitution to the BLE MAC address of your heart rate sensor and in case you are using the SH1106 OLED Display adapt the ``node_board`` to your choice.

After this, flash the firmware to your device, e.g. with:

.. code-block:: console

  esphome run m5stack_example.yaml --device /dev/ttyUSB0

If you successfully created a configuration for another ESP32 board or another standalone display, please contribute an example configuration with a `pull request <https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/pulls>`_.

*******************
How does this work?
*******************

`ESPHome 1.18 <https://esphome.io/changelog/v1.18.0.html>`_ added support for an `ESP32 BLE Client <https://esphome.io/components/ble_client.html>`_ and a `BLE Sensor <https://esphome.io/components/sensor/ble_sensor.html>`_, which allows you to connect to Bluetooth Low Energy devices and read characteristics. This initial implementation was limited to one-byte characteristics which it interprets as ``float`` values. But thanks to `pull request #1851 (Add optional lambda to BLESensor for raw data parsing) <https://github.com/esphome/esphome/pull/1851>`_, you can also read the raw bytes, and this is available since `ESPHome 1.19 <https://esphome.io/changelog/v1.19.0.html>`_.

This ESPHome configuration makes use of these raw bytes in two ways (in `common/heart_rate.yaml <https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/blob/main/common/heart_rate.yaml>`_):

* Read the heart rate value from the second and third bytes of the Heart Rate Measurement characteristic (see the `Heart Rate Service <https://www.bluetooth.com/specifications/specs/heart-rate-service-1-0/>`_ specification).
* Read the raw bytes of the Device Name characteristic and convert it to a string, which is published to a text sensor.

************************
Learn more about ESPHome
************************

If you want to learn more about ESPHome, read my book `Getting Started with ESPHome: Develop your own custom home automation devices <https://koen.vervloesem.eu/books/getting-started-with-esphome/>`_ and the accompanying GitHub repository `koenvervloesem/Getting-Started-with-ESPHome <https://github.com/koenvervloesem/Getting-Started-with-ESPHome/>`_.

*******
License
*******

This project is provided by `Koen Vervloesem <http://koen.vervloesem.eu>`_ as open source software with the MIT license. See the `LICENSE file <LICENSE>`_ for more information.

The included Roboto font is licensed under the `Apache License, Version 2.0 <https://fonts.google.com/specimen/Roboto#license>`_.

The C++/runtime codebase of the ESPHome project (file extensions .c, .cpp, .h, .hpp, .tcc, .ino) are published under the GPLv3 license. The Python codebase and all other parts of the ESPHome codebase are published under the MIT license. See the `ESPHome License <https://github.com/esphome/esphome/blob/dev/LICENSE>`_ for more information.
