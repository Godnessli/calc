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

    property string current_value: "";

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
                current_value = "";
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
                        && count1 > count2) { calculation_line.text += ")"; current_value = ""; }
                else if((symbol === "+" || symbol === "-" || symbol === "*" || symbol === "/"
                        || symbol1 === "(") || (calculation_line.text.length === 0))
                {
                    current_value = "";
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
                for(let i = calculation_line.text.length - 1; i >= 0; --i)
                {
                    var count1 = 0;
                    var count2 = 0;

                    for(let i = 0; i < calculation_line.text.length; ++i)
                    {
                        let parenthesis = calculation_line.text[i];
                        if(parenthesis === "(") { count1++}
                        else if(parenthesis === ")") { count2++ }
                    }

                    var symbol = calculation_line.text[i];
                    var symbol1 = calculation_line.text[i - 1];
                    if(symbol === "*" || symbol === "+" || symbol === "-" || symbol === "/")
                    {
                        if(symbol1 !== "(")
                        {
                            let oper = calculation_line.text.slice(i + 2, calculation_line.text.length);
                            let str = calculation_line.text.slice(0, i + 2);
                            let length = oper.length;
                            let minus_oper = oper.padStart(length + 2, "(-");
                            str += minus_oper;
                            calculation_line.text = str;
                            break;
                        }
                        else if(count1 > count2)
                        {
                            let oper = calculation_line.text.slice(i - 1, calculation_line.text.length);
                            let str = calculation_line.text.slice(0, i - 1);
                            let length = oper.length;
                            let plus_oper = oper.slice(2, length);
                            str += plus_oper;
                            calculation_line.text = str;
                            break;
                        }
                        else
                        {
                            break;
                        }
                    }
                    else if(i == 0)
                    {
                        let oper = calculation_line.text.slice(0, calculation_line.text.length);
                        let str = "";
                        let minus_oper = oper.padStart(calculation_line.text.length + 2, "(-");
                        str += minus_oper;
                        calculation_line.text = str;
                        break;
                    }
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

            onClicked: function Function() {
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol !== "+" && symbol !== "-" && symbol !== "*" && symbol !== "/"
                        && symbol1 !== "(" && symbol1 !== "%" && calculation_line.text !== "0" && calculation_line.text.length !== 0)
                {
                    current_value = "";
                    calculation_line.text += "%";
                }
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
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol !== "+" && symbol !== "-" && symbol !== "*" && symbol !== "/"
                        && symbol1 !== "(" && calculation_line.text.length !== 0)
                {
                    current_value = "";
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

            onClicked: function Function() {
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol1 !== ")" && symbol1 !== "%" && current_value !== "0")
                {
                    current_value += "7";
                    calculation_line.text += "7";
                }
                else if(current_value === "0")
                {
                    calculation_line.text = calculation_line.text.slice(0, calculation_line.text.length - 1)
                    calculation_line.text += "7";
                    current_value = "7";
                }
            }
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

            onClicked: function Function() {
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol1 !== ")" && symbol1 !== "%" && current_value !== "0")
                {
                    calculation_line.text += "8";
                }
                else if(current_value === "0")
                {
                    calculation_line.text = calculation_line.text.slice(0, calculation_line.text.length - 1)
                    calculation_line.text += "8";
                    current_value = "8";
                }
            }
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

            onClicked: function Function() {
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol1 !== ")" && symbol1 !== "%" && current_value !== "0")
                {
                    calculation_line.text += "9";
                }
                else if(current_value === "0")
                {
                    calculation_line.text = calculation_line.text.slice(0, calculation_line.text.length - 1)
                    calculation_line.text += "9";
                    current_value = "9";
                }
            }
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
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol !== "+" && symbol !== "-" && symbol !== "*" && symbol !== "/"
                        && symbol1 !== "(" && calculation_line.text.length !== 0)
                {
                    current_value = "";
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

            onClicked: function Function() {
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol1 !== ")" && symbol1 !== "%" && current_value !== "0")
                {
                    calculation_line.text += "4";
                }
                else if(current_value === "0")
                {
                    calculation_line.text = calculation_line.text.slice(0, calculation_line.text.length - 1)
                    calculation_line.text += "4";
                    current_value = "4";
                }
            }
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

            onClicked: function Function() {
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol1 !== ")" && symbol1 !== "%" && current_value !== "0")
                {
                    calculation_line.text += "5";
                }
                else if(current_value === "0")
                {
                    calculation_line.text = calculation_line.text.slice(0, calculation_line.text.length - 1)
                    calculation_line.text += "5";
                    current_value = "5";
                }
            }
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

            onClicked: function Function() {
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol1 !== ")" && symbol1 !== "%" && current_value !== "0")
                {
                    calculation_line.text += "6";
                }
                else if(current_value === "0")
                {
                    calculation_line.text = calculation_line.text.slice(0, calculation_line.text.length - 1)
                    calculation_line.text += "6";
                    current_value = "6";
                }
            }
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
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol !== "+" && symbol !== "-" && symbol !== "*" && symbol !== "/"
                        && symbol1 !== "(" && calculation_line.text.length !== 0)
                {
                    current_value = "";
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

            onClicked: function Function() {
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol1 !== ")" && symbol1 !== "%" && current_value !== "0")
                {
                    calculation_line.text += "1";
                }
                else if(current_value === "0")
                {
                    calculation_line.text = calculation_line.text.slice(0, calculation_line.text.length - 1)
                    calculation_line.text += "1";
                    current_value = "1";
                }
            }
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

            onClicked: function Function() {
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol1 !== ")" && symbol1 !== "%" && current_value !== "0")
                {
                    calculation_line.text += "2";
                }
                else if(current_value === "0")
                {
                    calculation_line.text = calculation_line.text.slice(0, calculation_line.text.length - 1)
                    calculation_line.text += "2";
                    current_value = "2";
                }
            }
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

            onClicked: function Function() {
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol1 !== ")" && symbol1 !== "%" && current_value !== "0")
                {
                    calculation_line.text += "3";
                }
                else if(current_value === "0")
                {
                    calculation_line.text = calculation_line.text.slice(0, calculation_line.text.length - 1)
                    calculation_line.text += "3";
                    current_value = "3";
                }
            }
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
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol !== "+" && symbol !== "-" && symbol !== "*" && symbol !== "/"
                        && symbol1 !== "(" && calculation_line.text.length !== 0)
                {
                    current_value = "";
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

            onClicked: function Function(){
                result.text = "0";
                calculation_line.text = "";
                current_value = "";
            }
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

            onClicked: function Function() {
                let symbol = calculation_line.text.charAt(calculation_line.text.length - 2);
                let symbol1 = calculation_line.text.charAt(calculation_line.text.length - 1);
                if(symbol1 !== ")" && symbol1 !== "%" && current_value !== "0")
                {
                    current_value += "0";
                    calculation_line.text += "0";
                }
            }
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

            onClicked: function Function() {
                var arr = [];
                var operand = "";
                for(let v = 0; v < calculation_line.text.length; ++v)
                {
                    let symbol2 = calculation_line.text[v];

                    switch(symbol2)
                    {
                    case "+":
                    {
                        if(operand !== "")
                        {
                            arr.push(operand);
                            arr.push("+");
                            operand = "";
                        }
                        else
                            arr.push("+")
                        break;
                    }
                    case "-":
                    {
                        if(operand !== "")
                        {
                            arr.push(operand);
                            arr.push("-");
                            operand = "";
                        }
                        else
                            arr.push("-");
                        break;
                    }
                    case "/":
                    {
                        if(operand !== "")
                        {
                            arr.push(operand);
                            arr.push("/");
                            operand = "";
                        }
                        else
                            arr.push("/");
                        break;
                    }
                    case "*":
                    {
                        if(operand !== "")
                        {
                            arr.push(operand);
                            arr.push("*");
                            operand = "";
                        }
                        else
                            arr.push("*");
                        break
                    }
                    case "(":
                    {
                        arr.push("(");
                        break;
                    }
                    case ")":
                    {
                        arr.push(operand);
                        arr.push(")");
                        operand = "";
                        break;
                    }
                    case " ":
                    {
                        break;
                    }
                    default:
                        operand += symbol2;
                        break;
                    }

                    if(v === calculation_line.text.length - 1)
                    {
                        arr.push(operand);
                    }
                }

                for(let z = 0; z < arr.length; ++z)
                {
                    if(arr[z].includes("%"))
                    {
                        for(let q = z; q >= 0; --q)
                        {
                            let r = 0;
                            let braces_count = 0;
                            if(arr[q] === "(" && braces_count === 0)
                            {
                                let calc_string = "";
                                for(r = q; r < z - 1; ++r)
                                {
                                    calc_string += arr[r];
                                }

                                if(arr[z - 1] === "(")
                                {
                                    for(r = 0; r < z - 2; ++r)
                                    {
                                        calc_string += arr[r];
                                    }
                                }

                                if(!calc_string.includes(")"))
                                {
                                    calc_string = calc_string.replace("(", "");
                                }

                                let left_operand = eval(calc_string);
                                arr[z] = left_operand * (arr[z].slice(0, arr[z].length - 1) / 100);

                                console.log(arr[z - 1]);
                                console.log(arr);
                                break;
                            }
                            else if(arr[q] === ")" && r !== z)
                            {
                                ++braces_count;

                                console.log(arr);
                            }
                            else if(arr[q] === "(" && braces_count > 0)
                            {
                                --braces_count;
                            }
                        }
                    }
                }

                var str = arr.toString();
                for(let i = 0; i < str.length; ++i)
                {
                    str = str.replace(",", "");
                }

                console.log(arr);
                result.text = eval(str);
            }
        }
    }
}
