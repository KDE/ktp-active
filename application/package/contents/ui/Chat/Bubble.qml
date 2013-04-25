import QtQuick 1.1

Item
{
   id: base
   property string color
   property alias content: bubbleItem.children
   property int direction: 0

   height: childrenRect.height

   BorderImage {
       id: bubbleItem
       height: childrenRect.height+23

       anchors.left: parent.left
       anchors.right: parent.right
       anchors.leftMargin: 10
       anchors.rightMargin: 11

       border {
           top: 7
           bottom: 7
           left: 7
           right: 7
       }

       source: "../../images/Resources/images/"+base.color+"Curves.png"
   }

   Image {
       source: "../../images/Resources/images/"+base.color+"Indicator.png"
       anchors {
           left: base.left
           bottom : base.bottom
           bottomMargin: 7
       }
       visible: base.direction === 0
   }
   Image {
       source: "../../images/Resources/images/"+base.color+"Indicator2.png"
       anchors {
           right: base.right
           bottom : base.bottom
           bottomMargin: 7
       }
       visible: base.direction === 1
   }
}
