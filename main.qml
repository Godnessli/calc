import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: calc
    width: 360
    height: 616
    visible: true
    color: "#024873"
    title: qsTr("Calculator")

    Rectangle {
        id: input_area
        color: "#04bfad"
        height: 170;
        radius: 25;
        anchors {
            left: parent.left;
            right: parent.right;
            top: parent.top;
        }
    }

    Text {
        id: result;
        height: 60;
        z: 1;
        font.pixelSize: 50;
        text: "0";
        color: "#ffffff";
        horizontalAlignment: Text.AlignRight;
        verticalAlignment: Text.AlignVCenter;
        anchors {
            left: input_area.left;
            leftMargin: 39;
            bottom: input_area.bottom;
            bottomMargin: 30;
            right: input_area.right;
            rightMargin: 39;
        }
    }

    Text {
        id: calculation_line
        height: 30;
        z: 1;
        font.pixelSize: 20;
        color: "#ffffff";
        horizontalAlignment: Text.AlignRight;
        verticalAlignment: Text.AlignVCenter;
        anchors {
            bottom: result.top;
            bottomMargin: 10;
            left: input_area.left;
            leftMargin: 39;
            right: input_area.right;
            rightMargin: 39;
        }
    }

    Rectangle {
        width: input_area.width;
        height: input_area.height - 30;
        color: "#04bfad"
    }

    GridLayout {
        id: buttons;
        columns: 4;
        rows: 5;
        anchors {
            left: parent.left;
            leftMargin: 24
            right: parent.right;
            top: input_area.bottom;
            topMargin: 24
            bottom: parent.bottom;
            bottomMargin: 24
        }

        RoundButton {
            text: qsTr("()")
            font.family: "Open Sans Semibold"
            font.pixelSize: 24

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#f7e425" : "#0889a6";
                radius: 30
            }
        }

        RoundButton {
            text: qsTr("+/_")
            font.family: "Open Sans Semibold"
            font.pixelSize: 24

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#f7e425" : "#0889a6";
                radius: 30
            }
        }

        RoundButton {
            text: qsTr("%")
            font.family: "Open Sans Semibold"
            font.pixelSize: 24

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#f7e425" : "#0889a6";
                radius: 30
            }
        }

        RoundButton {
            text: qsTr("/")
            font.family: "Open Sans Semibold"
            font.pixelSize: 24

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#f7e425" : "#0889a6";
                radius: 30
            }

            onClicked: calculation_line.text += " / ";
        }

        RoundButton {
            Text{
                text: "7"
                font.family: "Open Sans Semibold"
                font.pixelSize: 24
                color: parent.down ? "#ffffff" : "#024873"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#04BFAD" : "#B0D1D8";
                radius: 30
            }

            onClicked: calculation_line.text += "7";
        }

        RoundButton {
            Text{
                text: "8"
                font.family: "Open Sans Semibold"
                font.pixelSize: 24
                color: parent.down ? "#ffffff" : "#024873"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#04BFAD" : "#B0D1D8";
                radius: 30
            }

            onClicked: calculation_line.text += "8";
        }

        RoundButton {
            Text{
                text: "9"
                font.family: "Open Sans Semibold"
                font.pixelSize: 24
                color: parent.down ? "#ffffff" : "#024873"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#04BFAD" : "#B0D1D8";
                radius: 30
            }
            onClicked: calculation_line.text += "9";
        }

        RoundButton {
            text: qsTr("*")
            font.family: "Open Sans Semibold"
            font.pixelSize: 24

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#f7e425" : "#0889a6";
                radius: 30
            }

            onClicked: calculation_line.text += " * ";
        }

        RoundButton {
            Text{
                text: "4"
                font.family: "Open Sans Semibold"
                font.pixelSize: 24
                color: parent.down ? "#ffffff" : "#024873"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#04BFAD" : "#B0D1D8";
                radius: 30
            }

            onClicked: calculation_line.text += "4";
        }

        RoundButton {
            Text{
                text: "5"
                font.family: "Open Sans Semibold"
                font.pixelSize: 24
                color: parent.down ? "#ffffff" : "#024873"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#04BFAD" : "#B0D1D8";
                radius: 30
            }

            onClicked: calculation_line.text += "5";
        }

        RoundButton {
            Text{
                text: "6"
                font.family: "Open Sans Semibold"
                font.pixelSize: 24
                color: parent.down ? "#ffffff" : "#024873"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#04BFAD" : "#B0D1D8";
                radius: 30
            }

            onClicked: calculation_line.text += "6";
        }

        RoundButton {
            text: qsTr("-")
            font.family: "Open Sans Semibold"
            font.pixelSize: 24

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#f7e425" : "#0889a6";
                radius: 30
            }

            onClicked: calculation_line.text += " - ";
        }

        RoundButton {
            Text{
                text: "1"
                font.family: "Open Sans Semibold"
                font.pixelSize: 24
                color: parent.down ? "#ffffff" : "#024873"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#04BFAD" : "#B0D1D8";
                radius: 30
            }

            onClicked: calculation_line.text += "1";
        }

        RoundButton {
            Text{
                text: "2"
                font.family: "Open Sans Semibold"
                font.pixelSize: 24
                color: parent.down ? "#ffffff" : "#024873"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#04BFAD" : "#B0D1D8";
                radius: 30
            }

            onClicked: calculation_line.text += "2";
        }

        RoundButton {
            Text{
                text: "3"
                font.family: "Open Sans Semibold"
                font.pixelSize: 24
                color: parent.down ? "#ffffff" : "#024873"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#04BFAD" : "#B0D1D8";
                radius: 30
            }

            onClicked: calculation_line.text += "3";
        }

        RoundButton {
            text: qsTr("+")
            font.family: "Open Sans Semibold"
            font.pixelSize: 24

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#f7e425" : "#0889a6";
                radius: 30
            }

            onClicked: calculation_line.text += " + ";
        }

        RoundButton {
            text: qsTr("C")
            font.family: "Open Sans Semibold"
            font.pixelSize: 24

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#F25E5E" : "#F8AEAE";
                radius: 30
            }

            onClicked: calculation_line.text = "";
        }

        RoundButton {
            Text{
                text: "0"
                font.family: "Open Sans Semibold"
                font.pixelSize: 24
                color: parent.down ? "#ffffff" : "#024873"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#04BFAD" : "#B0D1D8";
                radius: 30
            }

            onClicked: calculation_line.text += "0";
        }

        RoundButton {
            Text{
                text: "."
                font.family: "Open Sans Semibold"
                font.pixelSize: 24
                color: parent.down ? "#ffffff" : "#024873"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#04BFAD" : "#b0d1d8";
                radius: 30
            }
        }

        RoundButton {
            text: qsTr("=")
            font.family: "Open Sans Semibold"
            font.pixelSize: 24

            background: Rectangle {
                implicitHeight: 60
                implicitWidth: 60
                color: parent.down ? "#f7e425" : "#0889a6";
                radius: 30
            }
        }
    }
}
