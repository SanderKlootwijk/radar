/*
* Copyright (C) 2024  Sander Klootwijk
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 3.
*
* wegwijs is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.7
import Lomiri.Components 1.3
import QtQuick.Layouts 1.3

Item {
    id: precipitationChart

    width: parent.width
    height: units.gu(15)

    anchors.horizontalCenter: parent.horizontalCenter

    property alias chartCanvas: chartCanvas
    
    Canvas {
        id: chartCanvas

        anchors {
            fill: parent
            topMargin: units.gu(1)
            leftMargin: units.gu(2)
            rightMargin: units.gu(2)
            bottomMargin: units.gu(2)
        }

        onPaint: {
            var ctx = chartCanvas.getContext("2d")
            ctx.clearRect(0, 0, chartCanvas.width, chartCanvas.height)

            // Styling
            var chartWidth = chartCanvas.width
            var chartHeight = chartCanvas.height - units.gu(3)
            var maxIntensity = 100
            ctx.strokeStyle = theme.palette.normal.base

            // Draw grid lines for intensity
            for (var i = 1; i <= 3; i++) {
                ctx.lineWidth = units.dp(1)
                var y = i * ((chartHeight) / 3)
                ctx.beginPath()
                ctx.moveTo(0, y)
                ctx.lineTo(chartWidth, y)
                ctx.stroke()
            }

            // Draw vertical grid line at the beginning
            ctx.lineWidth = units.dp(2)
            ctx.beginPath()
            ctx.moveTo(0, 0)
            ctx.lineTo(0, chartHeight)
            ctx.stroke()

            // Draw vertical grid line at the end
            ctx.beginPath()
            ctx.moveTo(chartWidth, 0)
            ctx.lineTo(chartWidth, chartHeight)
            ctx.stroke()

            // Plot line and filled area
            ctx.strokeStyle = "rgba(0, 0, 0, 0)"
            ctx.fillStyle = theme.palette.normal.activity
            ctx.lineWidth = units.dp(1)
            ctx.beginPath()

            // Move to first point
            var startX = 0
            var startY = (1 - precipitationListModel.get(0).value / maxIntensity) * chartHeight
            ctx.moveTo(startX, startY)

            // Draw points from precipitationListModel
            for (var j = 0; j < precipitationListModel.count; j++) {
                var pointX = j * (chartWidth / (precipitationListModel.count - 1))
                var pointY = (1 - precipitationListModel.get(j).value / maxIntensity) * chartHeight
                ctx.lineTo(pointX, pointY)
            }

            // Close and fill area under the line
            ctx.lineTo(chartWidth, chartHeight)
            ctx.lineTo(0, chartHeight)
            ctx.closePath()
            ctx.fill()  // Fill the area under the line with blue
            ctx.stroke() // Outline the plot line on top

            // Draw time labels
            ctx.fillStyle = theme.palette.normal.baseText
            ctx.font = units.gu(1.5) + "px ubuntu"

            var totalIndices = precipitationListModel.count

            var indices = root.precipitationFor24Hours
            ? [
                Math.floor(2 / 23 * totalIndices),
                Math.floor(5 / 23 * totalIndices),
                Math.floor(8 / 23 * totalIndices),
                Math.floor(11 / 23 * totalIndices),
                Math.floor(14 / 23 * totalIndices),
                Math.floor(17 / 23 * totalIndices),
                Math.floor(20 / 23 * totalIndices)
            ]
            : [
                Math.floor(3 / 37 * totalIndices),
                Math.floor(9 / 37 * totalIndices),
                Math.floor(15 / 37 * totalIndices),
                Math.floor(21 / 37 * totalIndices),
                Math.floor(27 / 37 * totalIndices),
                Math.floor(33 / 37 * totalIndices)
            ];

            for (var k = 0; k < indices.length; k++) {
                var index = indices[k];
                if (index < precipitationListModel.count) {
                    var dateTimeString = precipitationListModel.get(index).datetime;
                    var timeString = dateTimeString.slice(11, 16); // Extract time (HH:MM) from datetime
                    
                    // Calculate label position
                    var labelX = index * (chartWidth / (precipitationListModel.count - 1));
                    var labelY = chartHeight + units.gu(2);
                    
                    // Center the label under the data point by adjusting labelX
                    ctx.fillText(timeString, labelX - ctx.measureText(timeString).width / 2, labelY);
                }
            }

            // Draw emptyText
            ctx.fillStyle = theme.palette.normal.activity;
            ctx.font = "" + units.gu(1.6) + "px ubuntu";

            // Calculate center of chart
            var centerX = chartWidth / 2;
            var centerY = chartHeight / 2;

            var centerText = root.precipitationEmpty ? i18n.tr("No precipitation expected") : "";

            ctx.fillText(centerText, centerX - ctx.measureText(centerText).width / 2, centerY + units.gu(0.5));
        }
    }

    // Redraw chart after initial startup, to ensure text is rendered
    Timer {
        interval: 1000
        running: true
        repeat: false
        onTriggered: {
            chartCanvas.requestPaint()
        }
    }
}