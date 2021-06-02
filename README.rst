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

This looks like this:

.. image:: https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/raw/main/m5stack.jpg
   :alt: An M5Stack Core as a heart rate display

************
Requirements
************

- M5Stack Core or LilyGO TTGO T-Display ESP32
- ESPHome (development version)
- A heart rate sensor that implements the Heart Rate Measurement characteristic of Bluetooth Low Energy.

*****
Usage
*****

There are two example configurations in this repository:

- `m5stack_example.yaml <https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/blob/main/m5stack_example.yaml>`_ for the M5Stack Core
- `tdisplay_example.yaml <https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/blob/main/tdisplay_example.yaml>`_ for the TTGO T-Display ESP32

Change the ``ble_mac`` substitution to the BLE MAC address of your heart rate sensor.

Note that this configuration doesn't enable Wi-Fi because the combination of the BLE client, display and Wi-Fi components uses too much memory, resulting in a boot loop.

After this, flash the firmware to your device, e.g. with:

.. code-block:: console

  esphome esp32_example.yaml run --upload-port /dev/ttyUSB0

If you successfully created a configuration for another ESP32 board with a display, please contribute this configuration with a `pull request <https://github.com/koenvervloesem/ESPHome-Heart-Rate-Display/pulls>`_.

************************
Learn more about ESPHome
************************

If you want to learn more about ESPHome, read my book `Getting Started with ESPHome: Develop your own custom home automation devices <https://koen.vervloesem.eu/books/getting-started-with-esphome/>`_ and the accompanying GitHub repository `koenvervloesem/Getting-Started-with-ESPHome <https://github.com/koenvervloesem/Getting-Started-with-ESPHome/>`_.

*******
License
*******

This project is provided by `Koen Vervloesem <http://koen.vervloesem.eu>`_ as open source software with the MIT license. See the `LICENSE file <LICENSE>`_ for more information.

The C++/runtime codebase of the ESPHome project (file extensions .c, .cpp, .h, .hpp, .tcc, .ino) are published under the GPLv3 license. The Python codebase and all other parts of the ESPHome codebase are published under the MIT license. See the `ESPHome License <https://github.com/esphome/esphome/blob/dev/LICENSE>`_ for more information.
