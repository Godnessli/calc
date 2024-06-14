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

            onClicked: function Function() {
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                var count1 = 0;
                var count2 = 0;

                for(let i = 0; i < calculation_line.text.length; ++i)
                {
                    let parenthesis = calculation_line.text[i];
                    if(parenthesis === "(") { count1++}
                    else if(parenthesis === ")") { count2++ }
                }

                if(symbol !== "+" && symbol !== "-" && symbol !== "*"
                        && symbol !== "/" && symbol !== "" && symbol1 !== "("
                        && count1 > count2) { calculation_line.text += ")"; }
                else if((symbol1 !== ")")  (symbol === "+" || symbol === "-" || symbol === "*"
                        || symbol === "/"))
                {
                    calculation_line.text += "(";
                }
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

            onClicked: function Function() {
                var check1 = calculation_line.text.lastIndexOf(" + ");
                var check2 = calculation_line.text.lastIndexOf(" - ");
                var check3 = calculation_line.text.lastIndexOf(" * ");
                var check4 = calculation_line.text.lastIndexOf(" / ");
                var my_arr;
                var num;
                var minus_num;

                if(check1 > check2 && check1 > check3 && check1 > check4)
                {
                    my_arr = calculation_line.text.split(" + ");
                    num = my_arr[my_arr.length - 1];
                    minus_num = num.padStart(num.length + 1, "-");
                    calculation_line.text.replace(num, minus_num);
                }
                else if(check2 > check3 && check2 > check4)
                {
                    my_arr = calculation_line.text.split(" - ");
                    num = my_arr[my_arr.length - 1];
                    minus_num = num.padStart(num.length + 1, "-");
                    calculation_line.text.replace(num, minus_num);
                }
                else if(check3 > check4)
                {
                    my_arr = calculation_line.text.split(" * ");
                    num = my_arr[my_arr.length - 1];
                    minus_num = num.padStart(num.length + 1, "-");
                    calculation_line.text.replace(num, minus_num);
                }
                else
                {
                    my_arr = calculation_line.text.split(" / ");
                    num = my_arr[my_arr.length - 1];
                    minus_num = num.padStart(num.length + 1, "-");
                    calculation_line.text.replace(num, minus_num);
                }
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

            onClicked: function Function() {
                var symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                if(symbol !== "+" && symbol !== "-" && symbol !== "*" && symbol !== "/")
                {
                    calculation_line.text += " / ";
                }
            }
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

            onClicked: function Function() {
                var symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                if(symbol !== "+" && symbol !== "-" && symbol !== "*" && symbol !== "/")
                {
                    calculation_line.text += " * ";
                }
            }
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

            onClicked: function Function() {
                var symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                if(symbol !== "+" && symbol !== "-" && symbol !== "*" && symbol !== "/")
                {
                    calculation_line.text += " - ";
                }
            }
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

            onClicked: function Function() {
                var symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                if(symbol !== "+" && symbol !== "-" && symbol !== "*" && symbol !== "/")
                {
                    calculation_line.text += " + ";
                }
            }
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
