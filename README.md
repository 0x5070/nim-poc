NIM-PoC (Alpha)
English

Advanced Proof of Concept (PoC) developed in Nim, focused on polymorphism and environmental awareness to demonstrate modern cybersecurity concepts.
Features

    Polymorphism: The binary generates a unique hash on every compilation using an injected build-time seed.

    Human Interaction Detection: Implements Windows API tracking to delay execution until physical mouse movement is detected, bypassing automated sandboxes.

    Anti-VM & Anti-Analysis: Detects virtualized environments via hardware resource checks (CPU/RAM) and specific virtualization driver artifacts.

    Cross-Platform: Designed to be compiled for both Linux and Windows.

Compilation

To generate the executable for Windows:
Bash

nim c -d:mingw -d:release --opt:size --passL:-s -o:alpha_bin.exe nim_poc.nim

Español

Prueba de Concepto (PoC) avanzada desarrollada en Nim, enfocada en el polimorfismo y el reconocimiento del entorno para demostrar conceptos modernos de ciberseguridad.
Características

    Polimorfismo: El binario genera un hash único en cada compilación utilizando una semilla inyectada en tiempo de construcción.

    Detección de interacción humana: Implementa rastreo de la API de Windows para retrasar la ejecución hasta que se detecte movimiento físico del ratón, evadiendo sandboxes automáticas.

    Anti-VM y Anti-Análisis: Detecta entornos virtualizados mediante comprobaciones de recursos de hardware (CPU/RAM) y artefactos específicos de controladores de virtualización.

    Multiplataforma: Diseñado para ser compilado tanto en Linux como en Windows.

Compilación

Para generar el ejecutable para Windows:
Bash

nim c -d:mingw -d:release --opt:size --passL:-s -o:alpha_bin.exe nim_poc.nim

Disclaimer / Aviso Legal

This project was developed for educational and ethical security research purposes only. The author is not responsible for any misuse of this tool.

Este proyecto fue desarrollado exclusivamente con fines educativos y de investigación en ciberseguridad. El autor no se hace responsable del mal uso de esta herramienta.
