import QtQuick
import QtQuick.Window

Window {
    visible: true
    visibility: Window.FullScreen
    color: "#07070f"

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "INOUT OS"
            color: "#c8ff00"
            font.pixelSize: 96
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            text: "Sistema Operativo de InOut Media"
            color: "#00d4ff"
            font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            text: "Propiedad de InOut Event Systems, InOut Media"
            color: "#ff7e00"
            font.pixelSize: 21
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Shortcut {
        sequence: "Escape"
        onActivated: Qt.quit()
    }
}


