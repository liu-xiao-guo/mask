import QtQuick 2.0
import Ubuntu.Components 1.1
import QtGraphicalEffects 1.0

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "mask.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("mask")

        Flickable {
            anchors.fill: parent
            contentHeight: mypics.childrenRect.height

            Item {
                id: mypics
                width: parent.width
                height: units.gu(80)

                Image {
                    id: bug
                    height: parent.height/2
                    width: height
                    source: "images/bug.png"
                    sourceSize: Qt.size(parent.width, parent.height)
                    smooth: true
                    visible: false
                }

                Image {
                    id: bug1
                    height: parent.height/2
                    width: height
                    source: "images/bug.png"
                    anchors.top: bug.bottom
                    anchors.topMargin: units.gu(1)
                    sourceSize: Qt.size(parent.width, parent.height)
                    smooth: true
                    visible: false
                }

                Rectangle {
                    id: mask
                    anchors.margins: 10
                    width: 65
                    height: 65
                    color: "black"
                    radius: width/2
                    clip: true
                    visible: false
                }

                Image {
                    id: mask1
                    height: units.gu(40)
                    width: height
                    source: "images/bufferfly.png"
                    sourceSize: Qt.size(parent.width, parent.height)
                    smooth: true
                    visible: false
                }

                OpacityMask {
                    anchors.fill: bug
                    source: bug
                    maskSource: mask
                }

                OpacityMask {
                    anchors.fill: bug1
                    source: bug
                    maskSource: mask1
                }
            }
        }
    }
}

