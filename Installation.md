% **IDRIS Workshop - Installation**
% Carsten König
% Devopenspace Leipzig 2016

\newpage

# [Idris](http://www.idris-lang.org/)

## Windows
Ich empfehle die [Binaries](https://github.com/idris-lang/Idris-dev/wiki/Windows-Binaries) zu benutzen.

Die Dateien durch Aufruf und am Besten den Hauptpfad (in dem die `idris.exe` liegt) in die `PATH` Umgebungsvariable aufnehmen.

Ein Aufruf von `idris` aus der Eingabeaufforderung sollte dann die REPL liefern:

```
C:\>idris
     ____    __     _
    /  _/___/ /____(_)____
    / // __  / ___/ / ___/     Version 0.12.3
  _/ // /_/ / /  / (__  )      http://www.idris-lang.org/
 /___/\__,_/_/  /_/____/       Type :? for help

Idris is free software with ABSOLUTELY NO WARRANTY.
For details type :warranty.
Idris>
```

## MacOS
Leider kann ich diese Option nicht testen, es gibt aber [ein Binaries-pkg hier](http://www.idris-lang.org/pkgs/idris-current.pkg) 
und die Installation sollte der Windows-Variante ähnlich sein.

Ansonsten sollte die Linux Variante über `stack` auch funktionieren.

## Linux
Sofern ihr [`stack` (Haskell)](https://docs.haskellstack.org/en/stable/README/) installiert habt (falls nicht bitte tun), 
funktioniert das normalerweise über `LTS Haskell 6.18` ganz gut.

Dazu einfach außerhalb irgendeines Projekts `stack install` verwenden.

Mit dem aktuellen `LTS Haskell 7.1 (ghc-8.0.1)` Snapshot geht `idris-0.12.3` (die zum 23.09 aktuelle Version) direkt.

Falls ihr noch `ghc-7.10.3` verwenden möchtet, sollte das auch gehen. 
Ich hatte ein einziges Problem mit der *dependency* auf `trifecta(==1.6.*)` das ich durch gleichzeitige Installation:

    stack install trifecta-1.6 idris-0.12.3
    
beheben konnte. 

Falls ihr nicht genau wisst, wo ihr den Resolver einstellt - der steht in einer Datei `stack.yaml` in eurem *stack project-root*.
Wo dieses Verzeichnis liegt bekommt ihr einfach heraus, indem ihr `stack path` aufruft und nach `project-root` (recht weit oben) sucht.

Die Datei sieht üblicherweise so aus:

```
# This is the implicit global project's config file, which is only used when
# 'stack' is run outside of a real project.  Settings here do _not_ act as
# defaults for all projects.  To change stack's default settings, edit
# 'D:\Stack\config.yaml' instead.
#
# For more information about stack's configuration, see
# http://docs.haskellstack.org/en/stable/yaml_configuration/
#
flags: {}
extra-package-dbs: []
packages: []
extra-deps: []
resolver: lts-7.1
```

wobei ihr ganz unten den `resolver` überschreiben könnt.

Bei üblicher `stack` Installation sollten die entsprechenden Dateien automatisch in einem `PATH` Verzeichnis gelandet sein (im `local-bin`
das ihr ebenfalls über `stack path` finden könnt).

Die Dokumentation im `idris-lang/Idris-dev/wiki` auf Github scheint hier etwas veraltet zu sein - 
ich würde den Weg über `cabal install` jedenfalls nicht empfehlen.

## Atom
Das *Package* hat den Namen [`language-idris`](https://atom.io/packages/language-idris) und sollte nach Installation direkt funktionieren.
Falls nicht bitte checken, ob auführbare `idris` bzw. `idris.exe` Datei im Pfad liegt oder deren Pfad in den *Settings* des Atom-Packages
unter `Idris Location` eintragen.

## Emacs
Einfach den [`idris-mode`](https://github.com/idris-hackers/idris-mode#installation) über `package-install` von `MELPA` installieren.

### Farben unter Emacs
Ich selber benutze das `atom-dark` Theme in Emacs und da sind die Standard-*faces* für *Idris* ziemlich hässlich.

Ich selber habe die deshalb folgendermaßen angepasst:

```lips
(custom-set-faces
 ;; ...
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "adobe" :family "Hasklig"))))
 ;; ...
 '(idris-active-term-face ((t (:background "darkgray" :foreground "black"))))
 '(idris-log-level-5-face ((t (:foreground "dark violet"))))
 '(idris-log-level-higher-face ((t (:foreground "magenta"))))
 '(idris-log-timestamp-face ((t (:foreground "chocolate" :weight bold))))
 '(idris-semantic-bound-face ((t (:foreground "white smoke"))))
 '(idris-semantic-data-face ((t (:foreground "indian red"))))
 '(idris-semantic-function-face ((t (:foreground "deep sky blue"))))
 '(idris-semantic-type-face ((t (:foreground "dodger blue"))))
 ;; ...
)
```
