# screen-capture-ffmpeg-srt-mediamtx
Ein Windows Batch-Skript zur Bildschirmaufnahme und Übertragung des Streams über SRT mit FFmpeg zum MediaMTX Server.

# Screen Capture to SRT for MediaMTX

## Übersicht

Dieses Repository enthält ein Batch-Skript, das deinen Desktop-Bildschirm erfasst und den Stream über das SRT-Protokoll an einen MediaMTX-Server sendet. Die Konfiguration der Auflösung, Bitrate und Stream-ID erfolgt direkt im Skript.

## Voraussetzungen

- **Windows-Betriebssystem**
- **Winget**: Der Windows-Paketmanager zur Installation von FFmpeg
- **FFmpeg**: Ein leistungsfähiges Tool zur Videobearbeitung und -verarbeitung

## Installation

### 1. FFmpeg installieren

1. **Winget** verwenden, um FFmpeg zu installieren. Öffne die Eingabeaufforderung und führe den folgenden Befehl aus:

    ```bash
    winget install "FFmpeg (Essentials Build)"
    ```

2. **Überprüfen**, ob FFmpeg korrekt installiert wurde, indem du den folgenden Befehl eingibst:

    ```bash
    ffmpeg -version
    ```

    Dieser Befehl sollte die FFmpeg-Version und andere Informationen anzeigen.

### 2. Skript herunterladen

1. **Repository klonen** oder **ZIP-Datei herunterladen**. Führe den folgenden Befehl in der Eingabeaufforderung aus, um das Repository zu klonen:

    ```bash
    git clone https://github.com/DEIN_GITHUB_BENUTZERNAME/DEIN_REPOSITORY.git
    ```

2. **Wechsel in das Verzeichnis**, das das heruntergeladene Repository enthält:

    ```bash
    cd DEIN_REPOSITORY
    ```

## Konfiguration

1. **Öffne das Skript** `capture_and_stream.bat` mit einem Texteditor deiner Wahl.

2. **Konfiguriere die folgenden Variablen** am Anfang des Skripts:

    ```batch
    :: IP-Adresse des MediaMTX-Servers
    set "MEDIAMTX_SERVER_IP=DEINE_SERVER_IP"

    :: SRT-Port für MediaMTX
    set "SRT_PORT=8890"

    :: Stream-ID für MediaMTX
    set "STREAM_ID=screen01"

    :: Bildschirmauflösung (z.B. 1920x1080)
    set "VIDEO_RESOLUTION=1920x1080"

    :: Bitrate des Video-Streams (z.B. 3000k für 3 Mbps)
    set "VIDEO_BITRATE=3000k"

    :: Paketgröße für SRT-Übertragung
    set "SRT_PACKET_SIZE=1316"
    ```

3. **Speichern** die Änderungen und schließe den Editor.

## Verwendung

1. **Führe das Skript aus**, indem du die Eingabeaufforderung öffnest und zum Verzeichnis des Skripts navigierst. Dann führe den folgenden Befehl aus:

    ```bash
    capture_and_stream.bat
    ```

2. Das Skript beginnt mit der Bildschirmaufnahme und streamt die Aufnahme über SRT an den konfigurierten MediaMTX-Server.

## Häufige Fragen

### Wie kann ich sicherstellen, dass FFmpeg im PATH verfügbar ist?

Wenn der Befehl `ffmpeg` in der Eingabeaufforderung funktioniert, ist FFmpeg korrekt im System-PATH konfiguriert. Andernfalls, stelle sicher, dass die Installation von Winget erfolgreich war und FFmpeg im System-PATH liegt.

### Wie kann ich die Qualität des Streams anpassen?

Du kannst die Auflösung und Bitrate des Streams im Skript anpassen. Ändere die Werte der Variablen `VIDEO_RESOLUTION` und `VIDEO_BITRATE`, um die gewünschte Qualität einzustellen.

## Beitrag leisten

Wenn du Verbesserungen oder Änderungen an diesem Projekt vorschlagen möchtest, erstelle bitte einen **Pull-Request** oder öffne ein **Issue** auf GitHub. Dein Feedback ist willkommen!

## Lizenz

Dieses Projekt ist unter der **MIT-Lizenz** lizenziert. Siehe die [LICENSE](LICENSE) Datei für Einzelheiten.
