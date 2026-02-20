#import "@preview/typslides:1.3.2": *

#show: typslides.with(
  ratio: "16-9",
  theme: "dusky",
  font: "FiraMono Nerd Font",
  font-size: 20pt,
  link-style: "color",
  show-progress: true,
)

#front-slide(
  title: "Raspberry Pi Crash Course",
  subtitle: "MakeMIT x Harvard",
  authors: "Colin Clark",
  info: [#link("https://colclark.net")[colclark.net]],
)

#table-of-contents()

#title-slide[
  Choosing to PI
]

#slide(title: "What's a PI?")[
  - It runs Linux :)
]

#title-slide[
  Building the PI
]

#slide(title: "Downloading software to your computer")[
  - Install Raspberry Pi Imager version 2(adds cool features like RaspiConnect)
  - Install VSCode
    - Install the *Remote - SSH extension* package to enable coding over SHH connection
]

#slide(title: "Flash the SD card")[
  - If you're using a screen, maybe pick one of the graphical options
    - Otherwise, pick a "lite" version 
  - Customisation options (heh heh, Br'ish spelling)
    - Hostname: Something fun, unique, and memorable
    - User: Something memorable (can't recover if you forgor)
    - WiFi: Use either your mobile hotspot or mine
    - Remote access: provide a public key if you have one, otherwise don't bother
  - Send it!
]

#title-slide[
  Using your PI
]

#slide(title: "Basic Linux Shenanigans")[
  - Updating your dependencies
    - `$ sudo apt update`: Update your dependency lists
    - `$ sudo apt upgrade`: Update your dependencies
  - Ensure *gpiozero* is installed:
    - `$ sudo apt install python3-gpiozero`
  - Use either Nano (if you're new) or Vim (if you're based and linux-pilled). Don't use Emacs...
    - `$ vi main.py`
    - `$ nano main.py`
]

#slide(title: "Blinking an LED")[
  - Connect the LED to pins GPIO 21 (long end) and `GND`
  == Source Code
  #framed(back-color: white)[
    ```python
    from gpiozero import LED
    from time import sleep

    led = LED(21)

    while True:
        led.on()
        sleep(1)
        led.off()
        sleep(1)
    ```
  ]
]

#slide(title: "Switching an LED")[
  - Connect the LED to pins GPIO 21 (long end) and `GND`
  - Connect the button to pins GPIO 2 and `GND`
  == Source Code
  #framed(back-color: white)[
    ```python
    from gpiozero import LED, Button
    from signal import pause

    led = LED(21)
    button = Button(2)

    button.when_pressed = led.on
    button.when_released = led.off

    pause()  
    ```
  ]
]

#title-slide[
  What next?
]
